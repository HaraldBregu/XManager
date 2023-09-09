import 'dart:async';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/domain/usecases/bluetooth_usecases.dart';
import 'package:xmanager/src/core/presentation/bloc/ble/bloc.dart';
import 'package:xmanager/src/core/usecase.dart';

class BleBloc extends Bloc<BleEvent, BleState> {
  final BluetoothStartScan bluetoothStartScan;
  final BluetoothIsScanning bluetoothIsScanning;
  final BluetoothConnectDevice bluetoothConnectDevice;
  final BluetoothDeviceConnected bluetoothDeviceConnected;

  BleBloc({
    required this.bluetoothStartScan,
    required this.bluetoothIsScanning,
    required this.bluetoothConnectDevice,
    required this.bluetoothDeviceConnected,
  }) : super(const BleState()) {
    on<StartScanning>(_onStartScanningEvent, transformer: restartable());
    on<SelectDevice>(_onSelectDeviceEvent);
    on<ConnectDevice>(_onConnectToDeviceEvent);
  }
 
  Future<void> _onStartScanningEvent(
    StartScanning event,
    Emitter<BleState> emit,
  ) async {

    bluetoothIsScanning.call(NoParams()).listen((scanning) {
      emit(
        state.copyWith(
          isScanning: scanning,
          devices: scanning ? [] : state.devices,
        ),
      );
    });
    
    await emit.onEach(
      bluetoothStartScan.call(event.seconds),
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

  Future<void> _onSelectDeviceEvent(
    SelectDevice event,
    Emitter<BleState> emit,
  ) async {
    emit(state.copyWith(selectedDevice: event.device));
  }

  Future<void> _onConnectToDeviceEvent(
    ConnectDevice event,
    Emitter<BleState> emit,
  ) async {
    final device = state.selectedDevice;
    if (device == null) return;

    bluetoothDeviceConnected.call(device.uuid).listen((connected) {
      //await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(connected: connected));
      print("connected: $connected");
    });

    bluetoothConnectDevice.call(device.uuid);

  }

}
