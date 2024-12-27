import 'package:equatable/equatable.dart';
import 'package:xmanager/src/shared/domain/entities/bluetooth_device_pairs_entity.dart';
import 'package:xmanager/src/shared/domain/entities/program_entity.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class StartDashboard extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class LoadHomeDataHomeEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

// DEVICE

// class GetDevices extends HomeEvent {
//   const GetDevices();

//   @override
//   List<Object?> get props => [];
// }

// class SelectDevices extends HomeEvent {
//   final List<DeviceEntity> devices;
//   const SelectDevices(this.devices);

//   @override
//   List<Object?> get props => [devices];
// }

// PROGRAM

class HomeUploadProgramToDeviceEvent extends HomeEvent {
  final BluetoothDevicePairsEntity devicePairs;
  final ProgramEntity program;

  const HomeUploadProgramToDeviceEvent({
    required this.devicePairs,
    required this.program,
  });

  @override
  List<Object?> get props => [
        devicePairs,
        program,
      ];
}

class UploadProgramEvent extends HomeEvent {
  final ProgramEntity program;
  const UploadProgramEvent(this.program);

  @override
  List<Object?> get props => [program];
}

class StartTrainginProgramEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}
