import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/entities/bluetooth_device_entity.dart';
import 'package:xmanager/src/domain/repository/ble_repository.dart';

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

class BluetoothConnectUseCase implements UseCase<void, String> {
  const BluetoothConnectUseCase(this._bleRepository);
  final BleRepository _bleRepository;

  @override
  Future<Either<Failure, void>> call(String uuid) =>
      _bleRepository.connect(uuid);
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

class BleDiscoverServicesUseCase implements UseCase<void, String> {
  const BleDiscoverServicesUseCase(this._bleRepository);
  final BleRepository _bleRepository;

  @override
  Future<Either<Failure, void>> call(String uuid) =>
      _bleRepository.discoverServices(uuid);
}

class BleReadUseCase implements BaseUseCase<List<int>, BleReadParams> {
  const BleReadUseCase(this._bleRepository);
  final BleRepository _bleRepository;

  @override
  Future<List<int>> call(BleReadParams params) {
    return _bleRepository.read(
      params.deviceUuid,
      params.serviceUuid,
      params.characteristicUuid,
    );
  }
}

class BleWriteUseCase implements BaseUseCase<void, BleWriteParams> {
  const BleWriteUseCase(this._bleRepository);
  final BleRepository _bleRepository;

  @override
  Future<void> call(BleWriteParams params) {
    return _bleRepository.write(
      params.deviceUuid,
      params.serviceUuid,
      params.characteristicUuid,
      params.value,
      params.withoutResponse,
    );
  }
}

class BleSetNotificationUseCase
    implements BaseUseCase<void, BleSetNotificationParams> {
  const BleSetNotificationUseCase(this._bleRepository);
  final BleRepository _bleRepository;

  @override
  Future<void> call(BleSetNotificationParams params) {
    return _bleRepository.setNotifications(
      params.deviceUuid,
      params.serviceUuid,
      params.characteristicUuid,
      params.enable,
    );
  }
}

class BleLastValueStreamUseCase implements StreamUseCase<List<int>, BleParams> {
  const BleLastValueStreamUseCase(this._bleRepository);
  final BleRepository _bleRepository;

  @override
  Stream<List<int>> call(BleParams params) => _bleRepository.lastValueStream(
        params.deviceUuid,
        params.serviceUuid,
        params.characteristicUuid,
      );
}
