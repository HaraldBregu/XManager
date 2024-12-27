import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/enums.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/shared/data/datasources/local/permissions_datasource.dart';
import 'package:xmanager/src/shared/domain/repository/permissions_repository.dart';

class PermissionsRepositoryImpl implements PermissionsRepository {
  final PermissionsDataSource permissionsDataSource;

  PermissionsRepositoryImpl(this.permissionsDataSource);

  @override
  Future<AppPermissionStatus> locationPermissions(bool request) async {
    if (request) {
      final granted = await permissionsDataSource.locationPermissionsRequest();
      return granted;
    }
    final status = await permissionsDataSource.locationPermissionsStatus();
    return status;
  }

  @override
  Future<AppPermissionStatus> bluetoothPermissions(bool request) async {
    if (request) {
      final granted = await permissionsDataSource.bluetoothPermissionsRequest();
      return granted;
    }
    final status = await permissionsDataSource.bluetoothPermissionsStatus();
    return status;
  }

  @override
  Future<AppPermissionStatus> bluetoothConnectPermissions(bool request) async {
    if (request) {
      final granted =
          await permissionsDataSource.bluetoothConnectPermissionsRequest();
      return granted;
    }
    final status =
        await permissionsDataSource.bluetoothConnectPermissionsStatus();
    return status;
  }

  @override
  Future<AppPermissionStatus> bluetoothScanPermissions(bool request) async {
    if (request) {
      final granted =
          await permissionsDataSource.bluetoothScanPermissionsRequest();
      return granted;
    }
    final status = await permissionsDataSource.bluetoothScanPermissionsStatus();
    return status;
  }

  @override
  Future<bool> goToSettings() async {
    return permissionsDataSource.goToSettings();
  }
  
  @override
  Future<Either<Failure, bool>> get bluetoothConnectPermissionsGranted async {
    final status =
        await permissionsDataSource.bluetoothConnectPermissionsStatus();
    switch (status) {
      case AppPermissionStatus.denied:
        return Left(PermissionsDeniedFailure());
      case AppPermissionStatus.permanentlyDenied:
        return Left(PermissionsPermanentlyDeniedFailure());
      default:
        return const Right(true);
    }
  }

  @override
  Future<Either<Failure, bool>> get bluetoothPermissionsGranted async {
    final status = await permissionsDataSource.bluetoothPermissionsStatus();
    switch (status) {
      case AppPermissionStatus.denied:
        return Left(PermissionsDeniedFailure());
      case AppPermissionStatus.permanentlyDenied:
        return Left(PermissionsPermanentlyDeniedFailure());
      default:
        return const Right(true);
    }
  }

  @override
  Future<Either<Failure, bool>> get bluetoothScanPermissionsGranted async {
    final status = await permissionsDataSource.bluetoothScanPermissionsStatus();
    switch (status) {
      case AppPermissionStatus.denied:
        return Left(PermissionsDeniedFailure());
      case AppPermissionStatus.permanentlyDenied:
        return Left(PermissionsPermanentlyDeniedFailure());
      default:
        return const Right(true);
    }
  }
}
