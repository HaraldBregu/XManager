import 'package:dartz/dartz.dart';
import 'package:xmanager/src/domain/repository/application_repository.dart';
import 'package:xmanager/src/core/failures.dart';
import 'package:xmanager/src/core/usecase.dart';

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

///
/// LOCATION PERMISSIONS
///
class LocationPermissionsGrantedUseCase implements UseCase<bool, NoParams> {
  LocationPermissionsGrantedUseCase(this._appRepository);
  final ApplicationRepository _appRepository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return Right(await _appRepository.locationPermissionGranted());
  }
}

class RequestLocationPermissionsUseCase implements UseCase<bool, NoParams> {
  RequestLocationPermissionsUseCase(this._appRepository);
  final ApplicationRepository _appRepository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return Right(await _appRepository.requestLocationPermission());
  }
}

///
/// BLUETOOTH PERMISSIONS
///
class BluetoothPermissionsGrantedUseCase implements UseCase<bool, NoParams> {
  BluetoothPermissionsGrantedUseCase(this._appRepository);
  final ApplicationRepository _appRepository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return Right(await _appRepository.bluetoothPermissionGranted());
  }
}

class RequestBluetoothPermissionsUseCase implements UseCase<bool, NoParams> {
  RequestBluetoothPermissionsUseCase(this._appRepository);
  final ApplicationRepository _appRepository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return Right(await _appRepository.requestBluetoothPermission());
  }
}

///
/// BLUETOOTH CONNECT PERMISSIONS
///
class BluetoothConnectPermissionsGrantedUseCase
    implements UseCase<bool, NoParams> {
  BluetoothConnectPermissionsGrantedUseCase(this._appRepository);
  final ApplicationRepository _appRepository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return Right(await _appRepository.bluetoothConnectPermissionGranted());
  }
}

class RequestBluetoothConnectPermissionsUseCase
    implements UseCase<bool, NoParams> {
  RequestBluetoothConnectPermissionsUseCase(this._appRepository);
  final ApplicationRepository _appRepository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return Right(await _appRepository.requestBluetoothConnectPermission());
  }
}

///
/// BLUETOOTH SCAN PERMISSIONS
///
class BluetoothScanPermissionsGrantedUseCase
    implements UseCase<bool, NoParams> {
  BluetoothScanPermissionsGrantedUseCase(this._appRepository);
  final ApplicationRepository _appRepository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return Right(await _appRepository.bluetoothScanPermissionGranted());
  }
}

class RequestBluetoothScanPermissionsUseCase
    implements UseCase<bool, NoParams> {
  RequestBluetoothScanPermissionsUseCase(this._appRepository);
  final ApplicationRepository _appRepository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return Right(await _appRepository.requestBluetoothScanPermission());
  }
}
