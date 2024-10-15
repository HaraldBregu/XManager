import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'program_event.dart';
import 'program_state.dart';

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
