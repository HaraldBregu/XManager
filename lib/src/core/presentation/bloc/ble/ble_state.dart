import 'package:xmanager/src/core/domain/entities/ble_device_entity.dart';

abstract class BleState {
  final List<BleDeviceEntity> devices;
  const BleState({required this.devices});
}

class InitialState extends BleState {
  const InitialState({required super.devices});
}

class ScanningStarted extends BleState {
  const ScanningStarted({required super.devices});
}

class ScanningDevices extends BleState {
  const ScanningDevices({required super.devices});
}

class ScanningEnded extends BleState {
  const ScanningEnded({required super.devices});
}
