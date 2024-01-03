import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/domain/usecases/ble_usecases.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/presentation/bloc/bloc.dart';

class BleBloc extends Bloc<BleEvent, BleState> {
  final BleConnectDeviceUseCase bleConnectDeviceUseCase;
  final BleDisconnectDeviceUseCase bleDisconnectDeviceUseCase;
  final BleDeviceConnectedUseCase bleDeviceConnectedUseCase;
  final BleWriteUseCase bleWriteUseCase;
  final BleLastValueStreamUseCase bleLastValueStreamUseCase;

  BleBloc({
    required this.bleConnectDeviceUseCase,
    required this.bleDisconnectDeviceUseCase,
    required this.bleDeviceConnectedUseCase,
    required this.bleWriteUseCase,
    required this.bleLastValueStreamUseCase,
  }) : super(const BleInitial()) {
    //on<StartScanning>(_onStartScanningEvent, transformer: restartable());
    // on<StopScanning>(_onStopScanningEvent);
    on<ListenConnectionState>(_onListenConnectionStateEvent);
    on<ConnectDevice>(_onConnectDeviceEvent);
    on<DisconnectDevice>(_onDisconnectDeviceEvent);
    on<BleWriteEvent>(_onBleWriteEventEvent);
  }

  Future<void> _onListenConnectionStateEvent(
    ListenConnectionState event,
    Emitter<BleState> emit,
  ) async {
    await emit.onEach(
      bleDeviceConnectedUseCase.call(event.uuid),
      onData: (connected) {
        print("connection is: $connected");
        emit(BleConnected(connected: connected));
      },
    );
  }

  Future<void> _onConnectDeviceEvent(
    ConnectDevice event,
    Emitter<BleState> emit,
  ) async {
    if (!state.connected) emit(const BleConnecting());
    final d = await bleConnectDeviceUseCase.call(event.uuid);
    
  }

  Future<void> _onDisconnectDeviceEvent(
    DisconnectDevice event,
    Emitter<BleState> emit,
  ) async {
    bleDisconnectDeviceUseCase.call(event.uuid);
  }

  Future<void> _onBleWriteEventEvent(
    BleWriteEvent event,
    Emitter<BleState> emit,
  ) async {
    await bleWriteUseCase.call(
      BleWriteParams(
        deviceUuid: event.deviceUuid,
        serviceUuid: event.serviceUuid,
        characteristicsUuid: event.characteristicUuid,
        value: event.value,
      ),
    );


    emit.onEach(
      bleLastValueStreamUseCase.call(
        BleParams(
          deviceUuid: event.deviceUuid,
          serviceUuid: event.serviceUuid,
          characteristicsUuid: event.characteristicUuid,
        ),
      ),
      onData: (value) {
        print("stream value is: $value");
      },
    );
  }

  /*
  Future<void> _onStartScanningEvent(
    StartScanning event,
    Emitter<BleState> emit,
  ) async {
    
    emit.onEach(
      bluetoothIsScanning.call(NoParams()),
      onData: (scanning) {
        emit(BleScanning(scanning: scanning));
        print("scanning");
        print(scanning);

      },
    );

    await bluetoothStartScan.call(
      BleScanParams(
        seconds: event.seconds,
        services: event.services,
      ),
    );

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
        print("filteredDevices");
        print(filteredDevices);
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
  */
}


/*

List<int> numberToBytes(int number) {
  List<int> result = [];

  // Iterate through each byte
  for (int i = 0; i < 8; i++) {
    // Extract the least significant byte
    int byte = (number >> (i * 8)) & 0xFF;

    // Add the byte to the result list
    result.insert(0, byte);
  }

  return result;
}

void main() {
  // Get the current DateTime
  DateTime now = DateTime.now();

  // Convert DateTime to Unix timestamp (milliseconds since epoch)
  int unixTimestamp = now.millisecondsSinceEpoch;

  // Transform the Unix timestamp into a token (string)
  String token = unixTimestamp.toString();

  print('DateTime: $now');
  print('Token: $token');

  int number = int.parse(token);

  // Convert the number to a list of bytes
  List<int> bytes = numberToBytes(number);

  print('Original Number: $number');
  print('Bytes: $bytes');
}

 */
