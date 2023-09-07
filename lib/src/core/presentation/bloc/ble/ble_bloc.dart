import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/domain/usecases/ble_start_scan.dart';
import 'package:xmanager/src/core/domain/usecases/ble_stop_scan.dart';
import 'package:xmanager/src/core/presentation/bloc/ble/bloc.dart';

class BleBloc extends Bloc<BleEvent, BleState> {
  final BleStartScanUseCase bleStartScanUseCase;
  final BleStopScanUseCase bleStopScanUseCase;

  BleBloc({
    required this.bleStartScanUseCase,
    required this.bleStopScanUseCase,
  }) : super(const InitialState(devices: [])) {
    on<StartScanning>(_onStartScanningEvent, transformer: restartable());
    //on<StopScanning>(_onStopScanningEvent);
  }

  Future<void> _onStartScanningEvent(
    StartScanning event,
    Emitter<BleState> emit,
  ) async {
    
    //emit(ScanningStarted(devices: state.devices));
    //print("start scanning");

    await emit.onEach(
      bleStartScanUseCase.call(event.seconds),
      onData: (data) {
        //print("scanning");
        //print("scanning $data");
        for (final device in data) {
          //print("the scanning ${device.uuid}");
          //add(AddDevice(device));
        }
      },
    );

    //print("end scanning");
    //emit(ScanningEnded(devices: state.devices));
  }

  ///
  /// ON ADD DEVICE EVENT
  ///
  Future<void> _onAddDeviceEvent(
    AddDevice event,
    Emitter<BleState> emit,
  ) async {
    final state = this.state;

    // if (state is AddingDevices) {
    //   final dev = [
    //     ...state.devices,
    //     event.device,
    //   ];

    //   emit(
    //     AddingDevices(
    //       isScanning: true,
    //       devices: [
    //         ...{...dev}
    //       ],
    //     ),
    //   );
    // }
  }
}
