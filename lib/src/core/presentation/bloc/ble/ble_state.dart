import 'package:equatable/equatable.dart';
import 'package:xmanager/src/core/domain/entities/ble_device_entity.dart';


abstract class BleState extends Equatable {
  const BleState();
}

class Initial extends BleState {
  @override
  List<Object?> get props => [];
}

class Scanning extends BleState {
  final List<BleDeviceEntity> devices;

  const Scanning({
    this.devices = const [],
  });

  @override
  List<Object?> get props => [devices];
}

class EndScanning extends BleState {
  final List<BleDeviceEntity> devices;

  const EndScanning({
    this.devices = const [],
  });

  @override
  List<Object?> get props => [devices];
}
