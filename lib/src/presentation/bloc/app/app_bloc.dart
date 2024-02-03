import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/usecases/get_app_permissions.dart';
import 'package:xmanager/src/presentation/bloc/app/app_event.dart';
import 'package:xmanager/src/presentation/bloc/app/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final LocationPermissionsGrantedUseCase locationPermissionsGrantedUseCase;
  final RequestLocationPermissionsUseCase requestLocationPermissionsUseCase;
  final BluetoothPermissionsGrantedUseCase bluetoothPermissionsGrantedUseCase;
  final RequestBluetoothPermissionsUseCase requestBluetoothPermissionsUseCase;
  final BluetoothConnectPermissionsGrantedUseCase
      bluetoothConnectPermissionsGrantedUseCase;
  final RequestBluetoothConnectPermissionsUseCase
      requestBluetoothConnectPermissionsUseCase;
  final BluetoothScanPermissionsGrantedUseCase
      bluetoothScanPermissionsGrantedUseCase;
  final RequestBluetoothScanPermissionsUseCase
      requestBluetoothScanPermissionsUseCase;

  AppBloc({
    required this.locationPermissionsGrantedUseCase,
    required this.requestLocationPermissionsUseCase,
    required this.bluetoothPermissionsGrantedUseCase,
    required this.requestBluetoothPermissionsUseCase,
    required this.bluetoothConnectPermissionsGrantedUseCase,
    required this.requestBluetoothConnectPermissionsUseCase,
    required this.bluetoothScanPermissionsGrantedUseCase,
    required this.requestBluetoothScanPermissionsUseCase,
  }) : super(const AppState()) {
    on<AppStartEvent>(_onStartEvent);
    on<RequestLocationPermission>(_onRequestLocationPermission);
    on<RequestBluetoothPermission>(_onRequestBluetoothPermission);
    on<RequestBluetoothConnectPermission>(_onRequestBluetoothConnectPermission);
    on<RequestBluetoothScanPermission>(_onRequestBluetoothScanPermission);
  }

  Future<void> _onStartEvent(
    AppStartEvent event,
    Emitter<AppState> emit,
  ) async {
    final locationUsecase =
        await locationPermissionsGrantedUseCase.call(NoParams());
    final bluetoothUsecase =
        await bluetoothPermissionsGrantedUseCase.call(NoParams());
    final bluetoothConnectUsecase =
        await bluetoothConnectPermissionsGrantedUseCase.call(NoParams());
    final bluetoothScanUsecase =
        await bluetoothScanPermissionsGrantedUseCase.call(NoParams());

    emit(state.copyWith(locationGranted: locationUsecase));
    emit(state.copyWith(bluetoothGranted: bluetoothUsecase));
    emit(state.copyWith(bluetoothConnectGranted: bluetoothConnectUsecase));
    emit(state.copyWith(bluetoothScanGranted: bluetoothScanUsecase));
  }

  Future<void> _onRequestLocationPermission(
    RequestLocationPermission event,
    Emitter<AppState> emit,
  ) async {
    await requestLocationPermissionsUseCase.call(NoParams());
  }

  Future<void> _onRequestBluetoothPermission(
    RequestBluetoothPermission event,
    Emitter<AppState> emit,
  ) async {
    await requestBluetoothPermissionsUseCase.call(NoParams());
  }

  Future<void> _onRequestBluetoothConnectPermission(
    RequestBluetoothConnectPermission event,
    Emitter<AppState> emit,
  ) async {
    await requestBluetoothConnectPermissionsUseCase.call(NoParams());
  }

  Future<void> _onRequestBluetoothScanPermission(
    RequestBluetoothScanPermission event,
    Emitter<AppState> emit,
  ) async {
    await requestBluetoothScanPermissionsUseCase.call(NoParams());
  }
}
