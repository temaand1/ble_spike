import 'dart:async';

import 'package:ble_spike/ble/ble_service.dart';
import 'package:ble_spike/ble/models/ble_device.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';

part 'scan_cubit.freezed.dart';

@freezed
sealed class ScanState with _$ScanState {
  const factory ScanState.idle() = _Idle;
  const factory ScanState.scanning(List<BleDevice> devices) = _Scanning;
  const factory ScanState.error(String message) = _Error;
}

class ScanCubit extends Cubit<ScanState> {
  ScanCubit(this._ble) : super(const ScanState.idle()) {
    requestBluetoothPermissions();
  }
  final BleService _ble;
  StreamSubscription<List<BleDevice>>? _sub;
  StreamSubscription<BluetoothAdapterState>? _adapterSub;

  void startScan() {
    if (state is _Scanning) return;
    _adapterSub?.cancel();
    _adapterSub = _ble.adapterState.listen((state) {
      if (state == BluetoothAdapterState.on) {
        _sub?.cancel();
        emit(const ScanState.scanning([]));
        _sub = _ble.scanForDevices().listen(
          (devices) => emit(ScanState.scanning(devices)),
          onError: (e) => emit(ScanState.error(e.toString())),
        );
      }
    });
  }

  void requestBluetoothPermissions() async {
    await [Permission.bluetoothScan, Permission.bluetoothConnect, Permission.locationWhenInUse].request();
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    _adapterSub?.cancel();
    _ble.stopScan();
    return super.close();
  }
}
