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
  final BluetoothServicesList bluetoothServicesList;
  final BluetoothDeviceIsConnectedUseCase bluetoothDeviceIsConnectedUseCase;
  final BluetoothWriteUseCase bluetoothWriteUseCase;

  BleBloc({
    required this.bluetoothStartScan,
    required this.bluetoothStopScan,
    required this.bluetoothScanResults,
    required this.bluetoothIsScanning,
    required this.bluetoothConnectDeviceUseCase,
    required this.bluetoothDisconnectDevice,
    required this.bluetoothDeviceConnected,
    required this.bluetoothDiscoverServices,
    required this.bluetoothServicesList,
    required this.bluetoothDeviceIsConnectedUseCase,
    required this.bluetoothWriteUseCase,
  }) : super(const BleInitial()) {
    // on<StartScanning>(_onStartScanningEvent, transformer: restartable());
    // on<StopScanning>(_onStopScanningEvent);
    on<ListenConnectionState>(_onListenConnectionStateEvent);
    on<ConnectDevice>(_onConnectDeviceEvent);
    on<DisconnectDevice>(_onDisconnectDeviceEvent);

    on<DiscoverServices>(_onDiscoverServicesEvent);
    on<ServicesList>(_onServicesListEvent);

    on<SelectServiceUuid>(_onSelectServiceUuidEvent);
    on<SelectCharacteristicUuid>(_onSelectCharacteristicUuidEvent);
    on<BleWriteEvent>(_onBleWriteEventEvent);

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
        emit(BleConnected(connected: connected));
        //emit(state.copyWith(connected: connected));
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
      emit(const BleConnecting());
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
    if (state.connected) {
      final services = await bluetoothDiscoverServices.call(event.uuid);
      emit(state.copyWith(services: services));
    }
  }

  Future<void> _onServicesListEvent(
    ServicesList event,
    Emitter<BleState> emit,
  ) async {
    if (state.connected) {
      final services = await bluetoothServicesList.call(event.uuid);
      emit(state.copyWith(services: services));
    }
  }

  Future<void> _onSelectServiceUuidEvent(
    SelectServiceUuid event,
    Emitter<BleState> emit,
  ) async {
    final selectedService = state.services
        .firstWhere((element) => element.serviceUuid == event.uuid);
    emit(state.copyWith(selectedService: selectedService));
  }

Future<void> _onSelectCharacteristicUuidEvent(
    SelectCharacteristicUuid event,
    Emitter<BleState> emit,
  ) async {
    final selectedService = state.selectedService?.characteristics
        .firstWhere((element) => element.characteristicUuid == event.uuid);

  }

  Future<void> _onBleWriteEventEvent(
    BleWriteEvent event,
    Emitter<BleState> emit,
  ) async {
    bluetoothWriteUseCase.call(
      BleWriteParams(
        deviceUuid: event.deviceUuid,
        serviceUuid: event.serviceUuid,
        characteristicsUuid: event.characteristicUuid,
      ),
    );
  }

}
