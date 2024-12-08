import 'package:equatable/equatable.dart';
import 'package:xmanager/src/core/enums.dart';

class DeviceProgramEntity extends Equatable {
  final String title;
  final int duration;
  final DeviceFeature feature;
  final List<int> command;
  final DeviceType type;
  final String version;

  const DeviceProgramEntity({
    required this.title,
    required this.duration,
    required this.feature,
    required this.command,
    required this.type,
    required this.version,
  });

  @override
  List<Object> get props => [
        title,
        duration,
        feature,
        command,
        type,
        version,
      ];
}
