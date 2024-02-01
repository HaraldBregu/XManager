import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/domain/usecases/password_strength_color_usecase.dart';
import 'package:xmanager/src/domain/usecases/password_strength_perc_usecase.dart';
import 'package:xmanager/src/domain/usecases/valid_email_usecase%20copy.dart';
import 'package:xmanager/src/presentation/screens/login/bloc/login_event.dart';
import 'package:xmanager/src/presentation/screens/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ValidEmailUseCase validEmailUseCase;
  final PasswordStrengthPercUseCase passwordStrengthPercUseCase;
  final PasswordStrengthColorUseCase passwordStrengthColorUseCase;

  LoginBloc({
    required this.validEmailUseCase,
    required this.passwordStrengthPercUseCase,
    required this.passwordStrengthColorUseCase,
  }) : super(const LoginStateInitial()) {
    on<StartLoginEvent>(_onStartLoginEvent);
    on<InputEmailEvent>(_onInputEmailEvent);
    on<InputEmailFinishedEvent>(_onInputEmailFinishedEvent);
    on<InputPasswordEvent>(_onInputPasswordEvent);
    on<InputPasswordFinishedEvent>(_onInputPasswordFinishedEvent);
    on<TogglePasswordVisibilityEvent>(_onTogglePasswordVisibilityEvent);
  }

  Future<void> _onStartLoginEvent(
    StartLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginStateInitial());
  }

  Future<void> _onInputEmailEvent(
    InputEmailEvent event,
    Emitter<LoginState> emit,
  ) async {
    final validEmail = await emailIsValid(event.email);
    final validPassword = await passwordIsValid(state.password);

    emit(
      state.copyWith(
        email: event.email,
        validEmail: validEmail,
        loginButtonEnabled: validEmail && validPassword,
      ),
    );
  }

  Future<void> _onInputEmailFinishedEvent(
    InputEmailFinishedEvent event,
    Emitter<LoginState> emit,
  ) async {
    final email = state.email ?? '';
    final emailNotEmpty = email.isNotEmpty;
    final validEmail = await emailIsValid(email);
    final emailError =
        emailNotEmpty ? await emailErrorMessage(validEmail) : null;
    final validPassword = await passwordIsValid(state.password);

    emit(
      state.copyWith(
        validEmail: validEmail,
        emailError: emailError,
        loginButtonEnabled: validEmail && validPassword,
      ),
    );
  }

  Future<void> _onInputPasswordEvent(
    InputPasswordEvent event,
    Emitter<LoginState> emit,
  ) async {
    final email = state.email ?? '';
    final emailNotEmpty = email.isNotEmpty;
    final validEmail = await emailIsValid(email);
    final emailError =
        emailNotEmpty ? await emailErrorMessage(validEmail) : null;
    final validPassword = await passwordIsValid(event.password);

    emit(
      state.copyWith(
        validEmail: validEmail,
        emailError: emailError,
        password: event.password,
        loginButtonEnabled: validEmail && validPassword,
      ),
    );
  }

  Future<void> _onInputPasswordFinishedEvent(
    InputPasswordFinishedEvent event,
    Emitter<LoginState> emit,
  ) async {
    final email = state.email ?? '';
    final emailNotEmpty = email.isNotEmpty;
    final validEmail = await emailIsValid(email);
    final emailError =
        emailNotEmpty ? await emailErrorMessage(validEmail) : null;
    final validPassword = await passwordIsValid(state.password);

    emit(
      state.copyWith(
        validEmail: validEmail,
        emailError: emailError,
        password: state.password,
        loginButtonEnabled: validEmail && validPassword,
      ),
    );
  }

  Future<void> _onTogglePasswordVisibilityEvent(
    TogglePasswordVisibilityEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(
      state.copyWith(
        passwordVisible: !state.passwordVisible,
      ),
    );
  }

  Future<bool> emailIsValid(String email) => validEmailUseCase(email);
  Future<String?> emailErrorMessage(bool valid) async =>
      valid ? null : "The email address is not valid";
  Future<bool> passwordIsValid(String? password) async =>
      password != null && password.isNotEmpty;
}
