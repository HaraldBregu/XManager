import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class InitialUserState extends UserState {}

class LoadingUserState extends UserState {}

class UserAuthorizedState extends UserState {
  final String fullname;

  const UserAuthorizedState({required this.fullname});

  @override
  List<Object?> get props => [fullname];
}

class UserUnAuthorizedState extends UserState {}
