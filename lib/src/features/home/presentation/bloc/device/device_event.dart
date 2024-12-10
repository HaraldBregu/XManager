import 'package:equatable/equatable.dart';
import 'package:xmanager/src/shared/domain/entities/device_entity.dart';

abstract class DeviceEvent extends Equatable {
  const DeviceEvent();
}

class DeviceStartEvent extends DeviceEvent {
  @override
  List<Object?> get props => [];
}

class DeviceSelectEvent extends DeviceEvent {
  final String uuid;

  const DeviceSelectEvent(this.uuid);

  @override
  List<Object?> get props => [uuid];
}

class ConnectToDevice extends DeviceEvent {
  final String deviceUuid;
  final String serviceUuid;
  final String characteristicUuid;
  final List<int> value;
  final bool withoutResponse;

  const ConnectToDevice(
    this.deviceUuid,
    this.serviceUuid,
    this.characteristicUuid,
    this.value,
    this.withoutResponse,
  );

  @override
  List<Object?> get props => [
        deviceUuid,
        serviceUuid,
        characteristicUuid,
        value,
        withoutResponse,
      ];
}

class DisconnectFromDevice extends DeviceEvent {
  final String uuid;

  const DisconnectFromDevice(this.uuid);

  @override
  List<Object?> get props => [uuid];
}

class GetDevices extends DeviceEvent {
  const GetDevices();

  @override
  List<Object?> get props => [];
}

class SelectDevice extends DeviceEvent {
  final DeviceEntity device;
  const SelectDevice(this.device);

  @override
  List<Object?> get props => [device];
}
