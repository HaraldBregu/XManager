import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/usecases/get_app_permissions.dart';
import 'package:xmanager/src/presentation/bloc/app/app_event.dart';
import 'package:xmanager/src/presentation/bloc/app/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final LocationPermissionsUseCase locationPermissions;
  final BluetoothPermissionsUseCase bluetoothPermissions;
  final BluetoothConnectPermissionsUseCase bluetoothConnectPermissions;
  final BluetoothScanPermissionsUseCase bluetoothScanPermissions;

  AppBloc({
    required this.locationPermissions,
    required this.bluetoothPermissions,
    required this.bluetoothConnectPermissions,
    required this.bluetoothScanPermissions,
  }) : super(const AppState()) {
    on<AppStartEvent>(_onStartEvent);
    on<AppPermissionsStatusEvent>(_onPermissionsStatusEvent);
    on<RequestLocationPermission>(_onRequestLocationPermission);
    on<RequestBluetoothPermission>(_onRequestBluetoothPermission);
    on<RequestBluetoothConnectPermission>(_onRequestBluetoothConnectPermission);
    on<RequestBluetoothScanPermission>(_onRequestBluetoothScanPermission);
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
}
