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
  const Connecting({
    super.program,
    super.devices,
  });
}

class ConnectingSuccess extends UploaderState {
  const ConnectingSuccess({
    super.program,
    super.devices,
  });
}

class ConnectingFailure extends UploaderState {
  const ConnectingFailure({
    super.program,
    super.devices,
  });
}

class Authenticating extends UploaderState {
  const Authenticating({
    super.program,
    super.devices,
  });
}

class AuthenticatingSuccess extends UploaderState {
  const AuthenticatingSuccess({
    super.program,
    super.devices,
  });
}

class AuthenticatingFailure extends UploaderState {
  const AuthenticatingFailure({
    super.program,
    super.devices,
  });
}

class Uploading extends UploaderState {
  const Uploading({
    super.program,
    super.devices,
  });
}

class UploadingSuccess extends UploaderState {
  const UploadingSuccess({
    super.program,
    super.devices,
  });
}

class UploadingFailure extends UploaderState {
  const UploadingFailure({
    super.program,
    super.devices,
  });
}

class Saving extends UploaderState {
  const Saving({
    super.program,
    super.devices,
  });
}

class SavingSuccess extends UploaderState {
  const SavingSuccess({
    super.program,
    super.devices,
  });
}

class SavingFailure extends UploaderState {
  const SavingFailure({
    super.program,
    super.devices,
  });
}
