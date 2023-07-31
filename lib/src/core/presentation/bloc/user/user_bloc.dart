import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/domain/usecases/authorised_user.dart';
import 'package:xmanager/src/core/domain/usecases/exit_user.dart';
import 'package:xmanager/src/core/domain/usecases/unlock_user.dart';
import 'package:xmanager/src/core/presentation/bloc/user/bloc.dart';
import 'package:xmanager/src/core/resources/data_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthorizedUserUseCase authorisedUserUseCase;
  final UnlockUserUseCase unlockUserUseCase;
  final ExitUserUseCase exitUserUseCase;

  UserBloc({
    required this.authorisedUserUseCase,
    required this.unlockUserUseCase,
    required this.exitUserUseCase,
  }) : super(const UserStateInitial()) {
    on<InitialUserEvent>(onInitialUserEvent);

    on<EnterUserEvent>(onEnterUserEvent);
    on<ExitUserEvent>(onExitUserEvent);

  }

  Future<void> onInitialUserEvent(
    InitialUserEvent event,
    Emitter<UserState> emit,
  ) async {

    final dataState = await authorisedUserUseCase.call({});

    if (dataState is DataSuccess) {
      if (dataState.data == true) {
        emit(const UserStateAuthorized());
      } else {
        emit(const UserStateUnAuthorized());
      }
    }
  }

  Future<void> onEnterUserEvent(
    EnterUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserStateLoading());

    final dataState = await unlockUserUseCase.call(
      event.fullName,
    );

    if (dataState is DataSuccess) {
      if (dataState.data == true) {
        emit(const UserStateAuthorized());
      } else {
        emit(const UserStateUnAuthorized());
      }
    }
  }

  Future<void> onExitUserEvent(
    ExitUserEvent event,
    Emitter<UserState> emit,
  ) async {
    //emit(const UserStateLoading());

    final dataState = await exitUserUseCase.call({});
    if (dataState is DataSuccess) {
      if (dataState.data == true) {
        emit(const UserStateUnAuthorized());
      } else {
        emit(const UserStateAuthorized());
      }
    }
  }

}
