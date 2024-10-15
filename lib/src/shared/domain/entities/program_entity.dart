import 'package:equatable/equatable.dart';
import 'package:xmanager/src/core/enums.dart';

class ProgramEntity extends Equatable {
  final String title;
  final List<int> data;
  final DeviceType deviceType;
  final DevicePosition devicePosition;
  final String deviceVersion;

  const ProgramEntity({
    required this.title,
    required this.data,
    required this.deviceType,
    required this.devicePosition,
    required this.deviceVersion,
  });

  @override
  List<Object> get props => [
        title,
        data,
        deviceType,
        devicePosition,
        deviceVersion,
      ];

  factory ProgramEntity.fromJson(Map<String, dynamic> json) {
    return ProgramEntity(
      title: json['title'] as String,
      data: json['data'] as List<int>,
      deviceType: json['device_type'] as DeviceType,
      devicePosition: json['device_position'] as DevicePosition,
      deviceVersion: json['device_version'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'data': data,
      'device_type': deviceType.index,
      'device_position': devicePosition.index,
      'device_version': deviceVersion,
    };
  }
}
