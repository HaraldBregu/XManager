import 'package:equatable/equatable.dart';
import 'package:xmanager/src/core/enums.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class NetworkFailure extends Failure {}

class LoginFailure extends Failure {
  final LoginErrorType errorType;
  LoginFailure(this.errorType);
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class DatabaseFailure extends Failure {}

class LoginError extends Failure {}

class NoCurrentUser extends Failure {}

class NoCurrentProfile extends Failure {}

class SaveProfileError extends Failure {}

class MissingPermissionsFailure extends Failure {}

class PermissionsDeniedFailure extends Failure {}

class PermissionsPermanentlyDeniedFailure extends Failure {}

class BluetoothConnectionFailure extends Failure {}

class BluetoothDiscoverServicesFailure extends Failure {}

class BluetoothTurnOnFailure extends Failure {}

class PlatformFailure extends Failure {}
