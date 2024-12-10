import 'package:equatable/equatable.dart';
import 'package:xmanager/src/shared/domain/entities/device_program_entity.dart';

class ProgramState extends Equatable {
  final List<DeviceProgramEntity> programs;
  final DeviceProgramEntity? program;

  const ProgramState({
    this.programs = const [],
    this.program,
  });

  ProgramState copyWith({
    List<DeviceProgramEntity>? programs,
    DeviceProgramEntity? program,
  }) {
    return ProgramState(
      programs: programs ?? this.programs,
      program: program ?? this.program,
    );
  }

  @override
  List<Object?> get props => [programs, program];
}

class ProgramInitialState extends ProgramState {
  const ProgramInitialState();
}

class GetProgramsLoading extends ProgramState {
  const GetProgramsLoading();
}

class GetProgramsSuccess extends ProgramState {
  const GetProgramsSuccess({super.programs});
}

class GetProgramsFailure extends ProgramState {
  const GetProgramsFailure();
}
