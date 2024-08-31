import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/presentation/screens/training_program/bloc/program_event.dart';
import 'package:xmanager/src/presentation/screens/training_program/bloc/program_state.dart';

class ProgramBloc extends Bloc<ProgramEvent, ProgramState> {
  ProgramBloc() : super(const ProgramState()) {
    on<StartProgramEvent>(_onStartProgramEvent);
  }

  Future<void> _onStartProgramEvent(
    StartProgramEvent event,
    Emitter<ProgramState> emit,
  ) async {
    emit(const ProgramInitialState());
  }
}
