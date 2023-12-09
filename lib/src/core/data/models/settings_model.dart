import 'package:xmanager/src/core/domain/entities/setttings_entity.dart';

class SettingsModel extends SettingsEntity {
  const SettingsModel({
    required super.appName,
    required super.packageName,
    required super.version,
    required super.buildNumber,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) => SettingsModel(
        appName: json['appName'] as String,
        packageName: json['packageName'] as String,
        version: json['version'] as String,
        buildNumber: json['buildNumber'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'appName': appName,
        'packageName': packageName,
        'version': version,
        'buildNumber': buildNumber,
      };
}
