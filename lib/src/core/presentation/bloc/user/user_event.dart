import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class InitialUserEvent extends UserEvent {}

class EnterUserEvent extends UserEvent {
  final String fullName;
  const EnterUserEvent(this.fullName);

  @override
  List<Object?> get props => [fullName];
}

class ExitUserEvent extends UserEvent {
  const ExitUserEvent();
}
