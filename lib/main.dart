import 'package:ble_spike/ble/ble_service.dart';
import 'package:ble_spike/ble/device/cubit/device_cubit.dart';
import 'package:ble_spike/ble/scan/cubit/scan_cubit.dart';
import 'package:ble_spike/ble/scan/scan_screen.dart';
import 'package:ble_spike/ble/device/device_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final getIt = GetIt.instance;

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>
          BlocProvider(create: (context) => ScanCubit(getIt.get<BleService>()), child: const ScanScreen()),
    ),
    GoRoute(
      path: '/device/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        final name = state.uri.queryParameters['name'] ?? '';
        return BlocProvider(
          create: (context) => DeviceCubit(getIt.get<BleService>(), id),
          child: DeviceScreen(deviceId: id, deviceName: name),
        );
      },
    ),
  ],
);

void main() {
  getIt.registerLazySingleton<BleService>(() => FlutterBluePlusBleService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp.router(routerConfig: _router);
}
