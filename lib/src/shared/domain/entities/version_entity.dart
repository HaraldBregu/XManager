import 'package:xmanager/src/core/enums.dart';

class VersionEntity {
  final DeviceType type;
  final String version;
  final VersionDataEntity data;

  const VersionEntity({
    required this.type,
    required this.version,
    required this.data,
  });
}

class VersionDataEntity {
  String name;
  List<ServiceEntity> services;

  VersionDataEntity({
    required this.name,
    required this.services,
  });
}

class ServiceEntity {
  String name;
  String uuid;
  List<CharacteristicsEntity> characteristics;

  ServiceEntity({
    required this.name,
    required this.uuid,
    required this.characteristics,
  });
}

class CharacteristicsEntity {
  String name;
  String uuid;
  List<String> properties;
  Map<String, dynamic> data;

  CharacteristicsEntity({
    required this.name,
    required this.uuid,
    required this.properties,
    required this.data,
  });
}
