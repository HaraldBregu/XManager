import 'package:equatable/equatable.dart';
import 'package:xmanager/src/core/enums.dart';

import 'package:xmanager/src/domain/entities/bluetooth_device_pairs_entity.dart';

class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {
  const HomeInitialState();
}

class AppPermissionsErrorState extends HomeState {
  final AppPermissionStatus permissionState;
  const AppPermissionsErrorState({
    required this.permissionState,
  });
}

class BluetoothConnectingState extends HomeState {
  const BluetoothConnectingState();
}

class BluetoothErrorState extends HomeState {
  const BluetoothErrorState();
}

class BluetoothAuthenticationState extends HomeState {
  const BluetoothAuthenticationState();
}

class HomeDeviceConnectionErrorState extends HomeState {}

class UploadingProgramToDevicePairsState extends HomeState {
  final bool connected;
  final bool authenticated;
  final bool uploaded;
  
  const UploadingProgramToDevicePairsState({
    this.connected = false,
    this.authenticated = false,
    this.uploaded = false,
  });

}
