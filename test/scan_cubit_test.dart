import 'package:ble_spike/ble/ble_service.dart';
import 'package:ble_spike/ble/models/ble_device.dart';
import 'package:ble_spike/ble/scan/cubit/scan_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBleService extends Mock implements BleService {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockBleService ble;

  // Same const instance is reused in stubs and expectations so list equality
  // holds (BleDevice has no value equality — see "next steps" in README).
  const device = BleDevice(id: 'AA:BB:CC', name: 'Oura Ring', rssi: -55);

  setUp(() {
    // ScanCubit's constructor requests permissions via permission_handler,
    // which hits a platform channel. Stub it so construction doesn't throw
    // in a pure unit-test environment.
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel('flutter.baseflow.com/permissions/methods'),
      (call) async {
        if (call.method == 'requestPermissions') return <int, int>{};
        if (call.method == 'checkPermissionStatus') return 1; // granted
        return null;
      },
    );

    ble = MockBleService();
    // close() calls stopScan(); keep it harmless for the mock.
    when(() => ble.stopScan()).thenAnswer((_) async {});
  });

  group('ScanCubit', () {
    test('initial state is ScanState.idle', () {
      when(() => ble.adapterState).thenAnswer((_) => const Stream.empty());

      final cubit = ScanCubit(ble);
      expect(cubit.state, const ScanState.idle());
      cubit.close();
    });

    blocTest<ScanCubit, ScanState>(
      'emits [scanning([]), scanning([device])] when adapter is on and a device is found',
      setUp: () {
        when(() => ble.adapterState)
            .thenAnswer((_) => Stream.value(BluetoothAdapterState.on));
        when(() => ble.scanForDevices())
            .thenAnswer((_) => Stream.value(const [device]));
      },
      build: () => ScanCubit(ble),
      act: (cubit) => cubit.startScan(),
      expect: () => const [
        ScanState.scanning([]),
        ScanState.scanning([device]),
      ],
    );

    blocTest<ScanCubit, ScanState>(
      'does NOT scan while the Bluetooth adapter is off',
      setUp: () {
        when(() => ble.adapterState)
            .thenAnswer((_) => Stream.value(BluetoothAdapterState.off));
        when(() => ble.scanForDevices())
            .thenAnswer((_) => Stream.value(const [device]));
      },
      build: () => ScanCubit(ble),
      act: (cubit) => cubit.startScan(),
      expect: () => const <ScanState>[],
      verify: (_) => verifyNever(() => ble.scanForDevices()),
    );

    blocTest<ScanCubit, ScanState>(
      'emits error state when the scan stream fails',
      setUp: () {
        when(() => ble.adapterState)
            .thenAnswer((_) => Stream.value(BluetoothAdapterState.on));
        when(() => ble.scanForDevices()).thenAnswer(
          (_) => Stream<List<BleDevice>>.error(Exception('scan failed')),
        );
      },
      build: () => ScanCubit(ble),
      act: (cubit) => cubit.startScan(),
      expect: () => const [
        ScanState.scanning([]),
        ScanState.error('Exception: scan failed'),
      ],
    );
  });
}
