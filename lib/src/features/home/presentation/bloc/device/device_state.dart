import 'package:equatable/equatable.dart';
import 'package:xmanager/src/shared/domain/entities/device_entity.dart';

class DeviceState extends Equatable {
  final List<DeviceEntity> devices;
  final DeviceEntity? device;
  final String? uuid;
  final List<int>? password;

  const DeviceState({
    this.devices = const [],
    this.device,
    this.uuid,
    this.password,
  });

  DeviceState copyWith({
    List<DeviceEntity>? devices,
    DeviceEntity? device,
    String? uuid,
    List<int>? password,
  }) {
    return DeviceState(
      devices: devices ?? this.devices,
      device: device ?? this.device,
      uuid: uuid ?? this.uuid,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [
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
