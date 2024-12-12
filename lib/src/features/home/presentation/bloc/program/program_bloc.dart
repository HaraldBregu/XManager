import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/features/home/presentation/bloc/program/program_event.dart';
import 'package:xmanager/src/features/home/presentation/bloc/program/program_state.dart';
import 'package:xmanager/src/shared/domain/usecases/get_programs_usecase.dart';

class ProgramBloc extends Bloc<ProgramEvent, ProgramState> {
  final GetProgramsUseCase getProgramsUseCase;

  ProgramBloc({
    required this.getProgramsUseCase,
  }) : super(const ProgramState()) {
    on<GetPrograms>(_onGetProgramsEvent);
  }

  Future<void> _onGetProgramsEvent(
    GetPrograms event,
    Emitter<ProgramState> emit,
  ) async {
    emit(const GetProgramsLoading());

    final response = await getProgramsUseCase.call(NoParams());
    response.fold(
      (left) => emit(const GetProgramsFailure()),
      (right) => emit(GetProgramsSuccess(programs: right)),
    );
  }
}
