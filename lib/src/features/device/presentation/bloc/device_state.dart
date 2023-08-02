import 'package:equatable/equatable.dart';

abstract class DeviceState extends Equatable {
  const DeviceState();

  @override
  List<Object?> get props => [];
}

class InitialDeviceState extends DeviceState {}

class LoadingDeviceState extends DeviceState {}

class ListDeviceState extends DeviceState {
  final List<String> devices;

  const ListDeviceState(this.devices);
}
