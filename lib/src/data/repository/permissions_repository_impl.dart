import 'package:xmanager/src/core/platform/permissions_datasource.dart';
import 'package:xmanager/src/domain/repository/permissions_repository.dart';

class PermissionsRepositoryImpl implements PermissionsRepository {
  final PermissionsDataSourceImpl permissionsDataSourceImpl;

  PermissionsRepositoryImpl({
    required this.permissionsDataSourceImpl,
  });

  @override
  Future<bool> locationPermissionGranted() async =>
      permissionsDataSourceImpl.locationPermissionGranted();

  @override
  Future<void> requestLocationPermission() async =>
      permissionsDataSourceImpl.requestLocationPermission();

  @override
  Future<bool> bluetoothPermissionGranted() async =>
      permissionsDataSourceImpl.bluetoothPermissionGranted();

  @override
  Future<void> requestBluetoothPermission() async =>
      permissionsDataSourceImpl.requestBluetoothPermission();

  @override
  Future<bool> bluetoothConnectPermissionGranted() async =>
      permissionsDataSourceImpl.bluetoothConnectPermissionGranted();

  @override
  Future<void> requestBluetoothConnectPermission() async =>
      permissionsDataSourceImpl.requestBluetoothConnectPermission();

  @override
  Future<bool> bluetoothScanPermissionGranted() async =>
      permissionsDataSourceImpl.bluetoothScanPermissionGranted();

  @override
  Future<void> requestBluetoothScanPermission() async =>
      permissionsDataSourceImpl.requestBluetoothScanPermission();
}
