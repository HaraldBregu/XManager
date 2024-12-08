import 'package:equatable/equatable.dart';
import 'package:xmanager/src/shared/domain/entities/device_entity.dart';
import 'package:xmanager/src/shared/domain/entities/device_program_entity.dart';
import 'package:xmanager/src/shared/domain/entities/profile_entity.dart';

abstract class DashboardState extends Equatable {
  final ProfileEntity? profile;
  final List<DeviceEntity> devices;
  final List<DeviceEntity> selectedDevices;
  final List<DeviceProgramEntity> programs;
  final DeviceProgramEntity? selectedProgram;

  const DashboardState({
    this.profile,
    this.devices = const [],
    this.selectedDevices = const [],
    this.programs = const [],
    this.selectedProgram,
  });

  @override
  List<Object?> get props => [
        profile,
        devices,
        selectedDevices,
        programs,
        selectedProgram,
      ];
}

class InitialHomeState extends DashboardState {
  const InitialHomeState();
}

class LoadingDataHomeState extends DashboardState {
  const LoadingDataHomeState();
}

//

/*
class AppPermissionsErrorState extends DashboardState {
  final AppPermissionStatus permissionState;
  const AppPermissionsErrorState({
    required super.profile,
    required super.programList,
    required this.permissionState, 
  });
}

class BluetoothConnectingState extends DashboardState {
  final DeviceProgramEntity program;
  const BluetoothConnectingState(this.program,
      {required super.profile, required super.programList});
}

class BluetoothErrorState extends DashboardState {
  const BluetoothErrorState(
      {required super.profile, required super.programList});
}

class BluetoothAuthenticationState extends DashboardState {
  const BluetoothAuthenticationState(
      {required super.profile, required super.programList});
}

class HomeDeviceConnectionErrorState extends DashboardState {
  const HomeDeviceConnectionErrorState(
      {required super.profile, required super.programList});
}

class UploadingProgramToDevicePairsState extends DashboardState {
  final bool connected;
  final bool authenticated;
  final bool uploaded;

  const UploadingProgramToDevicePairsState({
    required super.profile,
    required super.programList,
    this.connected = false,
    this.authenticated = false,
    this.uploaded = false,
  });
}

class ProgramListState extends DashboardState {
  const ProgramListState({required super.profile, required super.programList});
}

class SelectProgramState extends DashboardState {
  final DeviceProgramEntity program;
  const SelectProgramState(this.program,
      {required super.profile, required super.programList});
}

class StartUploadingState extends DashboardState {
  final DeviceProgramEntity program;
  const StartUploadingState(this.program,
      {required super.profile, required super.programList});
}
*/

// PROGRAMS

class TrainingProgramsStateLoading extends DashboardState {
  const TrainingProgramsStateLoading();
}

class TrainingProgramsStateSuccess extends DashboardState {
  const TrainingProgramsStateSuccess({
    super.programs,
  });
}

class TrainingProgramStateError extends DashboardState {
  const TrainingProgramStateError();
}

class SelectTrainingProgramState extends DashboardState {
  const SelectTrainingProgramState({
    super.programs,
    super.selectedProgram,
  });
}

// DEVICES

class DevicesLoading extends DashboardState {
  const DevicesLoading();
}

class DevicesSuccess extends DashboardState {
  const DevicesSuccess({super.devices});
}

class DevicesError extends DashboardState {
  const DevicesError();
}
