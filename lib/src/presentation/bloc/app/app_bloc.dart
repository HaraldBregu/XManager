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
    locationUsecase.fold(
      (l) => {},
      (r) => emit(state.copyWith(locationGranted: r)),
    );

    final bluetoothUsecase =
        await bluetoothPermissionsGrantedUseCase.call(NoParams());
    bluetoothUsecase.fold(
      (l) => {},
      (r) => emit(state.copyWith(bluetoothGranted: r)),
    );

    final bluetoothConnectUsecase =
        await bluetoothConnectPermissionsGrantedUseCase.call(NoParams());
    bluetoothConnectUsecase.fold(
      (l) => {},
      (r) => emit(state.copyWith(bluetoothConnectGranted: r)),
    );

    final bluetoothScanUsecase =
        await bluetoothScanPermissionsGrantedUseCase.call(NoParams());
    bluetoothScanUsecase.fold(
      (l) => {},
      (r) => emit(state.copyWith(bluetoothScanGranted: r)),
    );
  }

  Future<void> _onRequestLocationPermission(
    RequestLocationPermission event,
    Emitter<AppState> emit,
  ) async {
    final usecase = await requestLocationPermissionsUseCase.call(NoParams());
    usecase.fold(
      (l) => {},
      (r) => emit(state.copyWith(locationGranted: r)),
    );
  }

  Future<void> _onRequestBluetoothPermission(
    RequestBluetoothPermission event,
    Emitter<AppState> emit,
  ) async {
    final usecase = await requestBluetoothPermissionsUseCase.call(NoParams());
    usecase.fold(
      (l) => {},
      (r) => emit(state.copyWith(bluetoothGranted: r)),
    );
  }

  Future<void> _onRequestBluetoothConnectPermission(
    RequestBluetoothConnectPermission event,
    Emitter<AppState> emit,
  ) async {
    final usecase =
        await requestBluetoothConnectPermissionsUseCase.call(NoParams());
    usecase.fold(
      (l) => {},
      (r) => emit(state.copyWith(bluetoothConnectGranted: r)),
    );
  }

  Future<void> _onRequestBluetoothScanPermission(
    RequestBluetoothScanPermission event,
    Emitter<AppState> emit,
  ) async {
    final usecase =
        await requestBluetoothScanPermissionsUseCase.call(NoParams());
    usecase.fold(
      (l) => {},
      (r) => emit(state.copyWith(bluetoothConnectGranted: r)),
    );
  }
}
