import 'package:equatable/equatable.dart';
import 'package:xmanager/src/shared/domain/entities/device_program_entity.dart';

class TrainingProgramState extends Equatable {
  final List<DeviceProgramEntity> programs;
  final DeviceProgramEntity? selectedProgram;

  const TrainingProgramState({
    this.programs = const [],
    this.selectedProgram,
  });

  TrainingProgramState copyWith() {
    return const TrainingProgramState();
  }

  @override
  List<Object?> get props => [
        programs,
        selectedProgram,
      ];
}

class ProgramInitialState extends TrainingProgramState {
  const ProgramInitialState();
}
