import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BleDevice {
  const BleDevice({required this.id, required this.name, required this.rssi});

  final String id;
  final String name;
  final int rssi;

  factory BleDevice.fromScanResult(ScanResult r) => BleDevice(
    id: r.device.remoteId.str,
    name: r.device.platformName.isEmpty ? '(unknown)' : r.device.platformName,
    rssi: r.rssi,
  );
}
