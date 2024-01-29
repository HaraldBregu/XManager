import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/domain/entities/application_entity.dart';

abstract class ApplicationRepository {
  Future<bool> locationPermissionGranted();
  Future<bool> requestLocationPermission();
  Future<bool> bluetoothPermissionGranted();
  Future<bool> requestBluetoothPermission();
  Future<bool> bluetoothConnectPermissionGranted();
  Future<bool> requestBluetoothConnectPermission();
  Future<bool> bluetoothScanPermissionGranted();
  Future<bool> requestBluetoothScanPermission();

  Future<Either<Failure, ApplicationEntity>> getApp();
}
