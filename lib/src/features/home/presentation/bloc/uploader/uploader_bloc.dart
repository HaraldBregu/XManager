import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/features/home/presentation/bloc/uploader/uploader_event.dart';
import 'package:xmanager/src/features/home/presentation/bloc/uploader/uploader_state.dart';
import 'package:xmanager/src/shared/domain/entities/device_upload_entity.dart';
import 'package:xmanager/src/shared/domain/usecases/ble_usecases.dart';

class UploaderBloc extends Bloc<UploaderEvent, UploaderState> {
  final BluetoothConnectUseCase bleConnect;
  final BleDiscoverServicesUseCase bleDiscoverServices;
  final BleWriteUseCase bleWrite;

  UploaderBloc({
    required this.bleConnect,
    required this.bleDiscoverServices,
    required this.bleWrite,
  }) : super(const UploaderState()) {
    on<SelectProgram>(_onSelectProgramEvent);
    on<SelectDevice>(_onSelectDeviceEvent);
    on<StartUploading>(_onStartUploadingEvent);
  }

  Future<void> _onSelectProgramEvent(
    SelectProgram event,
    Emitter<UploaderState> emit,
  ) async {
    emit(state.copyWith(program: event.program));
  }

  Future<void> _onSelectDeviceEvent(
    SelectDevice event,
    Emitter<UploaderState> emit,
  ) async {
    final containsDevice = state.devices.any((e) => e.device == event.device);

    if (containsDevice) {
      final devices = List<DeviceUploadEntity>.from(state.devices);
      devices
          .removeWhere((d) => d.device.macAddress == event.device.macAddress);
      emit(state.copyWith(devices: devices));
    } else {
      final devices = List<DeviceUploadEntity>.from(state.devices);
      devices.add(DeviceUploadEntity(device: event.device));
      emit(state.copyWith(devices: devices));
    }

    //emit(state.copyWith(devices: event.device));

    //emit(DeviceCanConnectState(uuid: event.uuid));

    /*await emit.onEach(
      bleConnected.call(event.uuid),
      onData: (connected) {
        if (connected) {
          emit(const DeviceConnected());
        } else {
          emit(const DeviceDisconnected());
        }
      },
    );*/
  }

  Future<void> _onStartUploadingEvent(
    StartUploading event,
    Emitter<UploaderState> emit,
  ) async {
    final program = state.program;
    if (program == null) return;
    final devices = state.devices;
    final data = devices[0];
    final device = data.device;
    final index = devices.indexWhere((el) => el.device == device);

    final macAddress = device.macAddress;
    final customService =
        device.data.services.firstWhere((el) => el.name == "CUSTOM_SERVICE");
    final actionsChar =
        customService.characteristics.firstWhere((el) => el.name == "ACTIONS");

    // 1. Connect
    // * Connecting()
    // * ConnectingSuccess()
    // * ConnectingFailure()

    devices[index] = data.copyWith(
      connected: false,
      authenticated: false,
      progress: 0.1,
    );

    emit(Connecting(program: program, devices: devices));

    final connect = await bleConnect.call(macAddress);
    connect.fold(
      (left) {
        devices[index] = data.copyWith(
          connected: false,
          authenticated: false,
          progress: 0.2,
          failure: left,
        );
        emit(ConnectingFailure(program: program, devices: devices));
      },
      (right) {
        devices[index] = data.copyWith(
          connected: true,
          authenticated: false,
          progress: 0.2,
        );
        emit(ConnectingSuccess(program: program, devices: devices));
      },
    );

    // DISCOVER SERVICES
    await bleDiscoverServices.call(macAddress);

    // 2. Authenticate
    // emit(const Authenticating());
    // emit(const AuthenticatingSuccess());
    // emit(const AuthenticatingFailure());
    devices[index] = data.copyWith(
      connected: true,
      authenticated: false,
      progress: 0.3,
    );

    await bleWrite.call(
      BleWriteParams(
        deviceUuid: macAddress,
        serviceUuid: customService.uuid,
        characteristicUuid: actionsChar.uuid,
        value: program.command,
        withoutResponse: true,
      ),
    );

    return;
    // 3. Upload data
    // * Uploading()
    // * UploadingSuccess()
    // * UploadingFailure()
    emit(const Uploading());
    emit(const UploadingSuccess());
    emit(const UploadingFailure());

    // 4. Save data to DB using API
    // * Saving()
    // * SavingSuccess()
    // * SavingFailure()
    emit(const Saving());
    emit(const SavingSuccess());
    emit(const SavingFailure());
    /*
    saveUseCase()
     */

    // GO TO NEXT DEVICE
  }
}
