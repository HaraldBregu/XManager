import 'package:equatable/equatable.dart';
import 'package:xmanager/src/shared/domain/entities/bluetooth_device_pairs_entity.dart';
import 'package:xmanager/src/shared/domain/entities/device_entity.dart';
import 'package:xmanager/src/shared/domain/entities/device_program_entity.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
}

class StartDashboard extends DashboardEvent {
  @override
  List<Object?> get props => [];
}

class LoadHomeDataHomeEvent extends DashboardEvent {
  @override
  List<Object?> get props => [];
}

// DEVICE

class GetDevices extends DashboardEvent {
  const GetDevices();

  @override
  List<Object?> get props => [];
}

class SelectDevices extends DashboardEvent {
  final List<DeviceEntity> devices;
  const SelectDevices(this.devices);

  @override
  List<Object?> get props => [devices];
}

// PROGRAM

class HomeUploadProgramToDeviceEvent extends DashboardEvent {
  final BluetoothDevicePairsEntity devicePairs;
  final DeviceProgramEntity program;

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

class UploadProgramEvent extends DashboardEvent {
  final DeviceProgramEntity program;
  const UploadProgramEvent(this.program);

  @override
  List<Object?> get props => [program];
}

//
class StartTrainginProgramEvent extends DashboardEvent {
  @override
  List<Object?> get props => [];
}

class GetTrainingProgramListEvent extends DashboardEvent {
  const GetTrainingProgramListEvent();

  @override
  List<Object?> get props => [];
}

class SelectTrainingProgramEvent extends DashboardEvent {
  final DeviceProgramEntity program;
  const SelectTrainingProgramEvent(this.program);

  @override
  List<Object?> get props => [program];
}
