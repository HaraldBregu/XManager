import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/domain/repository/ble_repository.dart';
import 'package:xmanager/src/core/failures.dart';
import 'package:xmanager/src/core/usecase.dart';

class StopBleScanUseCase implements UseCase<void, void> {
  final BleRepository _bleRepository;

  const StopBleScanUseCase(this._bleRepository);
  
  @override
  Future<Either<Failure, void>> call(void params) {
    // TODO: implement call
    throw UnimplementedError();
  }

  // @override
  // Future<Either<Failure, void>> call(void params) {
  //   return _bleRepository.stopScan();
  // }

  // @override
  // Future<void> call(void params) {
  //   return _bleRepository.stopScan();
  // }
}
