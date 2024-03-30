import 'package:equatable/equatable.dart';

abstract class DeviceEvent extends Equatable {
  const DeviceEvent();
}

class DeviceStartEvent extends DeviceEvent {
  @override
  List<Object?> get props => [];
}

class DeviceSelectEvent extends DeviceEvent {
  final String uuid;

  const DeviceSelectEvent(this.uuid);

  @override
  List<Object?> get props => [uuid];
}

class DeviceConnectEvent extends DeviceEvent {
  final String uuid;

  const DeviceConnectEvent(this.uuid);

  @override
  List<Object?> get props => [uuid];
}
