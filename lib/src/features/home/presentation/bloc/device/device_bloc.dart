import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/features/home/presentation/bloc/device/device_event.dart';
import 'package:xmanager/src/features/home/presentation/bloc/device/device_state.dart';
import 'package:xmanager/src/shared/domain/usecases/ble_usecases.dart';
import 'package:xmanager/src/shared/domain/usecases/get_app_permissions.dart';
import 'package:xmanager/src/shared/domain/usecases/get_devices_usecase.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  final BluetoothConnectPermissionsUseCase bleConnectPermissions;
  final BluetoothConnectUseCase bleConnect;
  final BleDisconnectDeviceUseCase bleDisconnect;
  final BleDeviceConnectedUseCase bleConnected;
  final BleDiscoverServicesUseCase bleDiscoverServices;
  final BleWriteUseCase bleWrite;
  final GetDevicesUsecase getDevicesUsecase;

  DeviceBloc({
    required this.bleConnectPermissions,
    required this.bleConnect,
    required this.bleDisconnect,
    required this.bleConnected,
    required this.bleDiscoverServices,
    required this.bleWrite,
    required this.getDevicesUsecase,
  }) : super(const DeviceState()) {
    on<DeviceStartEvent>(_onDeviceStartEvent);
    // on<DeviceSelectEvent>(_onDeviceSelectEvent);
    on<ConnectToDevice>(_onConnectToDeviceEvent);
    on<DisconnectFromDevice>(_onDisconnectFromDeviceEvent);

    on<GetDevices>(_onGetDevicesEvent);
  }

  Future<void> _onDeviceStartEvent(
    DeviceStartEvent event,
    Emitter<DeviceState> emit,
  ) async {
    emit(const DeviceInitial());
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

  // DEVICES

  Future<void> _onGetDevicesEvent(
    GetDevices event,
    Emitter<DeviceState> emit,
  ) async {
    emit(const GetDevicesLoading());

    final response = await getDevicesUsecase.call(NoParams());
    response.fold(
      (left) {
        emit(const GetDevicesFailure());
      },
      (right) {
        emit(
          GetDevicesSuccess(
            devices: right,
          ),
        );
      },
    );
  }
}
