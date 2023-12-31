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

class DiscoverServicesEnded extends BleEvent {
  final List<BluetoothServiceEntity> services;
  DiscoverServicesEnded({required this.services});
  @override
  List<Object?> get props => [services];
}

class SelectService extends BleEvent {
  final BluetoothServiceEntity service;
  const SelectService(this.service);
  @override
  List<Object?> get props => [service];
}
