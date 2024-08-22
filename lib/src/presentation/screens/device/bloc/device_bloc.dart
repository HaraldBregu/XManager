import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/usecases/ble_usecases.dart';
import 'package:xmanager/src/domain/usecases/get_app_permissions.dart';
import 'package:xmanager/src/presentation/screens/device/bloc/device_event.dart';
import 'package:xmanager/src/presentation/screens/device/bloc/device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  final BluetoothConnectPermissionsUseCase bleConnectPermissions;
  final BluetoothConnectUseCase bleConnect;
  final BleDisconnectDeviceUseCase bleDisconnect;
  final BleDeviceConnectedUseCase bleConnected;
  final BleDiscoverServicesUseCase bleDiscoverServices;
  final BleWriteUseCase bleWrite;

  DeviceBloc({
    required this.bleConnectPermissions,
    required this.bleConnect,
    required this.bleDisconnect,
    required this.bleConnected,
    required this.bleDiscoverServices,
    required this.bleWrite,
  }) : super(const DeviceState()) {
    on<DeviceStartEvent>(_onDeviceStartEvent);
    on<DeviceSelectEvent>(_onDeviceSelectEvent);
    on<ConnectToDevice>(_onConnectToDeviceEvent);
    on<DisconnectFromDevice>(_onDisconnectFromDeviceEvent);
  }

  Future<void> _onDeviceStartEvent(
    DeviceStartEvent event,
    Emitter<DeviceState> emit,
  ) async {
    emit(const DeviceInitial());
  }

  Future<void> _onDeviceSelectEvent(
    DeviceSelectEvent event,
    Emitter<DeviceState> emit,
  ) async {
    emit(DeviceCanConnectState(uuid: event.uuid));

    await emit.onEach(
      bleConnected.call(event.uuid),
      onData: (connected) {
        if (connected) {
          emit(const DeviceConnected());
        } else {
          emit(const DeviceDisconnected());
        }
      },
    );
  }

  Future<void> _onConnectToDeviceEvent(
    ConnectToDevice event,
    Emitter<DeviceState> emit,
  ) async {
    emit(const DeviceConnecting());
//"E7:C8:DF:65:5B:4B"
    final connect = await bleConnect.call(event.deviceUuid);
    connect.fold(
      (left) {
        if (left is PermissionsDeniedFailure) {
          emit(const PermissionsDeniedState());
        } else if (left is PermissionsPermanentlyDeniedFailure) {
          emit(const PermissionsPermanentlyDeniedState());
        } else if (left is BluetoothConnectionFailure) {
          emit(const DeviceConnectionErrorState());
        } else {
          emit(const DeviceConnectionErrorState());
        }
      },
      (right) {
        emit(const DeviceConnected());
      },
    );

    final services = await bleDiscoverServices.call(event.deviceUuid);
    services.fold(
      (left) {
        print(left);
      },
      (right) {
        print("right");
      },
    );

    await bleWrite.call(
      BleWriteParams(
        deviceUuid: event.deviceUuid,
        serviceUuid: event.serviceUuid,
        characteristicUuid: event.characteristicUuid,
        value: event.value,
        withoutResponse: event.withoutResponse,
      ),
    );
  }

  Future<void> _onDisconnectFromDeviceEvent(
    DisconnectFromDevice event,
    Emitter<DeviceState> emit,
  ) async {
    bleDisconnect.call(event.uuid);
  }
}
