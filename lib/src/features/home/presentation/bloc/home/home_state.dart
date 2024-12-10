import 'package:equatable/equatable.dart';
import 'package:xmanager/src/shared/domain/entities/device_entity.dart';
import 'package:xmanager/src/shared/domain/entities/device_program_entity.dart';
import 'package:xmanager/src/shared/domain/entities/profile_entity.dart';

abstract class HomeState extends Equatable {
  final ProfileEntity? profile;
  final List<DeviceEntity> devices;
  final List<DeviceEntity> selectedDevices;
  final List<DeviceProgramEntity> programs;
  final DeviceProgramEntity? selectedProgram;

  const HomeState({
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

class InitialHomeState extends HomeState {
  const InitialHomeState();
}

class LoadingDataHomeState extends HomeState {
  const LoadingDataHomeState();
}

class SelectTrainingProgramState extends HomeState {
  const SelectTrainingProgramState({
    super.programs,
    super.selectedProgram,
  });
}
