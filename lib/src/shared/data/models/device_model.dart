import 'package:xmanager/src/core/enums.dart';
import 'package:xmanager/src/shared/data/models/version_model.dart';
import 'package:xmanager/src/shared/domain/entities/device_entity.dart';

class DeviceModel extends DeviceEntity {
  const DeviceModel({
    required super.location,
    required super.macAddress,
    required super.version,
    required super.type,
    required super.data,
  });

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
      location: DeviceLocation.fromString(json['location'] as String),
      macAddress: json['mac_address'] as String,
      version: json['version'] as String,
      type: DeviceType.fromString(json['type'] as String),
      data: VersionDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}
