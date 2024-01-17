import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/usecases/ble_usecases.dart';
import 'package:xmanager/src/presentation/bloc/bloc.dart';

class BleBloc extends Bloc<BleEvent, BleState> {
  final BleConnectDeviceUseCase bleConnectDeviceUseCase;
  final BleDisconnectDeviceUseCase bleDisconnectDeviceUseCase;
  final BleDeviceConnectedUseCase bleDeviceConnectedUseCase;
  final BleReadUseCase bleReadUseCase;
  final BleWriteUseCase bleWriteUseCase;
  final BleLastValueStreamUseCase bleLastValueStreamUseCase;
  final BleSetNotificationUseCase bleSetNotificationUseCase;

  BleBloc({
    required this.bleConnectDeviceUseCase,
    required this.bleDisconnectDeviceUseCase,
    required this.bleDeviceConnectedUseCase,
    required this.bleReadUseCase,
    required this.bleWriteUseCase,
    required this.bleLastValueStreamUseCase,
    required this.bleSetNotificationUseCase,
  }) : super(const BleInitial()) {
    //on<StartScanning>(_onStartScanningEvent, transformer: restartable());
    // on<StopScanning>(_onStopScanningEvent);
    on<ListenConnectionState>(_onListenConnectionStateEvent);
    on<ConnectDevice>(_onConnectDeviceEvent);
    on<DisconnectDevice>(_onDisconnectDeviceEvent);
    on<BleSetNotificationEvent>(_onBleSetNotificationEvent);
    on<BleLastValueEvent>(_onBleLastValueEvent);
    on<BleReadEvent>(_onBleReadEvent);
    on<BleWriteEvent>(_onBleWriteEvent);

    //on<BleDownloadDataEvent>(_onBleDownloadDataEvent);
  }

  Future<void> _onListenConnectionStateEvent(
    ListenConnectionState event,
    Emitter<BleState> emit,
  ) async {
    await emit.onEach(
      bleDeviceConnectedUseCase.call(event.uuid),
      onData: (connected) {
        emit(BleConnected(data: state.data, connected: connected));
      },
    );
  }

  Future<void> _onConnectDeviceEvent(
    ConnectDevice event,
    Emitter<BleState> emit,
  ) async {
    if (!state.connected) emit(const BleConnecting());
    await bleConnectDeviceUseCase.call(event.uuid);
  }

  Future<void> _onDisconnectDeviceEvent(
    DisconnectDevice event,
    Emitter<BleState> emit,
  ) async {
    bleDisconnectDeviceUseCase.call(event.uuid);
  }

  Future<void> _onBleReadEvent(
    BleReadEvent event,
    Emitter<BleState> emit,
  ) async {
    // emit(
    //   state.copyWith(
    //     data: await bleReadUseCase.call(
    //       BleReadParams(
    //         deviceUuid: event.deviceUuid,
    //         serviceUuid: event.serviceUuid,
    //         characteristicUuid: event.characteristicUuid,
    //       ),
    //     ),
    //   ),
    // );
    emit(BleWillReadData(data: state.data, connected: state.connected));

// do something here
    final data = await bleReadUseCase.call(
      BleReadParams(
        deviceUuid: event.deviceUuid,
        serviceUuid: event.serviceUuid,
        characteristicUuid: event.characteristicUuid,
      ),
    );
    //await Future.delayed(const Duration(seconds: 1));
    // do stuff
    emit(
      BleDidReadData(
        data: data,
        connected: state.connected,
      ),
    );
    return;
    // await Future.delayed(const Duration(microseconds: 2000));
    Future.delayed(const Duration(seconds: 2), () async {
      // do something here
      final data = await bleReadUseCase.call(
        BleReadParams(
          deviceUuid: event.deviceUuid,
          serviceUuid: event.serviceUuid,
          characteristicUuid: event.characteristicUuid,
        ),
      );
      //await Future.delayed(const Duration(seconds: 1));
      // do stuff
      emit(
        BleDidReadData(
          data: data,
          connected: state.connected,
        ),
      );
    });
  }

  Future<void> _onBleWriteEvent(
    BleWriteEvent event,
    Emitter<BleState> emit,
  ) async {
    emit(BleWillWriteData(data: state.data, connected: state.connected));

    await bleWriteUseCase.call(
      BleWriteParams(
        deviceUuid: event.deviceUuid,
        serviceUuid: event.serviceUuid,
        characteristicUuid: event.characteristicUuid,
        value: event.value,
        withoutResponse: false,
      ),
    );
  }

  Future<void> _onBleSetNotificationEvent(
    BleSetNotificationEvent event,
    Emitter<BleState> emit,
  ) async {
    await bleSetNotificationUseCase.call(
      BleSetNotificationParams(
        deviceUuid: event.deviceUuid,
        serviceUuid: event.serviceUuid,
        characteristicUuid: event.characteristicUuid,
        enable: event.enable,
      ),
    );
  }

  Future<void> _onBleLastValueEvent(
    BleLastValueEvent event,
    Emitter<BleState> emit,
  ) async {
    final stream = bleLastValueStreamUseCase.call(
      BleParams(
        deviceUuid: event.deviceUuid,
        serviceUuid: event.serviceUuid,
        characteristicUuid: event.characteristicUuid,
      ),
    );

    await for (final data in stream) {
      if (state is BleWillWriteData) {
        emit(BleDidWriteData(data: data, connected: state.connected));
      } else if (state is BleWillReadData) {
        emit(BleDidReadData(data: data, connected: state.connected));
      }
    }

    return;
    return await emit.forEach(
      stream,
      onData: (data) {
        print(data);
        emit(BleDidWriteData(data: data, connected: state.connected));
        return state;
      },
    ).catchError((error) {
      print(error);
    });
  }

  Future<void> writeFirstBytes() async {
    await bleWriteUseCase.call(
      const BleWriteParams(
        deviceUuid: "E7:C8:DF:65:5B:4B",
        serviceUuid: "00001600-1212-efde-1523-785feabcd121",
        characteristicUuid: "00001601-1212-efde-1523-785feabcd121",
        value: [23, 1, 15, 12, 30, 45], // start byte
        withoutResponse: false,
      ),
    );
  }

  Future<void> readFirstBytes() async {
    await bleReadUseCase.call(
      const BleReadParams(
        deviceUuid: "E7:C8:DF:65:5B:4B",
        serviceUuid: "00001600-1212-efde-1523-785feabcd121",
        characteristicUuid: "00001603-1212-efde-1523-785feabcd121",
      ),
    );
  }

  Future<void> _onBleDownloadDataEvent(
    BleDownloadDataEvent event,
    Emitter<BleState> emit,
  ) async {
    // Enable notifications
    await bleSetNotificationUseCase.call(
      const BleSetNotificationParams(
        deviceUuid: "E7:C8:DF:65:5B:4B",
        serviceUuid: "00001600-1212-efde-1523-785feabcd121",
        characteristicUuid: "00001603-1212-efde-1523-785feabcd121",
        enable: true,
      ),
    );

    await writeFirstBytes();

    // Last Value Stream
    final value = await emit.forEach(
      bleLastValueStreamUseCase.call(
        const BleParams(
          deviceUuid: "E7:C8:DF:65:5B:4B",
          serviceUuid: "00001600-1212-efde-1523-785feabcd121",
          characteristicUuid: "00001603-1212-efde-1523-785feabcd121",
        ),
      ),
      onData: (data) {
        print("reading first byte");
        print(data);
        return state;
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
