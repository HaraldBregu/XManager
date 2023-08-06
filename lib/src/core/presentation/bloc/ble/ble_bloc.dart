import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/domain/usecases/start_ble_scan.dart';
import 'package:xmanager/src/core/domain/usecases/stop_ble_scan.dart';
import 'package:xmanager/src/core/presentation/bloc/ble/bloc.dart';

class BleBloc extends Bloc<BleEvent, BleState> {
  final StartBleScanUseCase startBleScanUseCase;
  final StopBleScanUseCase stopBleScanUseCase;

  BleBloc({
    required this.startBleScanUseCase,
    required this.stopBleScanUseCase,
  }) : super(Initial()) {
    on<StartScanning>(
      _onStartScanningEvent,
      transformer: restartable(),
    );
    on<AddDevice>(_onAddDeviceEvent);
    on<StopScanning>(_onStopScanningEvent);
  }

  ///
  /// ON START SCANNING EVENT
  /// ADD DEVICE EVENT
  ///
  Future<void> _onStartScanningEvent(
    StartScanning event,
    Emitter<BleState> emit,
  ) async {
    final seconds = event.seconds;
    final usecase = startBleScanUseCase.call(seconds);

    emit(const Scanning());

    await emit.onEach(
      usecase,
      onData: (data) {
        for (final device in data) {
          add(AddDevice(device));
        }
      },
    );
  }

  ///
  /// ON ADD DEVICE EVENT
  ///
  Future<void> _onAddDeviceEvent(
    AddDevice event,
    Emitter<BleState> emit,
  ) async {
    final state = this.state;

    if (state is Scanning) {
      final dev = [
        ...state.devices,
        event.device,
      ];

      emit(
        Scanning(
          devices: [
            ...{...dev}
          ],
        ),
      );
    }
  }

  ///
  /// ON STOP SCANNING EVENT
  ///
  Future<void> _onStopScanningEvent(
    StopScanning event,
    Emitter<BleState> emit,
  ) async {
    if (state is Scanning) {
      stopBleScanUseCase.call({});
      //emit(BleEndScanningState(state));
    }
  }
}
