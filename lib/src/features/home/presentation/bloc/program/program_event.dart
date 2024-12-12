import 'package:equatable/equatable.dart';

abstract class ProgramEvent extends Equatable {
  const ProgramEvent();
}

class GetPrograms extends ProgramEvent {
  const GetPrograms();

  @override
  List<Object?> get props => [];
}
