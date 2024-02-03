import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/repository/permissions_repository.dart';

/*
class GetAppPermissionsUseCase implements UseCase<bool, NoParams> {
  GetAppPermissionsUseCase();

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class RequestAppPermissionsUseCase implements UseCase<bool, String> {
  RequestAppPermissionsUseCase();

  @override
  Future<Either<Failure, bool>> call(String params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class AppPermissionsStatusUseCase implements UseCase<bool, String> {
  AppPermissionsStatusUseCase();

  @override
  Future<Either<Failure, bool>> call(String params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
*/

///
/// LOCATION PERMISSIONS
///
class LocationPermissionsGrantedUseCase implements BaseUseCase<bool, NoParams> {
  LocationPermissionsGrantedUseCase(this._permissionsRepository);
  final PermissionsRepository _permissionsRepository;

  @override
  Future<bool> call(NoParams params) =>
      _permissionsRepository.locationPermissionGranted();
  
}

class RequestLocationPermissionsUseCase implements BaseUseCase<void, NoParams> {
  RequestLocationPermissionsUseCase(this._permissionsRepository);
  final PermissionsRepository _permissionsRepository;

  @override
  Future<void> call(NoParams params) =>
      _permissionsRepository.requestLocationPermission();
  
}

///
/// BLUETOOTH PERMISSIONS
///
class BluetoothPermissionsGrantedUseCase
    implements BaseUseCase<bool, NoParams> {
  BluetoothPermissionsGrantedUseCase(this._permissionsRepository);
  final PermissionsRepository _permissionsRepository;

  @override
  Future<bool> call(NoParams params) =>
      _permissionsRepository.bluetoothPermissionGranted();
}

class RequestBluetoothPermissionsUseCase
    implements BaseUseCase<void, NoParams> {
  RequestBluetoothPermissionsUseCase(this._permissionsRepository);
  final PermissionsRepository _permissionsRepository;

  @override
  Future<void> call(NoParams params) =>
      _permissionsRepository.requestBluetoothPermission();
}

///
/// BLUETOOTH CONNECT PERMISSIONS
///
class BluetoothConnectPermissionsGrantedUseCase
    implements BaseUseCase<bool, NoParams> {
  BluetoothConnectPermissionsGrantedUseCase(this._permissionsRepository);
  final PermissionsRepository _permissionsRepository;

  @override
  Future<bool> call(NoParams params) =>
      _permissionsRepository.bluetoothConnectPermissionGranted();
}

class RequestBluetoothConnectPermissionsUseCase
    implements BaseUseCase<void, NoParams> {
  RequestBluetoothConnectPermissionsUseCase(this._permissionsRepository);
  final PermissionsRepository _permissionsRepository;

  @override
  Future<void> call(NoParams params) =>
      _permissionsRepository.requestBluetoothConnectPermission();
}

///
/// BLUETOOTH SCAN PERMISSIONS
///
class BluetoothScanPermissionsGrantedUseCase
    implements BaseUseCase<bool, NoParams> {
  BluetoothScanPermissionsGrantedUseCase(this._permissionsRepository);
  final PermissionsRepository _permissionsRepository;

  @override
  Future<bool> call(NoParams params) =>
      _permissionsRepository.bluetoothScanPermissionGranted();
}

class RequestBluetoothScanPermissionsUseCase
    implements BaseUseCase<void, NoParams> {
  RequestBluetoothScanPermissionsUseCase(this._permissionsRepository);
  final PermissionsRepository _permissionsRepository;

  @override
  Future<void> call(NoParams params) =>
      _permissionsRepository.requestBluetoothScanPermission();
}
