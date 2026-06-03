import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(home: const ScanScreen());
}

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});
  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  List<ScanResult> _results = [];
  StreamSubscription<List<ScanResult>>? _sub;
  StreamSubscription<BluetoothAdapterState>? _adapterStateSub;
  bool _scanning = false;

  Future<void> _scan() async {
    await [Permission.bluetoothScan, Permission.bluetoothConnect, Permission.locationWhenInUse].request();
    _adapterStateSub = FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) async {
      if (state == BluetoothAdapterState.on) {
        setState(() => _scanning = true);
        _results.clear();

        _sub?.cancel();
        _sub = FlutterBluePlus.scanResults.listen((results) {
          setState(() => _results = results);
        });

        await FlutterBluePlus.startScan(timeout: const Duration(seconds: 10));
        setState(() => _scanning = false);
      } else {
        debugPrint('BLE adapter is not powered on');
      }
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    _adapterStateSub?.cancel();
    FlutterBluePlus.stopScan();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('BLE Spike')),
    body: ListView.builder(
      itemCount: _results.length,
      itemBuilder: (_, i) {
        final r = _results[i];
        return ListTile(
          title: Text(r.device.platformName.isEmpty ? '(unknown)' : r.device.platformName),
          subtitle: Text('${r.device.remoteId} • RSSI ${r.rssi}'),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DeviceScreen(device: r.device))),
        );
      },
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: _scanning ? null : _scan,
      child: Icon(_scanning ? Icons.stop : Icons.search),
    ),
  );
}

class DeviceScreen extends StatefulWidget {
  final BluetoothDevice device;
  const DeviceScreen({super.key, required this.device});
  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  List<BluetoothService> _services = [];
  int? _batteryLevel;

  @override
  void initState() {
    super.initState();
    _connect();
  }

  Future<void> _connect() async {
    try {
      await widget.device.connect(timeout: const Duration(seconds: 10), license: License.nonprofit);
      final services = await widget.device.discoverServices();
      setState(() => _services = services);

      // Try read battery (UUID 0x180F → 0x2A19)
      for (final svc in services) {
        if (svc.uuid.str.toLowerCase().contains('180f')) {
          for (final c in svc.characteristics) {
            if (c.uuid.str.toLowerCase().contains('2a19')) {
              final bytes = await c.read();
              setState(() => _batteryLevel = bytes.first);
            }
          }
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to connect')));
      }
    }
  }

  @override
  void dispose() {
    widget.device.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(widget.device.platformName)),
    body: Column(
      children: [
        if (_batteryLevel != null)
          ListTile(leading: const Icon(Icons.battery_full), title: Text('Battery: $_batteryLevel%')),
        Expanded(
          child: ListView.builder(
            itemCount: _services.length,
            itemBuilder: (_, i) {
              final s = _services[i];
              return ExpansionTile(
                title: Text('Service ${s.uuid}'),
                children: s.characteristics
                    .map((c) => ListTile(title: Text('Char ${c.uuid}'), subtitle: Text(c.properties.toString())))
                    .toList(),
              );
            },
          ),
        ),
      ],
    ),
  );
}
