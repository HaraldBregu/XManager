import 'package:xmanager/src/core/enums.dart';

abstract class PermissionsRepository {
  Future<AppPermissionStatus> locationPermissions(bool request);
  Future<AppPermissionStatus> bluetoothPermissions(bool request);
  Future<AppPermissionStatus> bluetoothConnectPermissions(bool request);
  Future<AppPermissionStatus> bluetoothScanPermissions(bool request);
  Future<bool> goToSettings();
}
