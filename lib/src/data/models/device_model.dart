import 'package:json_annotation/json_annotation.dart';
import 'package:xmanager/src/domain/entities/device_entity.dart';

part 'device_model.g.dart';

@JsonSerializable()
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
