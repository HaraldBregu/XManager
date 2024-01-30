import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class DatabaseFailure extends Failure {}

class LoginError extends Failure {}

class NoCurrentUser extends Failure {}

class NoCurrentProfile extends Failure {}

class SaveProfileError extends Failure {}
