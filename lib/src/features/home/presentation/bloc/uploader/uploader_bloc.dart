import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/features/home/presentation/bloc/uploader/uploader_event.dart';
import 'package:xmanager/src/features/home/presentation/bloc/uploader/uploader_state.dart';
import 'package:xmanager/src/shared/domain/entities/uploader_entity.dart';
import 'package:xmanager/src/shared/domain/usecases/ble_usecases.dart';
import 'package:xmanager/src/shared/domain/usecases/get_app_permissions.dart';

class UploaderBloc extends Bloc<UploaderEvent, UploaderState> {
  final BluetoothConnectUseCase bleConnect;
  final BleDiscoverServicesUseCase bleDiscoverServices;
  final BleWriteUseCase bleWrite;
  final BleDisconnectDeviceUseCase bleDisconnect;
  final BluetoothIsOnUseCase bleIsOn;
  final BluetoothConnectPermissionsGrantedUseCase bleConnectPermissionsGranted;

  UploaderBloc({
    required this.bleConnect,
    required this.bleDiscoverServices,
    required this.bleWrite,
    required this.bleDisconnect,
    required this.bleIsOn,
    required this.bleConnectPermissionsGranted,
  }) : super(const UploaderState()) {
    on<ResetUploader>(_onResetUploaderEvent);
    on<SelectProgram>(_onSelectProgramEvent);
    on<SelectDevice>(_onSelectDeviceEvent);
    on<StartUploading>(_onStartUploadingEvent);
  }

  Future<void> _onResetUploaderEvent(
    ResetUploader event,
    Emitter<UploaderState> emit,
  ) async {
    emit(const UploaderState());
  }

  Future<void> _onSelectProgramEvent(
    SelectProgram event,
    Emitter<UploaderState> emit,
  ) async {
    emit(state.copyWith(program: event.program, uploaderEntities: []));
  }

  Future<void> _onSelectDeviceEvent(
    SelectDevice event,
    Emitter<UploaderState> emit,
  ) async {
    final containsDevice = state.uploaderEntities.any(
      (e) => e.device.macAddress == event.device.macAddress,
    );
    final uploaderEntities = List<UploaderEntity>.from(state.uploaderEntities);

    if (containsDevice) {
      uploaderEntities
          .removeWhere((d) => d.device.macAddress == event.device.macAddress);
      emit(state.copyWith(uploaderEntities: uploaderEntities));
    } else {
      uploaderEntities.add(UploaderEntity(device: event.device));
      emit(state.copyWith(uploaderEntities: uploaderEntities));
    }
  }

