import 'package:ble_spike/ble/ble_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_cubit.freezed.dart';

@freezed
sealed class DeviceState with _$DeviceState {
  const factory DeviceState.connecting() = _Connecting;
  const factory DeviceState.connected({int? batteryLevel, List<BluetoothService>? services}) = _Connected;
  const factory DeviceState.error(String message) = _Error;
}

class DeviceCubit extends Cubit<DeviceState> {
  DeviceCubit(this._ble, this._deviceId) : super(const DeviceState.connecting()) {
    _init();
  }
  final BleService _ble;
  final String _deviceId;
 
  Future<void> _init() async {
    try {
      await _ble.connect(_deviceId);
      final battery = await _ble.readBattery(_deviceId);
      final services = await _ble.getServices(_deviceId);
      emit(DeviceState.connected(batteryLevel: battery, services: services));
    } catch (e) {
      emit(DeviceState.error(e.toString()));
    }
  }
 
  @override
  Future<void> close() {
    _ble.disconnect(_deviceId); 
    return super.close();
  }
}