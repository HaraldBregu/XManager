import 'package:equatable/equatable.dart';
import 'package:xmanager/src/shared/domain/entities/device_program_entity.dart';

class ProgramState extends Equatable {
  final List<DeviceProgramEntity> programs;

  const ProgramState({
    this.programs = const [],
  });

  ProgramState copyWith({
    List<DeviceProgramEntity>? programs,
    DeviceProgramEntity? program,
  }) {
    return ProgramState(
      programs: programs ?? this.programs,
    );
  }

  @override
  List<Object?> get props => [programs];
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
