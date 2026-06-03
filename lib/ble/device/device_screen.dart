import 'package:ble_spike/ble/device/cubit/device_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceScreen extends StatelessWidget {
  final String deviceId;
  final String deviceName;

  const DeviceScreen({required this.deviceId, required this.deviceName, super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(deviceName.isEmpty ? 'Device $deviceId' : deviceName)),
    body: BlocBuilder<DeviceCubit, DeviceState>(
      builder: (context, state) {
        return state.map(
          connecting: (_) => const Center(child: CircularProgressIndicator()),
          connected: (s) => Column(
            children: [
              if (s.batteryLevel != null)
                ListTile(leading: const Icon(Icons.battery_full), title: Text('Battery: ${s.batteryLevel}%')),
              Expanded(
                child: ListView.builder(
                  itemCount: s.services?.length ?? 0,
                  itemBuilder: (_, i) {
                    final service = s.services?[i];
                    if (service == null) return const SizedBox.shrink();
                    return ExpansionTile(
                      title: Text('Service ${service.uuid}'),
                      children: service.characteristics
                          .map((c) => ListTile(title: Text('Char ${c.uuid}'), subtitle: Text(c.properties.toString())))
                          .toList(),
                    );
                  },
                ),
              ),
            ],
          ),
          error: (e) => Center(child: Text('Error: ${e.message}')),
        );
      },
    ),
  );
}
