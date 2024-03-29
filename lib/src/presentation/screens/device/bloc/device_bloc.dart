import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/enums.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/usecases/ble_usecases.dart';
import 'package:xmanager/src/domain/usecases/get_app_permissions.dart';
import 'package:xmanager/src/presentation/screens/device/bloc/device_event.dart';
import 'package:xmanager/src/presentation/screens/device/bloc/device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  final BluetoothConnectPermissionsUseCase bluetoothConnectPermissions;
  final BluetoothConnectUseCase bluetoothConnect;

  DeviceBloc({
    required this.bluetoothConnectPermissions,
    required this.bluetoothConnect,
  }) : super(const DeviceState()) {
    on<DeviceStartEvent>(_onDeviceStartEvent);
    on<DeviceSelectEvent>(_onDeviceSelectEvent);
    on<DeviceConnectEvent>(_onDeviceConnectEvent);
  }

  Future<void> _onDeviceStartEvent(
    DeviceStartEvent event,
    Emitter<DeviceState> emit,
  ) async {
    emit(const DeviceRegisterState());
  }

  Future<void> _onDeviceSelectEvent(
    DeviceSelectEvent event,
    Emitter<DeviceState> emit,
  ) async {
    emit(DeviceCanConnectState(uuid: event.uuid));
  }

  Future<void> _onDeviceConnectEvent(
    DeviceConnectEvent event,
    Emitter<DeviceState> emit,
  ) async {
    if (state.uuid == null) return;
    /*
    
    check 
    - permissions
    - bluetooth activated

     */
    final connect = bluetoothConnect.call(state.uuid ?? '');
  }
}
