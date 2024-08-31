import 'package:equatable/equatable.dart';

abstract class ProgramEvent extends Equatable {
  const ProgramEvent();
}

class StartProgramEvent extends ProgramEvent {
  @override
  List<Object?> get props => [];
}
