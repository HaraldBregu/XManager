import 'package:equatable/equatable.dart';
import 'package:xmanager/src/core/domain/entities/bluetooth_device_entity.dart';
import 'package:xmanager/src/core/domain/entities/bluetooth_service_entity.dart';

class BleState extends Equatable {
  final bool connected;
  final List<BluetoothServiceEntity> services;

  const BleState({
    this.connected = false,
    this.services = const [],
  });

  BleState copyWith({
    bool? connected,
    List<BluetoothServiceEntity>? services,
  }) =>
      BleState(
        connected: connected ?? this.connected,
        services: services ?? this.services,
      );

  @override
  List<Object?> get props => [
        connected,
        services,
      ];
}

class BleInitial extends BleState {
  const BleInitial({super.connected = false, super.services});
}

class BleConnecting extends BleState {
  const BleConnecting({super.connected = false, super.services});
}

class BleConnected extends BleState {
  const BleConnected({super.connected = false, super.services});
}


/*
enum BleConnectionState { connecting, connected, disconnecting, disconnected }

class BleState extends Equatable {
  final bool isConnected;
  final bool isScanning;
  final List<BluetoothDeviceEntity> devices;
  //final BluetoothDeviceEntity? selectedDevice;
  final bool discoveringServices;
  final List<BluetoothServiceEntity> services;
  final BluetoothServiceEntity? selectedService;

  const BleState({
    this.isConnected = false,
    this.isScanning = false,
    this.devices = const [],
    //this.selectedDevice,
    this.discoveringServices = false,
    this.services = const [],
    this.selectedService,
  });


  BleState copyWith({
    bool? isConnected,
    bool? isScanning,
    List<BluetoothDeviceEntity>? devices,
    // BluetoothDeviceEntity? selectedDevice,
    bool? discoveringServices,
    List<BluetoothServiceEntity>? services,
    BluetoothServiceEntity? selectedService,
  }) {
    return BleState(
      isConnected: isConnected ?? this.isConnected,
      isScanning: isScanning ?? this.isScanning,
      devices: devices ?? this.devices,
      // selectedDevice: selectedDevice ?? this.selectedDevice,
      discoveringServices: discoveringServices ?? this.discoveringServices,
      services: services ?? this.services,
      selectedService: selectedService ?? this.selectedService,
    );
  }

  @override
  List<Object?> get props => [
        isConnected,
        isScanning,
        devices,
        // selectedDevice,
        discoveringServices,
        services,
        selectedService,
      ];
}

class BleInitial extends BleState {
  BleInitial();
}

class BleConnecting extends BleState {}

class BleConnected extends BleState {}

class BleDisconnected extends BleState {}

class BleServiceDiscovering extends BleState {}

class BleServiceDiscovered extends BleState {}

*/