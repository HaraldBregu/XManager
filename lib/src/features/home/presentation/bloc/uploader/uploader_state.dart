import 'package:equatable/equatable.dart';
import 'package:xmanager/src/shared/domain/entities/program_entity.dart';
import 'package:xmanager/src/shared/domain/entities/uploader_entity.dart';

class UploaderState extends Equatable {
  final ProgramEntity? program;
  final List<UploaderEntity> uploaderEntities;

  const UploaderState({
    this.program,
    this.uploaderEntities = const [],
  });

  UploaderState copyWith({
    ProgramEntity? program,
    List<UploaderEntity>? uploaderEntities,
    UploaderEntity? currentUploaderEntity,
  }) {
    return UploaderState(
      program: program ?? this.program,
      uploaderEntities: uploaderEntities ?? this.uploaderEntities,
    );
  }

  @override
  List<Object?> get props => [program, uploaderEntities];
}

class BluetoothDisabled extends UploaderState {
  const BluetoothDisabled({
    super.program,
    super.uploaderEntities,
  });
}

class BluetoothConnectPermissionsDenied extends UploaderState {
  const BluetoothConnectPermissionsDenied({
    super.program,
    super.uploaderEntities,
  });
}

class BluetoothConnectPermissionsPermanentlyDenied extends UploaderState {
  const BluetoothConnectPermissionsPermanentlyDenied({
    super.program,
    super.uploaderEntities,
  });
}

class BluetoothScanPermissionsDenied extends UploaderState {
  const BluetoothScanPermissionsDenied({
    super.program,
    super.uploaderEntities,
  });
}

class BluetoothScanPermissionsPermanentlyDenied extends UploaderState {
  const BluetoothScanPermissionsPermanentlyDenied({
    super.program,
    super.uploaderEntities,
  });
}

class Connecting extends UploaderState {
  const Connecting({
    super.program,
    super.uploaderEntities,
  });
}

class ConnectingSuccess extends UploaderState {
  const ConnectingSuccess({
    super.program,
    super.uploaderEntities,
  });
}

class ConnectingFailure extends UploaderState {
  const ConnectingFailure({
    super.program,
    super.uploaderEntities,
  });
}

class DiscoveringServices extends UploaderState {
  const DiscoveringServices({
    super.program,
    super.uploaderEntities,
  });
}

class DiscoveringServicesSuccess extends UploaderState {
  const DiscoveringServicesSuccess({
    super.program,
    super.uploaderEntities,
  });
}

class DiscoveringServicesFailure extends UploaderState {
  const DiscoveringServicesFailure({
    super.program,
    super.uploaderEntities,
  });
}

class Authenticating extends UploaderState {
  const Authenticating({
    super.program,
    super.uploaderEntities,
  });
}

class AuthenticatingSuccess extends UploaderState {
  const AuthenticatingSuccess({
    super.program,
    super.uploaderEntities,
  });
}

class AuthenticatingFailure extends UploaderState {
  const AuthenticatingFailure({
    super.program,
    super.uploaderEntities,
  });
}

class Uploading extends UploaderState {
  const Uploading({
    super.program,
    super.uploaderEntities,
  });
}

class UploadingSuccess extends UploaderState {
  const UploadingSuccess({
    super.program,
    super.uploaderEntities,
  });
}

class UploadingFailure extends UploaderState {
  const UploadingFailure({
    super.program,
    super.uploaderEntities,
  });
}

class NoAvailableDevicesFailure extends UploaderState {
  const NoAvailableDevicesFailure({
    required super.program,
    required super.uploaderEntities,
  });
}
