import 'package:equatable/equatable.dart';

abstract class DeviceState extends Equatable {
  const DeviceState();

  @override
  List<Object?> get props => [];
}

class InitialDeviceState extends DeviceState {}

class DeviceLoadingState extends DeviceState {}

class DeviceLoadedState extends DeviceState {
  final List<String> devices;

  const DeviceLoadedState(this.devices);
}
