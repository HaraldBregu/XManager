import '../../../core/enums.dart';
import '../../../core/usecase.dart';
import '../repository/permissions_repository.dart';

///
/// LOCATION PERMISSIONS
///
class LocationPermissionsUseCase
    implements BaseUseCase<AppPermissionStatus, PermissionsParams> {
  LocationPermissionsUseCase(this._permissionsRepository);
  final PermissionsRepository _permissionsRepository;

  @override
  Future<AppPermissionStatus> call(PermissionsParams params) =>
      _permissionsRepository.locationPermissions(params.request);
}

///
/// BLUETOOTH PERMISSIONS
///
class BluetoothPermissionsUseCase
    implements BaseUseCase<AppPermissionStatus, PermissionsParams> {
  BluetoothPermissionsUseCase(this._permissionsRepository);
  final PermissionsRepository _permissionsRepository;

  @override
  Future<AppPermissionStatus> call(PermissionsParams params) =>
      _permissionsRepository.bluetoothPermissions(params.request);
}

///
/// BLUETOOTH CONNECT PERMISSIONS
///
class BluetoothConnectPermissionsUseCase
    implements BaseUseCase<AppPermissionStatus, PermissionsParams> {
  BluetoothConnectPermissionsUseCase(this._permissionsRepository);
  final PermissionsRepository _permissionsRepository;

  @override
  Future<AppPermissionStatus> call(PermissionsParams params) =>
      _permissionsRepository.bluetoothConnectPermissions(params.request);
}

///
/// BLUETOOTH SCAN PERMISSIONS
///
class BluetoothScanPermissionsUseCase
    implements BaseUseCase<AppPermissionStatus, PermissionsParams> {
  BluetoothScanPermissionsUseCase(this._permissionsRepository);
  final PermissionsRepository _permissionsRepository;

  @override
  Future<AppPermissionStatus> call(PermissionsParams params) =>
      _permissionsRepository.bluetoothScanPermissions(params.request);
}

///
/// GO TO SETTINGS
///
class GoToSettingsUseCase implements BaseUseCase<bool, NoParams> {
  GoToSettingsUseCase(this._permissionsRepository);
  final PermissionsRepository _permissionsRepository;

  @override
  Future<bool> call(NoParams params) => _permissionsRepository.goToSettings();
}