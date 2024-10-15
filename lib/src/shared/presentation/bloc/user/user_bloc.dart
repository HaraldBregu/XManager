import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/shared/domain/usecases/auth_logout_usecase.dart';
import 'package:xmanager/src/shared/domain/usecases/get_current_user_usecase.dart';
import 'package:xmanager/src/shared/domain/usecases/login_with_email_usecase.dart';
import 'package:xmanager/src/shared/presentation/bloc/user/user_event.dart';
import 'package:xmanager/src/shared/presentation/bloc/user/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetCurrentUserUseCase currentUserUseCase;
  final LogInWithEmailUseCase logInWithEmailUseCase;
  final LogOutUserUseCase logOutUserUseCase;

  UserBloc({
    required this.logInWithEmailUseCase,
    required this.logOutUserUseCase,
    required this.currentUserUseCase,
  }) : super(UserInitialState()) {
    on<StartUserEvent>(_onStartUserEvent);
    on<LogInWithEmailEvent>(_onLogInWithEmailEvent);
    on<LogOutEvent>(_logoutUserEvent);
  }

  Future<void> _onStartUserEvent(
    StartUserEvent event,
    Emitter<UserState> emit,
  ) async {
    final useCase = await currentUserUseCase.call(NoParams());

    useCase.fold(
      (left) => emit(UserInitialState()),
      (right) => emit(UserAuthenticatedState()),
    );
  }

  Future<void> _onLogInWithEmailEvent(
    LogInWithEmailEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(UserInitialState());
    emit(UserAuthenticatingState());

    final params = LoginParams(
      email: event.email,
      password: event.password,
    );

    final authLoginUsecase = await logInWithEmailUseCase.call(params);

    authLoginUsecase.fold(
      (Failure failure) {
        if (failure is NetworkFailure) {
          emit(UserNetworkErrorState());
        } else if (failure is LoginFailure) {
          emit(UserLoginErrorState(failure.errorType));
        }
      },
      (r) => emit(UserAuthenticatedState()),
    );
  }

  Future<void> _logoutUserEvent(
    LogOutEvent event,
    Emitter<UserState> emit,
  ) async {
    logOutUserUseCase.call(NoParams());
    emit(UserInitialState());
  }
}
