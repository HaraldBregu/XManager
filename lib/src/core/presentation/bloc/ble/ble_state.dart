import 'package:equatable/equatable.dart';
import 'package:xmanager/src/core/domain/entities/bluetooth_device_entity.dart';
import 'package:xmanager/src/core/domain/entities/bluetooth_service_entity.dart';

enum BleConnectionState { connecting, connected, disconnecting, disconnected }


class BleState extends Equatable {
  final bool isScanning;
  final BleConnectionState connectionState;
  final List<BluetoothDeviceEntity> devices;
  final BluetoothDeviceEntity? selectedDevice;
  final bool discoveringServices;
  final List<BluetoothServiceEntity> services;
  final BluetoothServiceEntity? selectedService;

  const BleState({
    this.isScanning = false,
    this.connectionState = BleConnectionState.disconnected,
    this.devices = const [],
    this.selectedDevice,
    this.discoveringServices = false,
    this.services = const [],
    this.selectedService,
  });

  BleState copyWith({
    bool? isScanning,
    BleConnectionState? connectionState,
    List<BluetoothDeviceEntity>? devices,
    BluetoothDeviceEntity? selectedDevice,
    bool? discoveringServices,
    List<BluetoothServiceEntity>? services,
    BluetoothServiceEntity? selectedService,
  }) {
    return BleState(
      isScanning: isScanning ?? this.isScanning,
      connectionState: connectionState ?? this.connectionState,
      devices: devices ?? this.devices,
      selectedDevice: selectedDevice ?? this.selectedDevice,
      discoveringServices: discoveringServices ?? this.discoveringServices,
      services: services ?? this.services,
      selectedService: selectedService ?? this.selectedService,
    );
  }
  
  @override
  List<Object?> get props => [
        isScanning,
        connectionState,
        devices,
        selectedDevice,
        discoveringServices,
        services,
        selectedService,
      ];
      
}
