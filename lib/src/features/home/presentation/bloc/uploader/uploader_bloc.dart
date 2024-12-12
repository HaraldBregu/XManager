import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/features/home/presentation/bloc/uploader/uploader_event.dart';
import 'package:xmanager/src/features/home/presentation/bloc/uploader/uploader_state.dart';
import 'package:xmanager/src/shared/domain/entities/device_upload_entity.dart';

class UploaderBloc extends Bloc<UploaderEvent, UploaderState> {
  UploaderBloc() : super(const UploaderState()) {
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
    final devices = state.devices;
    final device = devices[0];

    // Change state to uploading

    // - Get first device

    // 1. Connect
    // * Connecting()
    // * ConnectingSuccess()
    // * ConnectingFailure()
    emit(const Connecting());
    emit(const ConnectingSuccess());
    emit(const ConnectingFailure());

    // 2. Authenticate
    // * Authenticating()
    // * AuthenticatingSuccess()
    // * AuthenticatingFailure()
    emit(const Authenticating());
    emit(const AuthenticatingSuccess());
    emit(const AuthenticatingFailure());

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
