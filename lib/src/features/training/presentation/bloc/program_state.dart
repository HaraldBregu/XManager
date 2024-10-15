import 'package:equatable/equatable.dart';

class ProgramState extends Equatable {
  const ProgramState();

  ProgramState copyWith() {
    return const ProgramState();
  }

  @override
  List<Object?> get props => [];
}

class ProgramInitialState extends ProgramState {
  const ProgramInitialState();
}
