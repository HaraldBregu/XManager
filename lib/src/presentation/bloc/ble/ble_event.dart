import 'package:equatable/equatable.dart';

abstract class BleEvent extends Equatable {
  const BleEvent();
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

// class DiscoverServices extends BleEvent {
//   final String uuid;
//   const DiscoverServices(this.uuid);
//   @override
//   List<Object?> get props => [uuid];
// }

// class ServicesList extends BleEvent {
//   final String uuid;
//   const ServicesList(this.uuid);
//   @override
//   List<Object?> get props => [uuid];
// }

// class SelectServiceUuid extends BleEvent {
//   final String uuid;
//   const SelectServiceUuid(this.uuid);
//   @override
//   List<Object?> get props => [uuid];
// }

// class SelectCharacteristicUuid extends BleEvent {
//   final String uuid;
//   const SelectCharacteristicUuid(this.uuid);
//   @override
//   List<Object?> get props => [uuid];
// }

class BleWriteEvent extends BleEvent {
  final String deviceUuid;
  final String serviceUuid;
  final String characteristicUuid;
  final List<int> value;

  const BleWriteEvent(
    this.deviceUuid,
    this.serviceUuid,
    this.characteristicUuid,
    this.value,
  );

  @override
  List<Object?> get props => [
        deviceUuid,
        serviceUuid,
        characteristicUuid,
        value,
      ];
}
