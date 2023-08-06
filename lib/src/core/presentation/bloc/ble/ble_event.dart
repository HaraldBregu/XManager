import 'package:equatable/equatable.dart';
import 'package:xmanager/src/core/domain/entities/ble_device_entity.dart';

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

class AddDevice extends BleEvent {
  final BleDeviceEntity device;
  const AddDevice(this.device);
  @override
  List<Object?> get props => [device];
}
