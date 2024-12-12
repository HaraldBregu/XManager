import 'package:equatable/equatable.dart';
import 'package:xmanager/src/shared/domain/entities/device_program_entity.dart';
import 'package:xmanager/src/shared/domain/entities/device_upload_entity.dart';

class UploaderState extends Equatable {
  final DeviceProgramEntity? program;
  final List<DeviceUploadEntity> devices;

  const UploaderState({
    this.program,
    this.devices = const [],
  });

  UploaderState copyWith({
    DeviceProgramEntity? program,
    List<DeviceUploadEntity>? devices,
  }) {
    return UploaderState(
      program: program ?? this.program,
      devices: devices ?? this.devices,
    );
  }

  @override
  List<Object?> get props => [program, devices];
}

class Connecting extends UploaderState {
  const Connecting();
}

class ConnectingSuccess extends UploaderState {
  const ConnectingSuccess();
}

class ConnectingFailure extends UploaderState {
  const ConnectingFailure();
}

class Authenticating extends UploaderState {
  const Authenticating();
}

class AuthenticatingSuccess extends UploaderState {
  const AuthenticatingSuccess();
}

class AuthenticatingFailure extends UploaderState {
  const AuthenticatingFailure();
}

class Uploading extends UploaderState {
  const Uploading();
}

class UploadingSuccess extends UploaderState {
  const UploadingSuccess();
}

class UploadingFailure extends UploaderState {
  const UploadingFailure();
}

class Saving extends UploaderState {
  const Saving();
}

class SavingSuccess extends UploaderState {
  const SavingSuccess();
}

class SavingFailure extends UploaderState {
  const SavingFailure();
}
