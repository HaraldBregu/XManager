import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  const UserState();
  @override
  List<Object?> get props => [];
}

class UserStateInitial extends UserState {
  const UserStateInitial();
}

class UserStateLoading extends UserState {
  const UserStateLoading();
}

class UserStateAuthorized extends UserState {
  const UserStateAuthorized();
}

class UserStateUnAuthorized extends UserState {
  const UserStateUnAuthorized();
}
