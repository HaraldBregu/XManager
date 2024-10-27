import 'package:xmanager/src/core/enums.dart';
import 'package:xmanager/src/shared/domain/entities/program_entity.dart';

class ProgramModel extends ProgramEntity {
  const ProgramModel({
    required super.title,
    required super.data,
    required super.devicePosition,
    required super.deviceType,
    required super.deviceVersion,
    required super.duration,
  });

  factory ProgramModel.fromJson(Map<String, dynamic> json) {
    return ProgramModel(
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
      duration: json['duration'] as int,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'data': data,
      'device_type': deviceType.index,
      'device_position': devicePosition.index,
      'device_version': deviceVersion,
      'duration': duration,
    };
  }
}
