abstract class PermissionsRepository {
  Future<bool> locationPermissionGranted();
  Future<void> requestLocationPermission();
  Future<bool> bluetoothPermissionGranted();
  Future<void> requestBluetoothPermission();
  Future<bool> bluetoothConnectPermissionGranted();
  Future<void> requestBluetoothConnectPermission();
  Future<bool> bluetoothScanPermissionGranted();
  Future<void> requestBluetoothScanPermission();
}
