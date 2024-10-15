import 'package:equatable/equatable.dart';

class DeviceState extends Equatable {
  final String? uuid;
  final List<int>? password;

  const DeviceState({
    this.uuid,
    this.password,
  });

  DeviceState copyWith({
    String? uuid,
    List<int>? password,
  }) {
    return DeviceState(
      uuid: uuid ?? this.uuid,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [
        uuid,
        password,
      ];

}

class DeviceInitial extends DeviceState {
  const DeviceInitial();
}

class DeviceCanConnectState extends DeviceState {
  const DeviceCanConnectState({super.uuid});
}

class DeviceConnecting extends DeviceState {
  const DeviceConnecting();
}

class DeviceConnectionErrorState extends DeviceState {
  const DeviceConnectionErrorState();
}

class PermissionsDeniedState extends DeviceState {
  const PermissionsDeniedState();
}

class PermissionsPermanentlyDeniedState extends DeviceState {
  const PermissionsPermanentlyDeniedState();
}

class DeviceConnected extends DeviceState {
  const DeviceConnected();
}

class DeviceDisconnected extends DeviceState {
  const DeviceDisconnected();
}
