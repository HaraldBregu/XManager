import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/shared/domain/usecases/ble_usecases.dart';
import 'package:xmanager/src/shared/domain/usecases/get_app_permissions.dart';
import 'package:xmanager/src/shared/presentation/bloc/app/app_event.dart';
import 'package:xmanager/src/shared/presentation/bloc/app/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final LocationPermissionsUseCase locationPermissions;
  final BluetoothPermissionsUseCase bluetoothPermissions;
  final BluetoothConnectPermissionsUseCase bluetoothConnectPermissions;
  final BluetoothScanPermissionsUseCase bluetoothScanPermissions;
  final GoToSettingsUseCase goToSettings;
  final BleTurnOnUseCase bleTurnOn;

  AppBloc({
    required this.locationPermissions,
    required this.bluetoothPermissions,
    required this.bluetoothConnectPermissions,
    required this.bluetoothScanPermissions,
    required this.goToSettings,
    required this.bleTurnOn,
  }) : super(const AppState()) {
    on<AppStartEvent>(_onStartEvent);
    on<AppPermissionsStatusEvent>(_onPermissionsStatusEvent);
    on<RequestLocationPermission>(_onRequestLocationPermission);
    on<RequestBluetoothPermission>(_onRequestBluetoothPermission);
    on<RequestBluetoothConnectPermission>(_onRequestBluetoothConnectPermission);
    on<RequestBluetoothScanPermission>(_onRequestBluetoothScanPermission);
    on<GoToSettings>(_onGoToSettings);
    on<TurnOnBluetooth>(_onTurnOnBluetooth);
  }

  Future<void> _onStartEvent(
    AppStartEvent event,
    Emitter<AppState> emit,
  ) async {}

  Future<void> _onPermissionsStatusEvent(
    AppPermissionsStatusEvent event,
    Emitter<AppState> emit,
  ) async {
    final locationStatus =
        await locationPermissions.call(const PermissionsParams());
    final bluetoothStatus =
        await bluetoothPermissions.call(const PermissionsParams());
    final bluetoothConnectStatus =
        await bluetoothConnectPermissions.call(const PermissionsParams());
    final bluetoothScanStatus =
        await bluetoothScanPermissions.call(const PermissionsParams());

    emit(
      state.copyWith(
        locationPermissionStatus: locationStatus,
        bluetoothPermissionStatus: bluetoothStatus,
        bluetoothConnectPermissionStatus: bluetoothConnectStatus,
        bluetoothScanPermissionStatus: bluetoothScanStatus,
      ),
    );
  }

  Future<void> _onRequestLocationPermission(
    RequestLocationPermission event,
    Emitter<AppState> emit,
  ) async {
    final request =
        await locationPermissions.call(const PermissionsParams(request: true));
    final newState = state.copyWith(locationPermissionStatus: request);
    emit(newState);
  }

  Future<void> _onRequestBluetoothPermission(
    RequestBluetoothPermission event,
    Emitter<AppState> emit,
  ) async {
    final request =
        await bluetoothPermissions.call(const PermissionsParams(request: true));
    final newState = state.copyWith(bluetoothPermissionStatus: request);
    emit(newState);
  }

  Future<void> _onRequestBluetoothConnectPermission(
    RequestBluetoothConnectPermission event,
    Emitter<AppState> emit,
  ) async {
    final request = await bluetoothConnectPermissions
        .call(const PermissionsParams(request: true));
    final newState = state.copyWith(bluetoothConnectPermissionStatus: request);
    emit(newState);
  }

  Future<void> _onRequestBluetoothScanPermission(
    RequestBluetoothScanPermission event,
    Emitter<AppState> emit,
  ) async {
    final request = await bluetoothScanPermissions
        .call(const PermissionsParams(request: true));
    final newState = state.copyWith(bluetoothScanPermissionStatus: request);
    emit(newState);
  }

  Future<void> _onGoToSettings(
    GoToSettings event,
    Emitter<AppState> emit,
  ) async {
    await goToSettings.call(NoParams());
  }

  Future<void> _onTurnOnBluetooth(
    TurnOnBluetooth event,
    Emitter<AppState> emit,
  ) async {
    final turnOn = await bleTurnOn.call(NoParams());
    turnOn.fold(
      (failure) {},
      (_) {},
    );
  }
}
