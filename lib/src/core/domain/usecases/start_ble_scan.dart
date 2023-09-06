import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/domain/repository/ble_repository.dart';
import 'package:xmanager/src/core/failures.dart';
import 'package:xmanager/src/core/usecase.dart';

class StartBleScanUseCase implements UseCase<void, int> {
  final BleRepository _bleRepository;

  const StartBleScanUseCase(this._bleRepository);

  @override
  Future<Either<Failure, void>> call(int second) async {
    // ignore: void_checks
    return Right(_bleRepository.startScan(second));
  }
}
