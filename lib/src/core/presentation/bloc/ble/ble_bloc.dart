import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/domain/usecases/get_ble_devices.dart';
import 'package:xmanager/src/core/domain/usecases/start_ble_scan.dart';
import 'package:xmanager/src/core/domain/usecases/stop_ble_scan.dart';
import 'package:xmanager/src/core/presentation/bloc/ble/bloc.dart';

class BleBloc extends Bloc<BleEvent, BleState> {
  final StartBleScanUseCase startBleScanUseCase;
  final StopBleScanUseCase stopBleScanUseCase;
  final GetBleDevicesUseCase getBleDevicesUseCase;

  BleBloc({
    required this.startBleScanUseCase,
    required this.stopBleScanUseCase,
    required this.getBleDevicesUseCase,
  }) : super(BleInitialState()) {
    on<BleStartScanEvent>(
      onBleStartScanEvent,
      transformer: restartable(),
    );
    on<BleStopScanEvent>(onBleStopScanEvent);
    on<BleAddDeviceEvent>(onBleAddDeviceEvent);
  }

  Future<void> onBleStartScanEvent(
    BleStartScanEvent event,
    Emitter<BleState> emit,
  ) async {
    final seconds = event.seconds;
    final usecase = startBleScanUseCase.call(seconds);

    await emit.onEach(
      usecase,
      onData: (data) {
        if (data.length > 0) {
          print(data.first.name);
        }
        add(const BleAddDeviceEvent());
      },
    );

/*
    final getdev = getBleDevicesUseCase.call({});
    await for (final value in getdev) {
      final deviceUUID = value.first.uuid;
      print('UUID: $deviceUUID');
    }
    */
    //print('device: $getdev');
/*
    await for (final value in getBleDevicesUseCase.call({})) {
      final deviceUUID = value.first.uuid;
      print('UUID: $deviceUUID');
    }*/
    /*
    await for (final value in scanBleDevicesUseCase.call(seconds)) {
      print('1st: $value');
    }*/
  }

  Future<void> onBleStopScanEvent(
    BleStopScanEvent event,
    Emitter<BleState> emit,
  ) async {
    stopBleScanUseCase.call({});
    emit(BleEndScanningState());
  }

  Future<void> onBleAddDeviceEvent(
    BleAddDeviceEvent event,
    Emitter<BleState> emit,
  ) async {
    print("example");
  }

}
