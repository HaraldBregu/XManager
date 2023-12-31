import 'dart:async';
import 'dart:math';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/domain/usecases/bluetooth_usecases.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/presentation/bloc/bloc.dart';

class BleBloc extends Bloc<BleEvent, BleState> {
  final BluetoothStartScan bluetoothStartScan;
  final BluetoothStopScan bluetoothStopScan;
  final BluetoothScanResults bluetoothScanResults;
  final BluetoothIsScanning bluetoothIsScanning;
  final BluetoothConnectDeviceUseCase bluetoothConnectDeviceUseCase;
  final BluetoothDisconnectDevice bluetoothDisconnectDevice;
  final BluetoothDeviceConnected bluetoothDeviceConnected;
  final BluetoothDiscoverServices bluetoothDiscoverServices;
  final BluetoothDeviceIsConnectedUseCase bluetoothDeviceIsConnectedUseCase;

  BleBloc({
    required this.bluetoothStartScan,
    required this.bluetoothStopScan,
    required this.bluetoothScanResults,
    required this.bluetoothIsScanning,
    required this.bluetoothConnectDeviceUseCase,
    required this.bluetoothDisconnectDevice,
    required this.bluetoothDeviceConnected,
    required this.bluetoothDiscoverServices,
    required this.bluetoothDeviceIsConnectedUseCase,
  }) : super(const BleInitial()) {
    // on<StartScanning>(_onStartScanningEvent, transformer: restartable());
    // on<StopScanning>(_onStopScanningEvent);
    on<ListenConnectionState>(_onListenConnectionStateEvent);
    on<ConnectDevice>(_onConnectDeviceEvent);
    on<DisconnectDevice>(_onDisconnectDeviceEvent);

    on<DiscoverServices>(_onDiscoverServicesEvent);
    //   on<SelectService>(_onSelectServiceEvent);

    //   on<DiscoverServicesEnded>(_onDiscoverServicesEnded);
  }

  Future<void> _onStartScanningEvent(
    StartScanning event,
    Emitter<BleState> emit,
  ) async {
    /*   
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
    */
  }

  Future<void> _onStopScanningEvent(
    StopScanning event,
    Emitter<BleState> emit,
  ) async {
    bluetoothStopScan.call(NoParams());
  }

  Future<void> _onListenConnectionStateEvent(
    ListenConnectionState event,
    Emitter<BleState> emit,
  ) async {
    await emit.onEach(
      bluetoothDeviceConnected.call(event.uuid),
      onData: (connected) {
        print("Connected: $connected");
        emit(BleConnected(connected: connected));
        print("Connected state: $state");

        // if (connected) {
        //   emit(const BleConnected());
        // } else {
        //   emit(const BleConnectionError());
        // }
        // emit(state.copyWith(isConnected: connected));
      },
    );
  }

  Future<void> _onConnectDeviceEvent(
    ConnectDevice event,
    Emitter<BleState> emit,
  ) async {
    final isConnectedUseCase =
        await bluetoothDeviceIsConnectedUseCase.call(event.uuid);
    if (!isConnectedUseCase) {
      print("is not connected, connecting...");

      emit(const BleConnecting());
      //emit(BleState.connecting());
      bluetoothConnectDeviceUseCase.call(event.uuid);
    }
  }

  Future<void> _onDisconnectDeviceEvent(
    DisconnectDevice event,
    Emitter<BleState> emit,
  ) async {
    final isConnectedUseCase =
        await bluetoothDeviceIsConnectedUseCase.call(event.uuid);
    if (isConnectedUseCase) {
      bluetoothDisconnectDevice.call(event.uuid);
    }
  }

  Future<void> _onDiscoverServicesEvent(
    DiscoverServices event,
    Emitter<BleState> emit,
  ) async {
    if (!state.connected) return;

    //print("Current state: $state");

    //emit(BleServiceDiscovering());
    final services = await bluetoothDiscoverServices.call(event.uuid);
    //emit(BleServiceDiscovered());
    emit(state.copyWith(services: services));

    //add(DiscoverServicesEnded(services: services));

    //print("Current state after emitting: $state");

    //    emit(state.copyWith(services: [services.first]));

    //print("Current state: $state");
  }

  Future<void> _onDiscoverServicesEnded(
    DiscoverServicesEnded event,
    Emitter<BleState> emit,
  ) async {
    print("Current state ended: $event");

    //emit(state.copyWith(services: event.services));
    /*
    emit(BleServiceDiscovering());
    final services = await bluetoothDiscoverServices.call(event.uuid);
    emit(BleServiceDiscovered());
    //print(state);
    add(DiscoverServicesEnded(services: services));
    print("Current state after emitting: $state");
    emit(state.copyWith(services: [services.first]));
    print("Current state: $state");*/
  }

  Future<void> _onSelectServiceEvent(
    SelectService event,
    Emitter<BleState> emit,
  ) async {
    // emit(state.copyWith(selectedService: event.service));
  }
}