  Future<void> _onStartUploadingEvent(
    StartUploading event,
    Emitter<UploaderState> emit,
  ) async {
    final program = state.program;
    if (program == null) return;

    late UploaderState newState;

    // Find next available device for upload
    final uploaderEntities = state.uploaderEntities;
    newState = UploaderState(
      program: program,
      uploaderEntities: uploaderEntities,
    );
    emit(newState);

    late final UploaderEntity uploaderEntity;
    try {
      uploaderEntity = uploaderEntities.firstWhere(
        (entity) =>
            entity.state != UploaderStatus.dataSaved && entity.failure == null,
        orElse: () => throw StateError('No available devices for upload'),
      );
    } catch (_) {
      return;
    }

    // DEVICE DATA
    final device = uploaderEntity.device;
    final services = device.data.services;
    final customService =
        services.firstWhere((s) => s.name == 'CUSTOM_SERVICE');
    final chars = customService.characteristics;
    final actChar = chars.firstWhere((c) => c.name == 'ACTIONS');
    final trCmdChar = chars.firstWhere((c) => c.name == 'TRAINING_COMMAND');
    final password = List<int>.from(actChar.data['password'] as List<dynamic>);
    final index = uploaderEntities.indexWhere((d) => d.device == device);

    // CHECK CONNECT PERMISSIONS
    final connectPermissions =
        await bleConnectPermissionsGranted.call(NoParams());
    final connectPermissionsResult = connectPermissions.fold(
      (failure) {
        if (failure is PermissionsDeniedFailure) {
          newState = BluetoothConnectPermissionsDenied(
            program: program,
            uploaderEntities: uploaderEntities,
          );
          emit(newState);
        } else if (failure is PermissionsPermanentlyDeniedFailure) {
          newState = BluetoothConnectPermissionsPermanentlyDenied(
            program: program,
            uploaderEntities: uploaderEntities,
          );
          emit(newState);
        }
        return false;
      },
      (_) => true,
    );
    if (!connectPermissionsResult) return;

    // RETURN FAILURE STATE IF BLE IS OFF
    final bleIsOnResult = await bleIsOn.call(NoParams());
    if (!bleIsOnResult) {
      newState = BluetoothDisabled(
        program: program,
        uploaderEntities: uploaderEntities,
      );
      emit(newState);
      return;
    }
    
    // 1. CONNECT TO DEVICE
    uploaderEntities[index] = uploaderEntity.copyWith(
      state: UploaderStatus.connecting,
    );
    newState = Connecting(
      program: program,
      uploaderEntities: uploaderEntities,
    );
    emit(newState);
    final connect = await bleConnect.call(device.macAddress);
    final connectResult = connect.fold(
      (failure) {
        uploaderEntities[index] = uploaderEntity.copyWith(
          state: UploaderStatus.connecting,
          failure: failure,
        );
        final newState = ConnectingFailure(
          program: program,
          uploaderEntities: uploaderEntities,
        );
        emit(newState);
        return false;
      },
      (_) {
        uploaderEntities[index] = uploaderEntity.copyWith(
          state: UploaderStatus.connected,
        );
        emit(
          ConnectingSuccess(
            program: program,
            uploaderEntities: uploaderEntities,
          ),
        );
        return true;
      },
    );
    if (!connectResult) {
      add(const StartUploading());
      return;
    }

    // 2. DISCOVER SERVICES
    uploaderEntities[index] = uploaderEntity.copyWith(
      state: UploaderStatus.servicesDiscovering,
    );
    newState = DiscoveringServices(
      program: program,
      uploaderEntities: uploaderEntities,
    );
    emit(newState);
    await bleDiscoverServices.call(device.macAddress);
    uploaderEntities[index] = uploaderEntity.copyWith(
      state: UploaderStatus.servicesDiscovered,
    );
    newState = DiscoveringServicesSuccess(
      program: program,
      uploaderEntities: uploaderEntities,
    );
    emit(newState);

    // 3. AUTHENTICATE
    uploaderEntities[index] = uploaderEntity.copyWith(
      state: UploaderStatus.authenticating,
    );
    newState = Authenticating(
      program: program,
      uploaderEntities: uploaderEntities,
    );
    emit(newState);
    await bleWrite.call(
      BleWriteParams(
        deviceUuid: device.macAddress,
        serviceUuid: customService.uuid,
        characteristicUuid: actChar.uuid,
        value: password,
        withoutResponse: true,
      ),
    );
    uploaderEntities[index] = uploaderEntity.copyWith(
      state: UploaderStatus.authenticated,
    );
    newState = AuthenticatingSuccess(
      program: program,
      uploaderEntities: uploaderEntities,
    );
    emit(newState);

    // 4. UPLOAD DATA
    uploaderEntities[index] = uploaderEntity.copyWith(
      state: UploaderStatus.dataUploading,
    );
    newState = Uploading(
      program: program,
      uploaderEntities: uploaderEntities,
    );
    emit(newState);
    await bleWrite.call(
      BleWriteParams(
        deviceUuid: device.macAddress,
        serviceUuid: customService.uuid,
        characteristicUuid: trCmdChar.uuid,
        value: program.command,
        withoutResponse: false,
      ),
    );
    uploaderEntities[index] = uploaderEntity.copyWith(
      state: UploaderStatus.dataUploaded,
    );
    newState = UploadingSuccess(
      program: program,
      uploaderEntities: uploaderEntities,
    );
    emit(newState);

    // DISCONNECT FROM DEVICE
    await bleDisconnect.call(device.macAddress);

    // 5. SAVING TRAINING DATA 
    uploaderEntities[index] = uploaderEntity.copyWith(
      state: UploaderStatus.dataSaving,
    );
    newState = Saving(
      program: program,
      uploaderEntities: uploaderEntities,
    );
    emit(newState);
    uploaderEntities[index] = uploaderEntity.copyWith(
      state: UploaderStatus.dataSaved,
    );
    newState = SavingSuccess(
      program: program,
      uploaderEntities: uploaderEntities,
    );
    emit(newState);

    // UPLOAD TO NEXT DEVICE
    add(const StartUploading());
  }
}
