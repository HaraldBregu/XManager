import 'package:equatable/equatable.dart';
import 'package:xmanager/src/shared/domain/entities/bluetooth_device_pairs_entity.dart';
import 'package:xmanager/src/shared/domain/entities/program_entity.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeStartEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

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

class ShowProgramListEvent extends HomeEvent {
  // Target device??
  const ShowProgramListEvent();

  @override
  List<Object?> get props => [];
}

class SelectProgramEvent extends HomeEvent {
  final ProgramEntity program;
  const SelectProgramEvent(this.program);

  @override
  List<Object?> get props => [program];
}

class UploadProgramEvent extends HomeEvent {
  final ProgramEntity program;
  const UploadProgramEvent(this.program);

  @override
  List<Object?> get props => [program];
}
