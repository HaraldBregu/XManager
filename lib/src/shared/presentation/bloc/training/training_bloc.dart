import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/shared/domain/usecases/get_programs_usecase.dart';
import 'package:xmanager/src/shared/presentation/bloc/training/training_event.dart';
import 'package:xmanager/src/shared/presentation/bloc/training/training_state.dart';

class TrainingBloc extends Bloc<TrainingEvent, TrainingState> {
  final GetProgramsUseCase getProgramsUsecase;

  TrainingBloc({
    required this.getProgramsUsecase,
  }) : super(const TrainingStateInitial()) {
    on<GetMyTrainingProgramListEvent>(_onStartUserEvent);
  }

  Future<void> _onStartUserEvent(
    GetMyTrainingProgramListEvent event,
    Emitter<TrainingState> emit,
  ) async {
    final useCase = await getProgramsUsecase.call(NoParams());

    useCase.fold(
      (left) => emit(const TrainingStateInitial()),
      (right) => emit(const TrainingStateInitial()),
    );
  }
}
