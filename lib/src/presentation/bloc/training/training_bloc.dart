import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/usecases/get_my_training_program_list_usecase.dart';
import 'package:xmanager/src/presentation/bloc/training/training_event.dart';
import 'package:xmanager/src/presentation/bloc/training/training_state.dart';

class TrainingBloc extends Bloc<TrainingEvent, TrainingState> {
  final GetMyTrainingProgramListUsecase getMyTrainingProgramListUsecase;

  TrainingBloc({
    required this.getMyTrainingProgramListUsecase,
  }) : super(const TrainingStateInitial()) {
    on<GetMyTrainingProgramListEvent>(_onStartUserEvent);
  }

  Future<void> _onStartUserEvent(
    GetMyTrainingProgramListEvent event,
    Emitter<TrainingState> emit,
  ) async {
    final useCase = await getMyTrainingProgramListUsecase.call(NoParams());

    useCase.fold(
      (left) => emit(const TrainingStateInitial()),
      (right) => emit(const TrainingStateInitial()),
    );
  }
}
