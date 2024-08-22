import 'package:permission_handler/permission_handler.dart';
import 'package:xmanager/src/core/enums.dart';
import 'package:xmanager/src/core/error/exeptions.dart';
import 'package:xmanager/src/presentation/bloc/app/app_event.dart';

abstract class PermissionsDataSource {
  Future<List<Permission>> permissionList();

  Future<AppPermissionStatus> permissionStatus(Permission permission);
  Future<AppPermissionStatus> requestPermission(Permission permission);

  Future<AppPermissionStatus> locationPermissionsRequest();
  Future<AppPermissionStatus> locationPermissionsStatus();

  Future<AppPermissionStatus> bluetoothPermissionsRequest();
  Future<AppPermissionStatus> bluetoothPermissionsStatus();

  Future<AppPermissionStatus> bluetoothConnectPermissionsRequest();
  Future<AppPermissionStatus> bluetoothConnectPermissionsStatus();

  Future<AppPermissionStatus> bluetoothScanPermissionsRequest();
  Future<AppPermissionStatus> bluetoothScanPermissionsStatus();

  Future<bool> goToSettings();
}

class PermissionsDataSourceImpl implements PermissionsDataSource {
  PermissionsDataSourceImpl();

  @override
  Future<List<Permission>> permissionList() async => Permission.values;

  @override
  Future<AppPermissionStatus> permissionStatus(Permission permission) async {
    switch (await permission.status) {
      case PermissionStatus.denied:
        return AppPermissionStatus.denied;
      case PermissionStatus.granted:
        return AppPermissionStatus.granted;
      case PermissionStatus.restricted:
        return AppPermissionStatus.denied;
      case PermissionStatus.limited:
        return AppPermissionStatus.granted;
      case PermissionStatus.permanentlyDenied:
        return AppPermissionStatus.permanentlyDenied;
      case PermissionStatus.provisional:
        return AppPermissionStatus.granted;
    }
  }

  @override
  Future<AppPermissionStatus> requestPermission(Permission permission) async {
    final status = await permission.request();
    switch (status) {
      case PermissionStatus.denied:
        return AppPermissionStatus.denied;
      case PermissionStatus.granted:
        return AppPermissionStatus.granted;
      case PermissionStatus.restricted:
        return AppPermissionStatus.granted;
      case PermissionStatus.limited:
        return AppPermissionStatus.granted;
      case PermissionStatus.permanentlyDenied:
        return AppPermissionStatus.permanentlyDenied;
      case PermissionStatus.provisional:
        return AppPermissionStatus.granted;
    }
  }

  // LOCATION

  @override
  Future<AppPermissionStatus> locationPermissionsRequest() async {
    final statusRequest = await requestPermission(Permission.location);
    return statusRequest;
  }

  @override
  Future<AppPermissionStatus> locationPermissionsStatus() =>
      permissionStatus(Permission.location);

  // BLUETOOTH CONNECT

  @override
  Future<AppPermissionStatus> bluetoothConnectPermissionsRequest() async {
    final statusRequest = await requestPermission(Permission.bluetoothConnect);
    return statusRequest;
  }

  @override
  Future<AppPermissionStatus> bluetoothConnectPermissionsStatus() =>
      permissionStatus(Permission.bluetoothConnect);

  // BLUETOOTH

  @override
  Future<AppPermissionStatus> bluetoothPermissionsRequest() async {
    final statusRequest = await requestPermission(Permission.bluetooth);
    return statusRequest;
  }

  @override
  Future<AppPermissionStatus> bluetoothPermissionsStatus() =>
      permissionStatus(Permission.bluetooth);

  // BLUETOOTH SCAN

  @override
  Future<AppPermissionStatus> bluetoothScanPermissionsRequest() async {
    final statusRequest = await requestPermission(Permission.bluetoothScan);
    return statusRequest;
  }

  @override
  Future<AppPermissionStatus> bluetoothScanPermissionsStatus() =>
      permissionStatus(Permission.bluetoothScan);

  @override
  Future<bool> goToSettings() async {
    return openAppSettings();
  }
  
}
