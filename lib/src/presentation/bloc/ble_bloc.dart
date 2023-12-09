import 'dart:async';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/domain/usecases/bluetooth_usecases.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/presentation/bloc/ble_event.dart';
import 'package:xmanager/src/presentation/bloc/ble_state.dart';

class BleBloc extends Bloc<BleEvent, BleState> {
  final BluetoothStartScan bluetoothStartScan;
  final BluetoothStopScan bluetoothStopScan;
  final BluetoothScanResults bluetoothScanResults;

  final BluetoothIsScanning bluetoothIsScanning;
  final BluetoothConnectDevice bluetoothConnectDevice;
  final BluetoothDisconnectDevice bluetoothDisconnectDevice;
  final BluetoothDeviceConnected bluetoothDeviceConnected;
  final BluetoothDiscoverServices bluetoothDiscoverServices;

  BleBloc({
    required this.bluetoothStartScan,
    required this.bluetoothStopScan,
    required this.bluetoothScanResults,
    required this.bluetoothIsScanning,
    required this.bluetoothConnectDevice,
    required this.bluetoothDisconnectDevice,
    required this.bluetoothDeviceConnected,
    required this.bluetoothDiscoverServices,
  }) : super(const BleState()) {
    on<StartScanning>(_onStartScanningEvent, transformer: restartable());
    on<StopScanning>(_onStopScanningEvent);
    on<SelectDevice>(_onSelectDeviceEvent);
    on<ConnectDevice>(_onConnectToDeviceEvent);
    on<DisconnectDevice>(_onDiconnectToDeviceEvent);
    on<DiscoverServices>(_onDiscoverServicesEvent);
    on<SelectService>(_onSelectServiceEvent);
  }

  Future<void> _onStartScanningEvent(
    StartScanning event,
    Emitter<BleState> emit,
  ) async {
    emit(state.copyWith(devices: []));
    emit.onEach(
      bluetoothIsScanning.call(NoParams()),
      onData: (scanning) {
        emit(
          state.copyWith(
            isScanning: scanning,
          ),
        );
      },
    );

    bluetoothStartScan.call(event.seconds);

    return emit.onEach(
      bluetoothScanResults.call(NoParams()),
      onData: (data) {
        final currentDevices = [
          ...state.devices,
          ...data,
        ];
        final filteredDevices = [
          ...{...currentDevices}
        ];
        emit(state.copyWith(devices: filteredDevices));
      },
    );
  }

  Future<void> _onStopScanningEvent(
    StopScanning event,
    Emitter<BleState> emit,
  ) async {
    bluetoothStopScan.call(NoParams());
  }

  Future<void> _onSelectDeviceEvent(
    SelectDevice event,
    Emitter<BleState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedDevice: event.device,
        services: [],
      ),
    );
  }

  Future<void> _onConnectToDeviceEvent(
    ConnectDevice event,
    Emitter<BleState> emit,
  ) async {
    emit(state.copyWith(connectionState: BleConnectionState.connecting));
    print("connecting");
    final device = state.selectedDevice;

    if (device == null) return;
    bluetoothConnectDevice.call(device.uuid);

    await emit.onEach(
      bluetoothDeviceConnected.call(device.uuid),
      onData: (connected) {
        final connectonState = connected
            ? BleConnectionState.connected
            : BleConnectionState.disconnected;
        print("connected: $connected");

        if (state.connectionState == BleConnectionState.connecting &&
            !connected) {
        } else {
          emit(state.copyWith(connectionState: connectonState));
        }
      },
    );
  }

  Future<void> _onDiconnectToDeviceEvent(
    DisconnectDevice event,
    Emitter<BleState> emit,
  ) async {
    final device = state.selectedDevice;
    if (device == null) return;
    bluetoothDisconnectDevice.call(device.uuid);
    emit(state.copyWith(connectionState: BleConnectionState.disconnected));
  }

  Future<void> _onDiscoverServicesEvent(
    DiscoverServices event,
    Emitter<BleState> emit,
  ) async {
    emit(state.copyWith(discoveringServices: true));

    final device = state.selectedDevice;
    if (device == null) return;

    final usecase = await bluetoothDiscoverServices.call(device.uuid);
    usecase.fold(
      (error) => {},
      (services) => {
        emit(
          state.copyWith(services: services),
        ),
      },
    );

    emit(state.copyWith(discoveringServices: false));
  }

  Future<void> _onSelectServiceEvent(
    SelectService event,
    Emitter<BleState> emit,
  ) async {
    emit(state.copyWith(selectedService: event.service));
  }
}
