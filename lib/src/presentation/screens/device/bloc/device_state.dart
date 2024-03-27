import 'package:equatable/equatable.dart';

/// DEVICE STATE
///
/// Initial is empty, no pairing BLE device added
/// Paired device has uuid, name ecc but not connected
///
/// ON BLE connecion update the device state
/// name, version, data

abstract class DeviceState extends Equatable {
  const DeviceState();

  @override
  List<Object?> get props => [];
}

class InitialDeviceState extends DeviceState {}

class DeviceRegisteredState extends DeviceState {}

class DeviceLoadingState extends DeviceState {}

class DeviceLoadedState extends DeviceState {
  final List<String> devices;

  const DeviceLoadedState(this.devices);
}
