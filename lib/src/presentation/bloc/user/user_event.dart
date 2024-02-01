import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class StartUserEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}

class EnterUserEvent extends UserEvent {
  final String fullName;
  const EnterUserEvent(this.fullName);

  @override
  List<Object?> get props => [fullName];
}

class LogInWithEmailEvent extends UserEvent {
  final String email;
  final String password;

  const LogInWithEmailEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

class LogOutEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}
