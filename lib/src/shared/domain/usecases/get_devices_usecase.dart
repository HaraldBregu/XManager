import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/shared/domain/entities/device_entity.dart';
import 'package:xmanager/src/shared/domain/repository/device_repository.dart';

class GetDevicesUsecase implements UseCase<List<DeviceEntity>, NoParams> {
  final DeviceRepository deviceRepository;

  GetDevicesUsecase(this.deviceRepository);

  @override
  Future<Either<Failure, List<DeviceEntity>>> call(NoParams _) {
    return deviceRepository.getDevices();
  }
}
