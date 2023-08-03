import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/domain/usecases/start_scan_ble_devices.dart';
import 'package:xmanager/src/core/presentation/bloc/ble/bloc.dart';

class BleBloc extends Bloc<BleEvent, BleState> {
  final StartScanBleDevicesUseCase startScanBleDevicesUseCase;

  BleBloc({
    required this.startScanBleDevicesUseCase,
  }) : super(BleInitialState()) {
    on<BleStartScanEvent>(onBleScanEvent);
  }

  Future<void> onBleScanEvent(
    BleStartScanEvent event,
    Emitter<BleState> emit,
  ) async {
    final seconds = event.seconds;
    startScanBleDevicesUseCase.call(seconds);
    emit(BleScanningState());

/*
    await for (final value in scanBleDevicesUseCase.call(seconds)) {
      print('1st: $value');
    }*/
  }
}
