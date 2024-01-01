import 'package:equatable/equatable.dart';
import 'package:xmanager/src/core/domain/entities/bluetooth_service_entity.dart';

abstract class BleEvent extends Equatable {
  const BleEvent();
}

class StartScanning extends BleEvent {
  final int seconds;
  const StartScanning({required this.seconds});
  @override
  List<Object?> get props => [seconds];
}

class StopScanning extends BleEvent {
  @override
  List<Object?> get props => [];
}

class ListenConnectionState extends BleEvent {
  final String uuid;
  const ListenConnectionState(this.uuid);

  @override
  List<Object?> get props => [uuid];
}

class ConnectDevice extends BleEvent {
  final String uuid;
  const ConnectDevice(this.uuid);
  @override
  List<Object?> get props => [uuid];
}

class DisconnectDevice extends BleEvent {
  final String uuid;
  const DisconnectDevice(this.uuid);
  @override
  List<Object?> get props => [uuid];
}

class DiscoverServices extends BleEvent {
  final String uuid;
  const DiscoverServices(this.uuid);
  @override
  List<Object?> get props => [uuid];
}

class ServicesList extends BleEvent {
  final String uuid;
  const ServicesList(this.uuid);
  @override
  List<Object?> get props => [uuid];
}

class SelectServiceUuid extends BleEvent {
  final String uuid;
  const SelectServiceUuid(this.uuid);
  @override
  List<Object?> get props => [uuid];
}

class SelectCharacteristicUuid extends BleEvent {
  final String uuid;
  const SelectCharacteristicUuid(this.uuid);
  @override
  List<Object?> get props => [uuid];
}

class BleWriteEvent extends BleEvent {
  final String deviceUuid;
  final String serviceUuid;
  final String characteristicUuid;
  const BleWriteEvent(
    this.deviceUuid,
    this.serviceUuid,
    this.characteristicUuid,
  );

  @override
  List<Object?> get props => [
        deviceUuid,
        serviceUuid,
        characteristicUuid,
      ];
}
