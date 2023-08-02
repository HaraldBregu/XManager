import 'package:equatable/equatable.dart';

class DeviceEntity extends Equatable {
  final String name;
  final String uuid;

  const DeviceEntity({
    required this.name,
    required this.uuid,
  });

  @override
  List<Object> get props => [name, uuid];
}
