import 'package:equatable/equatable.dart';
import 'package:xmanager/src/domain/entities/bluetooth_device_entity.dart';

class BluetoothDevicePairsEntity extends Equatable {
  final String name;
  final BluetoothDeviceEntity left;
  final BluetoothDeviceEntity right;

  const BluetoothDevicePairsEntity({
    required this.name,
    required this.left,
    required this.right,
  });

  @override
  List<Object> get props => [
        name,
        left,
        right,
      ];
}
