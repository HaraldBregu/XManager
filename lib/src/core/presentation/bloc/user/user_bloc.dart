import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/domain/usecases/authorised_user.dart';
import 'package:xmanager/src/core/domain/usecases/current_user.dart';
import 'package:xmanager/src/core/domain/usecases/exit_user.dart';
import 'package:xmanager/src/core/domain/usecases/unlock_user.dart';
import 'package:xmanager/src/core/presentation/bloc/user/bloc.dart';
import 'package:xmanager/src/core/data_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final CurrentUserUseCase currentUserUseCase;
  final AuthorizedUserUseCase authorisedUserUseCase;
  final UnlockUserUseCase unlockUserUseCase;
  final ExitUserUseCase exitUserUseCase;

  UserBloc({
    required this.currentUserUseCase,
    required this.authorisedUserUseCase,
    required this.unlockUserUseCase,
    required this.exitUserUseCase,
  }) : super(InitialUserState()) {
    on<InitialUserEvent>(onInitialUserEvent);
    on<EnterUserEvent>(onEnterUserEvent);
    on<ExitUserEvent>(onExitUserEvent);
  }

  Stream<double> getRandomValues() async* {
    final random = Random(2);
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      yield random.nextDouble();
    }
  }

  Future<void> onInitialUserEvent(
    InitialUserEvent event,
    Emitter<UserState> emit,
  ) async {
    final dataState = await authorisedUserUseCase.call({});

    /*
    await for (final value in getRandomValues()) {
      print('1st: $value');
      emit(UserAuthorizedState(fullname: "$value"));
    }*/
  
    if (dataState is DataSuccess) {
      if (dataState.data == true) {
        final currentUser = await currentUserUseCase.call({});
        final user = currentUser.data;
        final fullname = user?.fullname ?? "";

        emit(UserAuthorizedState(fullname: fullname));
      } else {
        emit(UserUnAuthorizedState());
      }
    }
  }

  Future<void> onEnterUserEvent(
    EnterUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(LoadingUserState());

    final dataState = await unlockUserUseCase.call(
      event.fullName,
    );

    if (dataState is DataSuccess) {
      if (dataState.data == true) {
        emit(const UserAuthorizedState(fullname: "something"));
      } else {
        emit(UserUnAuthorizedState());
      }
    }
  }

  Future<void> onExitUserEvent(
    ExitUserEvent event,
    Emitter<UserState> emit,
  ) async {
    if (state is UserAuthorizedState) {
      final dataState = await exitUserUseCase.call({});
      if (dataState is DataSuccess) {
        if (dataState.data == true) {
          emit(UserUnAuthorizedState());
        } else {
          emit(const UserAuthorizedState(fullname: "something"));
        }
      }
    }
  }
}
