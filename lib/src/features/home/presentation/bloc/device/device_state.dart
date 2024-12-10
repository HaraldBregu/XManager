import 'package:equatable/equatable.dart';
import 'package:xmanager/src/shared/domain/entities/device_entity.dart';

class DeviceState extends Equatable {
  final List<DeviceEntity> devices;
  final List<DeviceEntity> selectedDevices;
  final DeviceEntity? selectedDevice;
  final String? uuid;
  final List<int>? password;

  const DeviceState({
    this.devices = const [],
    this.selectedDevices = const [],
    this.selectedDevice,
    this.uuid,
    this.password,
  });

  DeviceState copyWith({
    List<DeviceEntity>? devices,
    List<DeviceEntity>? selectedDevices,
    DeviceEntity? selectedDevice,
    String? uuid,
    List<int>? password,
  }) {
    return DeviceState(
      devices: devices ?? this.devices,
      selectedDevices: selectedDevices ?? this.selectedDevices,
      selectedDevice: selectedDevice ?? this.selectedDevice,
      uuid: uuid ?? this.uuid,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [
        devices,
        selectedDevices,
        selectedDevice,
        uuid,
        password,
      ];
}

class DeviceInitial extends DeviceState {
  const DeviceInitial();
}

class DeviceCanConnectState extends DeviceState {
  const DeviceCanConnectState({super.uuid});
}

class DeviceConnecting extends DeviceState {
  const DeviceConnecting();
}

class DeviceConnectionErrorState extends DeviceState {
  const DeviceConnectionErrorState();
}

class PermissionsDeniedState extends DeviceState {
  const PermissionsDeniedState();
}

class PermissionsPermanentlyDeniedState extends DeviceState {
  const PermissionsPermanentlyDeniedState();
}

class DeviceConnected extends DeviceState {
  const DeviceConnected();
}

class DeviceDisconnected extends DeviceState {
  const DeviceDisconnected();
}

class GetDevicesLoading extends DeviceState {
  const GetDevicesLoading();
}

class GetDevicesSuccess extends DeviceState {
  const GetDevicesSuccess({super.devices});
}

class GetDevicesFailure extends DeviceState {
  const GetDevicesFailure();
}
