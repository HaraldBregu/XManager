import 'package:xmanager/src/core/enums.dart';
import 'package:xmanager/src/shared/domain/entities/device_entity.dart';

class DeviceModel extends DeviceEntity {
  const DeviceModel({
    required super.type,
    required super.location,
    required super.version,
    required super.macAddress,
  });

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
      type: DeviceType.fromString(json['type'] as String),
      location: DeviceLocation.fromString(json['location'] as String),
      version: json['version'] as String,
      macAddress: json['mac_address'] as String,
    );
  }
}
