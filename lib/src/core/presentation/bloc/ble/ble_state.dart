import 'package:equatable/equatable.dart';
import 'package:xmanager/src/core/domain/entities/ble_device_entity.dart';

abstract class BleState extends Equatable {
  const BleState();
}

class InitialState extends BleState {
  const InitialState();

  @override
  List<Object?> get props => [];
}

class Scanning extends BleState {
  final List<BleDeviceEntity> devices;
  const Scanning(this.devices);

  @override
  List<Object?> get props => [];
}

class EndScanning extends BleState {
  final List<BleDeviceEntity> devices;
  const EndScanning(this.devices);

  @override
  List<Object?> get props => [devices];
}

// class AddingDevices extends BleState {
//   const AddingDevices({
//     required super.isScanning,
//     required super.devices,
//   });

//   @override
//   List<Object?> get props => [];
// }
