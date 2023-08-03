import 'package:equatable/equatable.dart';

class BleDeviceEntity extends Equatable {
  final String name;
  final String uuid;

  const BleDeviceEntity({
    required this.name,
    required this.uuid,
  });

  @override
  List<Object> get props => [name, uuid];
}
