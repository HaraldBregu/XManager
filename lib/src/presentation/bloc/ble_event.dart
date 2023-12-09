import 'package:equatable/equatable.dart';
import 'package:xmanager/src/core/domain/entities/bluetooth_device_entity.dart';
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

class SelectDevice extends BleEvent {
  final BluetoothDeviceEntity device;
  const SelectDevice(this.device);
  @override
  List<Object?> get props => [device];
}

class ConnectDevice extends BleEvent {
  @override
  List<Object?> get props => [];
}

class DisconnectDevice extends BleEvent {
  @override
  List<Object?> get props => [];
}

class DiscoverServices extends BleEvent {
  @override
  List<Object?> get props => [];
}

class SelectService extends BleEvent {
  final BluetoothServiceEntity service;
  const SelectService(this.service);
  @override
  List<Object?> get props => [service];
}
