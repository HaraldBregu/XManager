import 'package:dartz/dartz.dart';
import '../../../core/enums.dart';
import '../../../core/error/failures.dart';
import '../entities/device_entity.dart';

abstract class DeviceRepository {
  Future<Either<Failure, List<DeviceEntity>>> getMyDevices();
  Future<Either<Failure, DeviceEntity>> getDeviceByType(String type);
  Future<Either<Failure, DeviceEntity>> saveDevice({
    required DeviceType type,
    required String version,
    required String name,
  });
}
