import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class InitialUserState extends UserState {}

class LoadingUserState extends UserState {}

class UserAuthorizedState extends UserState {}

class UserUnAuthorizedState extends UserState {}
