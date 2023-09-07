import 'package:permission_handler/permission_handler.dart';

abstract class PermissionsDataSource {
  Future<List<Permission>> permissionList();
  Future<PermissionStatus> permissionStatus(Permission permission);
  Future<PermissionStatus> requestPermission(Permission permission);
  Future<PermissionStatus> requestLocationPermission();
  Future<bool> locationPermissionGranted();
  Future<PermissionStatus> requestBluetoothPermission();
  Future<bool> bluetoothPermissionGranted();
  Future<PermissionStatus> requestBluetoothConnectPermission();
  Future<bool> bluetoothConnectPermissionGranted();
  Future<PermissionStatus> requestBluetoothScanPermission();
  Future<bool> bluetoothScanPermissionGranted();

  //permission.isDenied
  //permission.isGranted
  //permission.isLimited
  //permission.isPermanentlyDenied
  //permission.isRestricted
}

class PermissionsDataSourceImpl implements PermissionsDataSource {
  PermissionsDataSourceImpl();

  @override
  Future<List<Permission>> permissionList() async {
    return Permission.values;
  }

  @override
  Future<PermissionStatus> permissionStatus(Permission permission) {
    return permission.status;
  }
  
  @override
  Future<PermissionStatus> requestPermission(Permission permission) {
    return permission.request();
  }
  
  @override
  Future<PermissionStatus> requestLocationPermission() async {
    return Permission.location.request();
  }

  @override
  Future<bool> locationPermissionGranted() async {
    return Permission.location.isGranted;
  }

  @override
  Future<PermissionStatus> requestBluetoothPermission() {
    return Permission.bluetooth.request();
  }

  @override
  Future<bool> bluetoothPermissionGranted() async {
    return Permission.bluetooth.isGranted;
  }

  @override
  Future<PermissionStatus> requestBluetoothConnectPermission() async {
    return Permission.bluetoothConnect.request();
  }

  @override
  Future<bool> bluetoothConnectPermissionGranted() async {
    return Permission.bluetoothConnect.isGranted;
  }

  @override
  Future<bool> bluetoothScanPermissionGranted() {
    return Permission.bluetoothScan.isGranted;
  }

  @override
  Future<PermissionStatus> requestBluetoothScanPermission() {
    return Permission.bluetoothScan.request();
  }
  
}
