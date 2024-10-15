import 'package:xmanager/src/shared/domain/entities/device_entity.dart';

class DeviceModel extends DeviceEntity {
  const DeviceModel({
    required super.type,
    required super.position,
    required super.name,
    required super.version,
    required super.macAddress,
    required super.programTitle,
    required super.programData,
    required super.programCreatedDate,
  });
}
