import 'package:equatable/equatable.dart';

class BluetoothDeviceEntity extends Equatable {
  final String name;
  final String uuid;
  final bool connected;
  final bool authenticated;

  const BluetoothDeviceEntity({
    required this.name,
    required this.uuid,
    this.connected = false,
    this.authenticated = false,
  });

  @override
  List<Object> get props => [name, uuid];
}
