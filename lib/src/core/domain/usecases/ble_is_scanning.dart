import 'package:xmanager/src/core/domain/repository/ble_repository.dart';
import 'package:xmanager/src/core/usecase.dart';

class BleIsScanningUseCase implements StreamUseCase<bool, void> {
  final BleRepository _bleRepository;

  const BleIsScanningUseCase(this._bleRepository);

  @override
  Stream<bool> call(void params) {
    return _bleRepository.isScanning();
  }
}
