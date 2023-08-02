import 'package:equatable/equatable.dart';

abstract class DeviceEvent extends Equatable {
  const DeviceEvent();
  @override
  List<Object?> get props => [];
}

class DeviceEventStart extends DeviceEvent {}
