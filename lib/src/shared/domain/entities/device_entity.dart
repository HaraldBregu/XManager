import 'package:equatable/equatable.dart';
import 'package:xmanager/src/core/enums.dart';
import 'package:xmanager/src/shared/data/models/version_model.dart';

class DeviceEntity extends Equatable {
  final DeviceLocation location;
  final String macAddress;
  final DeviceType type;
  final String version;
  final VersionDataModel data;

  const DeviceEntity({
    required this.location,
    required this.macAddress,
    required this.version,
    required this.type,
    required this.data,
  });

  @override
  List<Object?> get props => [
        location,
        version,
        type,
        macAddress,
        data,
      ];
}
