import 'package:equatable/equatable.dart';
import 'package:xmanager/src/core/usecase.dart';

class DeviceEntity extends Equatable {
  final DeviceType type;
  final String name;
  final String version;

  const DeviceEntity({
    required this.type,
    required this.name,
    required this.version,
  });

  @override
  List<Object?> get props => [name, version, type];
}
