import 'package:xmanager/src/data/datasources/local/permissions_datasource.dart';
import 'package:xmanager/src/domain/repository/permissions_repository.dart';

class PermissionsRepositoryImpl implements PermissionsRepository {
  final PermissionsDataSource permissionsDataSource;

  PermissionsRepositoryImpl(this.permissionsDataSource);

  @override
  Future<bool> locationPermissionGranted() async =>
      permissionsDataSource.locationPermissionGranted();

  @override
  Future<void> requestLocationPermission() async =>
      permissionsDataSource.requestLocationPermission();

  @override
  Future<bool> bluetoothPermissionGranted() async =>
      permissionsDataSource.bluetoothPermissionGranted();

  @override
  Future<void> requestBluetoothPermission() async =>
      permissionsDataSource.requestBluetoothPermission();

  @override
  Future<bool> bluetoothConnectPermissionGranted() async =>
      permissionsDataSource.bluetoothConnectPermissionGranted();

  @override
  Future<void> requestBluetoothConnectPermission() async =>
      permissionsDataSource.requestBluetoothConnectPermission();

  @override
  Future<bool> bluetoothScanPermissionGranted() async =>
      permissionsDataSource.bluetoothScanPermissionGranted();

  @override
  Future<void> requestBluetoothScanPermission() async =>
      permissionsDataSource.requestBluetoothScanPermission();
}
