import 'package:equatable/equatable.dart';
import 'package:xmanager/src/core/domain/entities/bluetooth_device_entity.dart';

class BleState extends Equatable {
  final bool isScanning;
  final bool connected;
  final List<BluetoothDeviceEntity> devices;
  final BluetoothDeviceEntity? selectedDevice;

  const BleState({
    this.isScanning = false,
    this.connected = false,
    this.devices = const [],
    this.selectedDevice,
  });

  BleState copyWith({
    bool? isScanning,
    bool? connected,
    List<BluetoothDeviceEntity>? devices,
    BluetoothDeviceEntity? selectedDevice,
  }) {
    return BleState(
      isScanning: isScanning ?? this.isScanning,
      connected: connected ?? this.connected,
      devices: devices ?? this.devices,
      selectedDevice: selectedDevice ?? this.selectedDevice,
    );
  }
  
  @override
  List<Object?> get props => [
        isScanning,
        connected,
        devices,
        selectedDevice,
      ];
      
}
