import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class UserState extends Equatable {
  final bool loggedIn;
  final bool loading;

  const UserState({
    this.loggedIn = false,
    this.loading = false,
  });
  
  @override
  List<Object?> get props => [loggedIn];
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
