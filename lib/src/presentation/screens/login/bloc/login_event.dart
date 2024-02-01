import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class StartLoginEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class InputEmailEvent extends LoginEvent {
  final String email;

  const InputEmailEvent({
    required this.email,
  });

  @override
  List<Object?> get props => [email];
}

class InputEmailFinishedEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class InputPasswordEvent extends LoginEvent {
  final String password;

  const InputPasswordEvent({
    required this.password,
  });

  @override
  List<Object?> get props => [password];
}

class InputPasswordFinishedEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class TogglePasswordVisibilityEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}
