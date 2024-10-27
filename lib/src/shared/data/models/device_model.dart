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

  /*factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
      title: json['title'] != null ? json['title'] as String : '',
      data: json['data'] != null
          ? (json['data'] as List<dynamic>).cast<int>()
          : [],
      deviceType: json['device_type'] != null
          ? DeviceType.values[json['device_type'] as int]
          : DeviceType.none,
      devicePosition: json['device_position'] != null
          ? DevicePosition.values[json['device_position'] as int]
          : DevicePosition.none,
      deviceVersion: json['device_version'] != null
          ? json['device_version'] as String
          : '',
    );
  }*/

}
