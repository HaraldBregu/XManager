import 'package:equatable/equatable.dart';
import 'package:xmanager/src/core/enums.dart';

class DeviceEntity extends Equatable {
  final DeviceType type;
  final DeviceLocation location;
  final String version;
  final String macAddress;

  const DeviceEntity({
    required this.type,
    required this.location,
    required this.version,
    required this.macAddress,
  });

  @override
  List<Object?> get props => [
        type,
        location,
        version,
        macAddress,
      ];
}
