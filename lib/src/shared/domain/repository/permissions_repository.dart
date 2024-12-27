import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/enums.dart';
import 'package:xmanager/src/core/error/failures.dart';

abstract class PermissionsRepository {
  Future<AppPermissionStatus> locationPermissions(bool request);
  Future<AppPermissionStatus> bluetoothPermissions(bool request);
  Future<AppPermissionStatus> bluetoothConnectPermissions(bool request);
  Future<AppPermissionStatus> bluetoothScanPermissions(bool request);
  Future<bool> goToSettings();

  Future<Either<Failure, bool>> get bluetoothPermissionsGranted;
  Future<Either<Failure, bool>> get bluetoothConnectPermissionsGranted;
  Future<Either<Failure, bool>> get bluetoothScanPermissionsGranted;
}
