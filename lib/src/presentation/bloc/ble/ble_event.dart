import 'package:equatable/equatable.dart';

abstract class BleEvent extends Equatable {
  const BleEvent();
}

class BleStartEvent extends BleEvent {
  const BleStartEvent();

  @override
  List<Object?> get props => [];
}

class StartScanning extends BleEvent {
  final int seconds;
  final List<String>? services;
  const StartScanning({
    required this.seconds,
    this.services,
  });

  @override
  List<Object?> get props => [
        seconds,
        services,
      ];
}

class StopScanning extends BleEvent {
  @override
  List<Object?> get props => [];
}

class ListenConnectionStateEvent extends BleEvent {
  final String uuid;
  const ListenConnectionStateEvent(this.uuid);

  @override
  List<Object?> get props => [uuid];
}

class ConnectDevice extends BleEvent {
  final String uuid;
  const ConnectDevice(this.uuid);
  @override
  List<Object?> get props => [uuid];
}

class ConnectAndAuthenticateDevice extends BleEvent {
  final String deviceUuid;
  final String serviceUuid;
  final String characteristicUuid;
  final List<int> value;
  final bool withoutResponse;

  const ConnectAndAuthenticateDevice(
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
class DisconnectDevice extends BleEvent {
  final String uuid;
  const DisconnectDevice(this.uuid);
  @override
  List<Object?> get props => [uuid];
}

class BleReadEvent extends BleEvent {
  final String deviceUuid;
  final String serviceUuid;
  final String characteristicUuid;

  const BleReadEvent(
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

class BleWriteEvent extends BleEvent {
  final String deviceUuid;
  final String serviceUuid;
  final String characteristicUuid;
  final List<int> value;
  final bool withoutResponse;

  const BleWriteEvent(
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

class BleSetNotificationEvent extends BleEvent {
  final String deviceUuid;
  final String serviceUuid;
  final String characteristicUuid;
  final bool enable;

  const BleSetNotificationEvent(
    this.deviceUuid,
    this.serviceUuid,
    this.characteristicUuid,
    this.enable,
  );

  @override
  List<Object?> get props => [
        deviceUuid,
        serviceUuid,
        characteristicUuid,
        enable,
      ];
}

class BleLastValueEvent extends BleEvent {
  final String deviceUuid;
  final String serviceUuid;
  final String characteristicUuid;

  const BleLastValueEvent(
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

class BleDownloadDataEvent extends BleEvent {
  const BleDownloadDataEvent();

  @override
  List<Object?> get props => [];
}
