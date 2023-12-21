import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/domain/usecases/current_user.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/presentation/bloc/user_event.dart';
import 'package:xmanager/src/presentation/bloc/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final CurrentUserUseCase currentUserUseCase;

  UserState get authorized => UserAuthorizedState();

  UserBloc({
    required this.currentUserUseCase,
  }) : super(InitialUserState()) {
    on<InitialUserEvent>(onInitialUserEvent);
    on<EnterUserEvent>(onEnterUserEvent);
    on<ExitUserEvent>(onExitUserEvent);
  }

  Future<void> onInitialUserEvent(
    InitialUserEvent event,
    Emitter<UserState> emit,
  ) async {
    final useCase = await currentUserUseCase.call(NoParams());

    useCase.fold(
      (left) => emit(UserUnAuthorizedState()),
      (right) => {
          emit(UserAuthorizedState())
      },
    );
  }

  Future<void> onEnterUserEvent(
    EnterUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(LoadingUserState());

    // final useCase = await unlockUserUseCase.call(
    //   event.fullName,
    // );

    // useCase.fold(
    //   (left) => emit(UserUnAuthorizedState()),
    //   (right) => emit(UserAuthorizedState()),
    // );
  }

  Future<void> onExitUserEvent(
    ExitUserEvent event,
    Emitter<UserState> emit,
  ) async {
    if (state is UserAuthorizedState) {
      //final dataState = await exitUserUseCase.call(NoParams());

      // if (dataState is DataSuccess) {
      //   if (dataState.data == true) {
      //     emit(UserUnAuthorizedState());
      //   } else {
      //     emit(const UserAuthorizedState(fullname: "something"));
      //   }
      // }
    }
  }
}
