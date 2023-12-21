import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/domain/usecases/auth_current_usecase.dart';
import 'package:xmanager/src/core/domain/usecases/auth_login_usecase.dart';
import 'package:xmanager/src/core/domain/usecases/auth_logout_usecase.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/presentation/bloc/auth/auth_event.dart';
import 'package:xmanager/src/presentation/bloc/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthLogInUseCase authLogInUseCase;
  final AuthCurrentUseCase authCurrentUseCase;
  final AuthLogOutUseCase authLogOutUseCase;

  AuthBloc({
    required this.authLogInUseCase,
    required this.authCurrentUseCase,
    required this.authLogOutUseCase,
  }) : super(AuthInitialState()) {
    on<AuthEventInitial>(_onInitialEvent);
    on<LogInEvent>(_onLogInEvent);
    on<LogOutEvent>(_onLogOutEvent);
  }

  Future<void> _onInitialEvent(
    AuthEventInitial event,
    Emitter<AuthState> emit,
  ) async {
    final authCurrent = await authCurrentUseCase.call(NoParams());
    authCurrent.fold(
      (l) {
        print("############## UNauthenticated");
        emit(AuthUnAuthenticatedState());
      },
      (r) {
        print("############## AUthenticated");
        emit(AuthAuthenticatedState());
      },
    );
  }

  Future<void> _onLogInEvent(
    LogInEvent event,
    Emitter<AuthState> emit,
  ) async {
    final authLoginUsecase = await authLogInUseCase.call(
      LoginParams(
        email: event.email,
        password: event.password,
      ),
    );
    authLoginUsecase.fold(
      (l) => emit(AuthUnAuthenticatedState()),
      (r) => emit(AuthAuthenticatedState()),
    );
  }

  Future<void> _onLogOutEvent(
    LogOutEvent event,
    Emitter<AuthState> emit,
  ) async {
    final success = await authLogOutUseCase.call(NoParams());
    if (success) {
      emit(AuthUnAuthenticatedState());
    }
  }
}
