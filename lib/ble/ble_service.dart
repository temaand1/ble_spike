import 'package:ble_spike/ble/models/ble_device.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

abstract class BleService {
  Stream<List<BleDevice>> scanForDevices({Duration timeout});
  Future<void> stopScan();
  Future<void> connect(String deviceId, {Duration timeout});
  Future<int?> readBattery(String deviceId); // 0x180F → 0x2A19
  Future<void> disconnect(String deviceId);
}

class FlutterBluePlusBleService implements BleService {
  @override
  Stream<List<BleDevice>> scanForDevices({Duration timeout = const Duration(seconds: 10)}) {
    FlutterBluePlus.startScan(timeout: timeout);
    return FlutterBluePlus.scanResults.map((rs) => rs.map(BleDevice.fromScanResult).toList());
  }

  @override
  Future<void> stopScan() => FlutterBluePlus.stopScan();

  @override
  Future<void> connect(String deviceId, {Duration timeout = const Duration(seconds: 10)}) =>
      BluetoothDevice.fromId(deviceId).connect(timeout: timeout, license: License.nonprofit);

  @override
  Future<int?> readBattery(String deviceId) async {
    final device = BluetoothDevice.fromId(deviceId);
    final services = await device.discoverServices();
    for (final s in services) {
      if (s.uuid.str.toLowerCase().contains('180f')) {
        for (final c in s.characteristics) {
          if (c.uuid.str.toLowerCase().contains('2a19')) {
            final bytes = await c.read();
            return bytes.isNotEmpty ? bytes.first : null;
          }
        }
      }
    }
    return null;
  }

  @override
  Future<void> disconnect(String deviceId) => BluetoothDevice.fromId(deviceId).disconnect();
}
