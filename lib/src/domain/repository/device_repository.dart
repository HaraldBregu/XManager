import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/entities/device_entity.dart';

abstract class DeviceRepository {
  Future<Either<Failure, DeviceEntity>> getDeviceByType(String type);
  Future<Either<Failure, DeviceEntity>> saveDevice({
    required DeviceType type,
    required String version,
    required String name,
  });
}
