import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ble_spike/ble/scan/cubit/scan_cubit.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  Future<void> _scan(BuildContext context) async {
    context.read<ScanCubit>().startScan();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('BLE Spike')),
    body: BlocBuilder<ScanCubit, ScanState>(
      builder: (context, state) {
        return state.map(
          idle: (_) => const Center(child: Text('Press search to scan')),
          scanning: (s) => ListView.builder(
            itemCount: s.devices.length,
            itemBuilder: (_, i) {
              final d = s.devices[i];
              return ListTile(
                title: Text(d.name.isEmpty ? '(unknown)' : d.name),
                subtitle: Text('${d.id} • RSSI ${d.rssi}'),
                onTap: () {
                  context.push('/device/${d.id}?name=${Uri.encodeComponent(d.name)}');
                },
              );
            },
          ),
          error: (e) => Center(child: Text('Error: ${e.message}')),
        );
      },
    ),
    floatingActionButton: BlocBuilder<ScanCubit, ScanState>(
      builder: (context, state) {
        final isScanning = state.maybeMap(scanning: (_) => true, orElse: () => false);
        return FloatingActionButton(
          onPressed: isScanning ? null : () => _scan(context),
          child: Icon(isScanning ? Icons.stop : Icons.search),
        );
      },
    ),
  );
}
