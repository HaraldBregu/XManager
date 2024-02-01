import 'package:equatable/equatable.dart';
import 'package:xmanager/src/core/enums.dart';

class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitialState extends UserState {}

class UserAuthenticatingState extends UserState {}

class UserNetworkErrorState extends UserState {}

class UserLoginErrorState extends UserState {
  final LoginErrorType type;
  const UserLoginErrorState(this.type);
}

class UserAuthenticatedState extends UserState {}

class UserRegisteringState extends UserState {}

class UserRegisteredState extends UserState {}

class UserRegistrationErrorState extends UserState {
  final LoginErrorType type;
  const UserRegistrationErrorState(this.type);
}

/*

  final String? email;
  final bool emailVerified;
  final String? phoneNumber;

  const UserState({
    this.email,
    this.emailVerified = false,
    this.phoneNumber,
  });

  UserState copyWith({
    String? email,
    bool? emailVerified,
    String? phoneNumber,
  }) =>
      UserState(
        email: email ?? this.email,
        emailVerified: emailVerified ?? this.emailVerified,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );

  @override
  List<Object?> get props => [
        email,
        emailVerified,
        phoneNumber,
      ];

 */