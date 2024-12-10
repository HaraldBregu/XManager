import 'package:equatable/equatable.dart';
import 'package:xmanager/src/shared/domain/entities/device_program_entity.dart';

abstract class ProgramEvent extends Equatable {
  const ProgramEvent();
}

class GetPrograms extends ProgramEvent {
  const GetPrograms();

  @override
  List<Object?> get props => [];
}

class SelectProgram extends ProgramEvent {
  final DeviceProgramEntity program;
  const SelectProgram(this.program);

  @override
  List<Object?> get props => [program];
}
