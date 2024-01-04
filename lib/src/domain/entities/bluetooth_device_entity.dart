import 'package:equatable/equatable.dart';

class BluetoothDeviceEntity extends Equatable {
  final String name;
  final String uuid;

  const BluetoothDeviceEntity({
    required this.name,
    required this.uuid,
  });

  @override
  List<Object> get props => [name, uuid];
}
