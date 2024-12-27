import 'package:xmanager/src/core/enums.dart';
import 'package:xmanager/src/shared/domain/entities/program_entity.dart';

class ProgramModel extends ProgramEntity {
  const ProgramModel({
    required super.title,
    required super.duration,
    required super.feature,
    required super.command,
    required super.type,
    required super.version,
  });

  factory ProgramModel.fromJson(Map<String, dynamic> json) {
    return ProgramModel(
      title: json['title'] as String,
      duration: json['duration'] as int,
      feature: DeviceFeature.fromString(json['feature'] as String),
      command: List<int>.from(json['command'] as List),
      type: DeviceType.fromString(json['type'] as String),
      version: json['version'] as String,
    );
  }
}
