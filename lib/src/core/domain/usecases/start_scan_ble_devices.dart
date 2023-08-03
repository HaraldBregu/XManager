import 'package:xmanager/src/core/domain/repository/ble_repository.dart';
import 'package:xmanager/src/core/usecase.dart';

class StartScanBleDevicesUseCase implements UseCase<void, int> {
  final BleRepository _bleRepository;

  const StartScanBleDevicesUseCase(this._bleRepository);

  @override
  Future<void> call(int seconds) {
    return _bleRepository.startScan(seconds);
  }
}
