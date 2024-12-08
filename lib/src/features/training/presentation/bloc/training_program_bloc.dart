import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/features/training/presentation/bloc/training_program_event.dart';
import 'package:xmanager/src/features/training/presentation/bloc/training_program_state.dart';
import 'package:xmanager/src/shared/domain/usecases/get_programs_usecase.dart';

class TrainingProgramBloc
    extends Bloc<TrainingProgramEvent, TrainingProgramState> {
  final GetProgramsUseCase getProgramsUseCase;

  TrainingProgramBloc({
    required this.getProgramsUseCase,
  }) : super(const TrainingProgramState()) {}
}
