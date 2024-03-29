import 'package:equatable/equatable.dart';

class DeviceState extends Equatable {
  final String? uuid;

  const DeviceState({
    this.uuid,
  });

  DeviceState copyWith({
    String? uuid,
  }) {
    return DeviceState(
      uuid: uuid ?? this.uuid,
    );
  }

  @override
  List<Object?> get props => [
        uuid,
      ];

}

class DeviceRegisterState extends DeviceState {
  const DeviceRegisterState();
}

class DeviceCanConnectState extends DeviceState {
  const DeviceCanConnectState({super.uuid});
}

class MissingBleConnPermissionsState extends DeviceState {
  const MissingBleConnPermissionsState();
}

class MissingBlePermPermissionsState extends DeviceState {
  const MissingBlePermPermissionsState();
}
