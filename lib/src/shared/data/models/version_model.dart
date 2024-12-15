import 'package:xmanager/src/core/enums.dart';
import 'package:xmanager/src/shared/domain/entities/version_entity.dart';

class VersionModel extends VersionEntity {
  VersionModel({
    required super.type,
    required super.version,
    required super.data,
  });

  factory VersionModel.fromJson(Map<String, dynamic> json) {
    return VersionModel(
      type: DeviceType.fromString(json['type'] as String),
      version: json['version'] as String,
      data: VersionDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class VersionDataModel extends VersionDataEntity {
  VersionDataModel({
    required super.name,
    required super.services,
  });

  factory VersionDataModel.fromJson(Map<String, dynamic> json) {
    final services = json['services'] as List;
    final servicesList = services
        .map(
          (el) => ServiceModel.fromJson(el as Map<String, dynamic>),
        )
        .toList();

    return VersionDataModel(
      name: json['name'] as String,
      services: servicesList,
    );
  }
}

class ServiceModel extends ServiceEntity {
  ServiceModel({
    required super.name,
    required super.uuid,
    required super.characteristics,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      name: json['name'] as String,
      uuid: json['uuid'] as String,
      characteristics: (json['characteristics'] as List<dynamic>)
          .cast<CharacteristicsModel>(),
    );
  }
}

class CharacteristicsModel extends CharacteristicsEntity {
  CharacteristicsModel({
    required super.name,
    required super.uuid,
    required super.properties,
  });

  factory CharacteristicsModel.fromJson(Map<String, dynamic> json) {
    return CharacteristicsModel(
      name: json['name'] as String,
      uuid: json['uuid'] as String,
      properties: (json['properties'] as List<dynamic>).cast<String>(),
    );
  }
}
