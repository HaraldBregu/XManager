import 'package:equatable/equatable.dart';


class UserState extends Equatable {
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
}

class UserInitialState extends UserState {}

class LoadingUserState extends UserState {}

class Authenticated extends UserState {}

class Authorized extends UserState {}

class UnAuthorized extends UserState {}

class AuthLoadingState extends UserState {}

class UnAuthenticated extends UserState {}
