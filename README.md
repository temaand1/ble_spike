# BLE Spike — Flutter + flutter_blue_plus

A small but production-minded Flutter app that scans for nearby **Bluetooth Low Energy (BLE)** peripherals, connects to one, reads its **battery level**, and lists its GATT services.

Built as a focused spike to get hands-on with the BLE stack and to demonstrate how I structure a Flutter feature around a third-party hardware plugin — testable, with the plugin isolated from the UI.

> Tested end-to-end on a real device against live BLE peripherals (e.g. wearables / audio devices advertising the standard Battery Service).

## What it does

- **Scan** for nearby BLE devices, live-updating the list with name + RSSI
- Only scans when the **Bluetooth adapter is on** (reacts to adapter state)
- **Connect** to a selected device
- **Read battery level** via the standard Battery Service
- **Discover and list** the device's GATT services
- Handles permissions, the adapter-off case, and connection errors

## A quick BLE / GATT primer

BLE communication is organized as a tree (the **GATT** profile):

- **Service** — a logical group of related data, identified by a **UUID**. Standard ones are well-known, e.g. `0x180F` = *Battery Service*.
- **Characteristic** — a single data point inside a service, also UUID-identified, e.g. `0x2A19` = *Battery Level* (a single byte, 0–100).
- Reading the battery here means: discover services → find `0x180F` → find characteristic `0x2A19` → `read()` → take the first byte.

A mobile developer works at this **GATT / application layer** — the radio layer (PHY, frequency hopping, etc.) is handled by the OS.

## Architecture

I built the first working version flat (plugin calls directly in the widgets, `setState`) to learn how `flutter_blue_plus` behaves — its scan/connection streams and lifecycle — then **refactored** into a layered, testable structure. The commit history shows that progression.

```
lib/
  main.dart                      # DI registration (get_it) + go_router routes
  ble/
    ble_service.dart             # abstract BleService + FlutterBluePlusBleService impl
    models/
      ble_device.dart            # domain model (maps ScanResult → id/name/rssi)
    scan/
      scan_screen.dart
      cubit/scan_cubit.dart      # ScanCubit + sealed ScanState (idle/scanning/error)
    device/
      device_screen.dart
      cubit/device_cubit.dart    # DeviceCubit + sealed DeviceState (connecting/connected/error)
```

**Key decisions and why:**

- **The plugin lives behind a `BleService` interface.** `flutter_blue_plus` is wrapped in a single implementation (`FlutterBluePlusBleService`); the cubits and UI depend on the abstraction, not the plugin. This keeps the BLE layer swappable and, more importantly, makes the cubits **unit-testable with a mock service** — no real device needed in tests.
- **State is modelled with sealed (freezed) states.** `ScanState` and `DeviceState` are sealed unions, so the UI handles every case exhaustively — the compiler won't let me forget the error or connecting state.
- **A domain `BleDevice` model** is mapped from the plugin's `ScanResult`, so raw plugin types don't leak into the scan UI.
- **Lifecycle cleanup is explicit.** Scan and adapter-state subscriptions are cancelled, and the device is disconnected, in each cubit's `close()` — BLE resources outlive the widget, so this matters more than for typical app state.
- **DI via `get_it`**, navigation via `go_router` — `BleService` is a lazy singleton injected into both cubits.
- **Scope-appropriate, deliberately.** I stopped at `service + cubits`. A repository or use-case layer would be over-engineering for a two-screen spike; I'd add those seams when there's real domain logic to justify them.

## Tech stack

Flutter · Dart · `flutter_blue_plus` · `flutter_bloc` (Cubit) · `freezed` · `get_it` · `go_router` · `permission_handler`

## Running it

BLE requires a **physical device** (emulators/simulators don't expose real Bluetooth).

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # generates *.freezed.dart
flutter run
```

- **Android:** declares `BLUETOOTH_SCAN`, `BLUETOOTH_CONNECT`, and location permissions; runtime permissions are requested on launch (Android 12+).
- **iOS:** requires the Bluetooth usage description in `Info.plist`.

Have a BLE peripheral with a Battery Service nearby (many wearables/earbuds) to see the battery read end-to-end.

## What I'd do next (for production)

- **Add unit tests** for the cubits using a mock `BleService` — the interface is there specifically to enable this; it's the natural next commit.
- **Fully isolate the plugin:** a couple of `flutter_blue_plus` types (`BluetoothAdapterState`, `BluetoothService`) still reach the cubits/state — I'd map these to domain types too for complete isolation.
- Stream connection state (handle mid-session disconnects), add reconnection, and surface richer characteristic data.

---

*Built as a hands-on BLE learning spike. The flat-first → refactor progression is intentional and visible in the commit history.*
