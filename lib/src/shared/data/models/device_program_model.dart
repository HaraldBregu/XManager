import 'package:xmanager/src/core/enums.dart';
import 'package:xmanager/src/shared/domain/entities/device_program_entity.dart';

class DeviceProgramModel extends DeviceProgramEntity {
  const DeviceProgramModel({
    required super.title,
    required super.duration,
    required super.feature,
    required super.command,
    required super.type,
    required super.version,
  });

  factory DeviceProgramModel.fromJson(Map<String, dynamic> json) {
    return DeviceProgramModel(
      title: json['title'] as String,
      duration: json['duration'] as int,
      feature: DeviceFeature.fromString(json['feature'] as String),
      command: List<int>.from(json['command'] as List),
      type: DeviceType.fromString(json['type'] as String),
      version: json['version'] as String,
    );
  }
}
