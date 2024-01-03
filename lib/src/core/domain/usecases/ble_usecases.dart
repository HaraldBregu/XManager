import 'package:xmanager/src/core/domain/entities/bluetooth_device_entity.dart';
import 'package:xmanager/src/core/domain/entities/bluetooth_service_entity.dart';
import 'package:xmanager/src/core/domain/repository/ble_repository.dart';
import 'package:xmanager/src/core/usecase.dart';

class BleStartScanUseCase implements BaseUseCase<void, BleScanParams> {
  const BleStartScanUseCase(this._bleRepository);
  final BleRepository _bleRepository;

  @override
  Future<void> call(BleScanParams params) => _bleRepository.startScan(
        params.seconds,
        params.services,
      );
}

class BleStopScanUseCase implements BaseUseCase<void, NoParams> {
  const BleStopScanUseCase(this._bleRepository);
  final BleRepository _bleRepository;

  @override
  Future<void> call(NoParams noParams) => _bleRepository.stopScan();
}

class BleScanResultsUseCase
    implements StreamUseCase<List<BluetoothDeviceEntity>, NoParams> {
  const BleScanResultsUseCase(this._bluetoothRepository);
  final BleRepository _bluetoothRepository;

  @override
  Stream<List<BluetoothDeviceEntity>> call(NoParams seconds) =>
      _bluetoothRepository.scanResult;
}

class BleIsScanningUseCase implements StreamUseCase<bool, NoParams> {
  const BleIsScanningUseCase(this._bleRepository);
  final BleRepository _bleRepository;

  @override
  Stream<bool> call(NoParams params) => _bleRepository.isScanning;
}

class BleConnectDeviceUseCase implements BaseUseCase<void, String> {
  const BleConnectDeviceUseCase(this._bleRepository);
  final BleRepository _bleRepository;

  @override
  Future<void> call(String uuid) => _bleRepository.connect(uuid);
}

class BleDisconnectDeviceUseCase implements BaseUseCase<void, String> {
  const BleDisconnectDeviceUseCase(this._bleRepository);
  final BleRepository _bleRepository;

  @override
  Future<void> call(String uuid) => _bleRepository.disconnect(uuid);
}

class BleDeviceConnectedUseCase implements StreamUseCase<bool, String> {
  const BleDeviceConnectedUseCase(this._bleRepository);
  final BleRepository _bleRepository;

  @override
  Stream<bool> call(String uuid) => _bleRepository.connected(uuid);
}

class BleDeviceIsConnectedUseCase implements BaseUseCase<bool, String> {
  const BleDeviceIsConnectedUseCase(this._bleRepository);
  final BleRepository _bleRepository;

  @override
  Future<bool> call(String uuid) => _bleRepository.isConnected(uuid);
}

// class BleDiscoverServicesUseCase
//     implements BaseUseCase<List<BluetoothServiceEntity>, String> {
//   const BleDiscoverServicesUseCase(this._bleRepository);
//   final BleRepository _bleRepository;

//   @override
//   Future<List<BluetoothServiceEntity>> call(String uuid) =>
//       _bleRepository.discoverServices(uuid);
// }

// class BleServicesListUseCase
//     implements BaseUseCase<List<BluetoothServiceEntity>, String> {
//   const BleServicesListUseCase(this._bleRepository);
//   final BleRepository _bleRepository;

//   @override
//   Future<List<BluetoothServiceEntity>> call(String uuid) =>
//       _bleRepository.servicesList(uuid);
// }

class BleWriteUseCase implements BaseUseCase<void, BleWriteParams> {
  const BleWriteUseCase(this._bleRepository);
  final BleRepository _bleRepository;

  @override
  Future<void> call(BleWriteParams params) {
    return _bleRepository.write(
      params.deviceUuid,
      params.serviceUuid,
      params.characteristicsUuid,
      params.value,
    );
  }
}
