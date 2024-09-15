import 'package:equatable/equatable.dart';
import 'package:xmanager/src/core/enums.dart';

class DeviceEntity extends Equatable {
  final DeviceType type;
  final DevicePosition position;
  final String name;
  final String version;
  final String macAddress;
  final String programTitle;
  final String programData;
  final String programCreatedDate;

  const DeviceEntity({
    required this.type,
    required this.position,
    required this.name,
    required this.version,
    required this.macAddress,
    required this.programTitle,
    required this.programData,
    required this.programCreatedDate,
  });

  @override
  List<Object?> get props => [
        type,
        position,
        name,
        version,
        macAddress,
        programTitle,
        programData,
        programCreatedDate,
      ];
}
