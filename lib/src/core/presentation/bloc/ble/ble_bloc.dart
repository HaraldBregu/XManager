import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/domain/usecases/ble_is_scanning.dart';
import 'package:xmanager/src/core/domain/usecases/ble_scan_results.dart';
import 'package:xmanager/src/core/domain/usecases/start_ble_scan.dart';
import 'package:xmanager/src/core/domain/usecases/stop_ble_scan.dart';
import 'package:xmanager/src/core/presentation/bloc/ble/bloc.dart';

class BleBloc extends Bloc<BleEvent, BleState> {
  final StartBleScanUseCase startBleScanUseCase;
  final StopBleScanUseCase stopBleScanUseCase;
  final BleIsScanningUseCase bleIsScanningUseCase;
  final BleScanResultsUseCase bleScanResultUseCase;

  BleBloc({
    required this.startBleScanUseCase,
    required this.stopBleScanUseCase,
    required this.bleIsScanningUseCase,
    required this.bleScanResultUseCase,
  }) : super(const InitialState()) {
    // on<StartScanning>(
    //   _onStartScanningEvent,
    //   transformer: restartable(),
    // );
    on<StartScanning>(_onStartScanningEvent);
    on<StopScanning>(_onStopScanningEvent);
    //on<AddDevice>(_onAddDeviceEvent);
  }

  ///
  /// ON INITAL EVENT
  /// SET INITIAL STATE
  ///
  // Future<void> _onInitialEvent(
  //   InitialBle event,
  //   Emitter<BleState> emit,
  // ) async {
  //   emit(const Initial());
  // }

  ///
  /// ON START SCANNING EVENT
  /// ADD DEVICE EVENT
  ///
  Future<void> _onStartScanningEvent(
    StartScanning event,
    Emitter<BleState> emit,
  ) async {
    startBleScanUseCase.call(event.seconds);

    // bleIsScanningUseCase.call({}).listen((event) {
    //   print("scanning");
    // }).onDone(() {
    //   print("done scanning");
    // });

    // await emit.onEach(
    //   bleIsScanningUseCase.call({}),
    //   onData: (data) {
    //     if (data) {}
    //   },
    // );

    // //emit(const Scanning([]));

    // await emit.onEach(
    //   bleScanResultUseCase.call({}),
    //   onData: (data) {
    //     for (final device in data) {
    //       add(AddDevice(device));
    //     }
    //   },
    // );
  }

  ///
  /// ON STOP SCANNING EVENT
  ///
  Future<void> _onStopScanningEvent(
    StopScanning event,
    Emitter<BleState> emit,
  ) async {
    emit(
      const EndScanning([]),
    );

    // if (state is Scanning) {
    //   stopBleScanUseCase.call({});
    // }
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
