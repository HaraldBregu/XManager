import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/error/exeptions.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/shared/domain/usecases/ble_usecases.dart';
import 'package:xmanager/src/shared/presentation/bloc/bloc.dart';

class BleBloc extends Bloc<BleEvent, BleState> {
  final BleDeviceIsConnectedUseCase bleDeviceIsConnectedUseCase;
  final BleDiscoverServicesUseCase bleDiscoverServicesUseCase;
  final BluetoothConnectUseCase bluetoothConnectUseCase;
  final BleDisconnectDeviceUseCase bleDisconnectDeviceUseCase;
  final BleDeviceConnectedUseCase bleDeviceConnectedUseCase;
  final BleReadUseCase bleReadUseCase;
  final BleWriteUseCase bleWriteUseCase;
  final BleLastValueStreamUseCase bleLastValueStreamUseCase;
  final BleSetNotificationUseCase bleSetNotificationUseCase;

  BleBloc({
    required this.bleDeviceIsConnectedUseCase,
    required this.bleDiscoverServicesUseCase,
    required this.bluetoothConnectUseCase,
    required this.bleDisconnectDeviceUseCase,
    required this.bleDeviceConnectedUseCase,
    required this.bleReadUseCase,
    required this.bleWriteUseCase,
    required this.bleLastValueStreamUseCase,
    required this.bleSetNotificationUseCase,
  }) : super(const BleInitial()) {
    on<BleStartEvent>(_onBleStartEvent);

    //on<StartScanning>(_onStartScanningEvent, transformer: restartable());
    // on<StopScanning>(_onStopScanningEvent);
    on<ListenConnectionStateEvent>(_onListenConnectionStateEvent);
    on<ConnectDevice>(_onConnectDeviceEvent);
    on<ConnectAndAuthenticateDevice>(_onConnectAndAuthenticateDeviceEvent);
    on<DisconnectDevice>(_onDisconnectDeviceEvent);
    on<BleSetNotificationEvent>(_onBleSetNotificationEvent);
    on<BleLastValueListenerEvent>(_onBleLastValueListenerEvent);
    on<BleReadEvent>(_onBleReadEvent);
    on<BleWriteEvent>(_onBleWriteEvent);

    //on<BleDownloadDataEvent>(_onBleDownloadDataEvent);
  }

  Future<void> _onBleStartEvent(
    BleStartEvent event,
    Emitter<BleState> emit,
  ) async =>
      emit(const BleInitial());

  Future<void> _onListenConnectionStateEvent(
    ListenConnectionStateEvent event,
    Emitter<BleState> emit,
  ) async {
    await emit.onEach(
      bleDeviceConnectedUseCase.call(event.uuid),
      onData: (connected) {
        emit(state.copyWith(data: state.data, connected: connected));
      },
    );
  }

  Future<void> _onConnectDeviceEvent(
    ConnectDevice event,
    Emitter<BleState> emit,
  ) async {
    final deviceIsConnected =
        await bleDeviceIsConnectedUseCase.call(event.uuid);

    if (!deviceIsConnected) {
      emit(const BleConnecting());
      await bluetoothConnectUseCase.call(event.uuid);
    }

    await bleDiscoverServicesUseCase.call(event.uuid);
  }

  Future<void> _onConnectAndAuthenticateDeviceEvent(
    ConnectAndAuthenticateDevice event,
    Emitter<BleState> emit,
  ) async {
    // Check if is not connected
    // and then connect to device
    if (!await bleDeviceIsConnectedUseCase.call(event.deviceUuid)) {
      try {
        emit(const BleConnecting());
        await bluetoothConnectUseCase.call(event.deviceUuid);
      } on PermissionsExeption {
        // Change state
        // if didnt connect to device
        // for missing permissions
        emit(const BleMissingPermissions());
        return;
      } catch (error) {
        emit(const BleOff());

        print("couldnt connect to device");
        return;
      }
      print("couldnt connect to device");
    }

    // Discover services
    // catch exceptions
    try {
      emit(const BleDiscoveringServices());
      await bleDiscoverServicesUseCase.call(event.deviceUuid);
    } catch (error) {
      print("couldn't discover services");
      return;
    }

    // Write data
    try {
      emit(BleWillWriteData(data: state.data, connected: state.connected));

      await bleWriteUseCase.call(
        BleWriteParams(
          deviceUuid: event.deviceUuid,
          serviceUuid: event.serviceUuid,
          characteristicUuid: event.characteristicUuid,
          value: event.value,
          withoutResponse: event.withoutResponse,
        ),
      );
    } catch (error) {
      print("couldn't write data");
    }
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
    emit(BleWillReadData(data: state.data, connected: state.connected));

    final data = await bleReadUseCase.call(
      BleReadParams(
        deviceUuid: event.deviceUuid,
        serviceUuid: event.serviceUuid,
        characteristicUuid: event.characteristicUuid,
      ),
    );

    emit(BleDidReadData(data: data, connected: state.connected));
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
        withoutResponse: event.withoutResponse,
      ),
    );

    //emit(BleDidWriteData(data: state.data, connected: state.connected));
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

  Future<void> _onBleLastValueListenerEvent(
    BleLastValueListenerEvent event,
    Emitter<BleState> emit,
  ) async {
    final stream = bleLastValueStreamUseCase.call(
      BleParams(
        deviceUuid: event.deviceUuid,
        serviceUuid: event.serviceUuid,
        characteristicUuid: event.characteristicUuid,
      ),
    );

    return await emit.forEach(
      stream,
      onData: (data) {
        print(data);
        if (state is BleWillWriteData) {
          emit(BleDidWriteData(data: data, connected: state.connected));
        }

        return state;
      },
    ).catchError((error) {
      print(error);
    });
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
