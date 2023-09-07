import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/domain/entities/app_entity.dart';
import 'package:xmanager/src/core/failures.dart';

abstract class AppRepository {
  Future<bool> locationPermissionGranted();
  Future<bool> requestLocationPermission();
  Future<bool> bluetoothPermissionGranted();
  Future<bool> requestBluetoothPermission();
  Future<bool> bluetoothConnectPermissionGranted();
  Future<bool> requestBluetoothConnectPermission();
  Future<bool> bluetoothScanPermissionGranted();
  Future<bool> requestBluetoothScanPermission();

  Future<Either<Failure, AppEntity>> getApp();
}
