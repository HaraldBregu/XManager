import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/usecases/auth_logout_usecase.dart';
import 'package:xmanager/src/domain/usecases/get_current_user_usecase.dart';
import 'package:xmanager/src/domain/usecases/login_with_email_usecase.dart';
import 'package:xmanager/src/presentation/bloc/user/user_event.dart';
import 'package:xmanager/src/presentation/bloc/user/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetCurrentUserUseCase currentUserUseCase;
  final LogInWithEmailUseCase logInWithEmailUseCase;
  final LogOutUserUseCase logOutUserUseCase;

  UserState get authorized => Authorized();

  UserBloc({
    required this.logInWithEmailUseCase,
    required this.logOutUserUseCase,
    required this.currentUserUseCase,
  }) : super(UserInitialState()) {
    on<StartUserEvent>(onStartUserEvent);
    on<LogInWithEmailEvent>(_onLogInWithEmailEvent);
    on<LogOutEvent>(_logoutUserEvent);
  }

  Future<void> onStartUserEvent(
    StartUserEvent event,
    Emitter<UserState> emit,
  ) async {
    final useCase = await currentUserUseCase.call(NoParams());

    useCase.fold(
      (left) => emit(UnAuthenticated()),
      (right) => emit(Authenticated()),
    );
  }

  Future<void> _onLogInWithEmailEvent(
    LogInWithEmailEvent event,
    Emitter<UserState> emit,
  ) async {
    final authLoginUsecase = await logInWithEmailUseCase.call(
      LoginParams(
        email: event.email,
        password: event.password,
      ),
    );
    authLoginUsecase.fold(
      (l) => emit(UnAuthenticated()),
      (r) => emit(Authenticated()),
    );
  }

  Future<void> _logoutUserEvent(
    LogOutEvent event,
    Emitter<UserState> emit,
  ) async {
    final success = await logOutUserUseCase.call(NoParams());
    if (success) {
      emit(UnAuthenticated());
    }
  }
}
