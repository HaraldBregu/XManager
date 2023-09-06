import 'package:xmanager/src/core/domain/entities/ble_device_entity.dart';
import 'package:xmanager/src/core/domain/repository/ble_repository.dart';
import 'package:xmanager/src/core/usecase.dart';

class BleScanResultsUseCase
    implements StreamUseCase<List<BleDeviceEntity>, void> {
  final BleRepository _bleRepository;

  const BleScanResultsUseCase(this._bleRepository);

  @override
  Stream<List<BleDeviceEntity>> call(void params) {
    return _bleRepository.scanResults();
  }
}
