abstract class AuthEvent {}

class AuthEventInitial extends AuthEvent {}

class LogInEvent extends AuthEvent {
  final String email;
  final String password;

  LogInEvent({
    required this.email,
    required this.password,
  });
}

class LogOutEvent extends AuthEvent {}
