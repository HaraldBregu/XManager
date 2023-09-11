import 'dart:convert';

import 'package:xmanager/src/core/domain/entities/application_entity.dart';

class ApplicationModel extends ApplicationEntity {
  const ApplicationModel({
    required super.version,
    required super.darkMode,
  });

  ApplicationModel copyWith({
    String? version,
    bool? darkMode,
  }) {
    return ApplicationModel(
      version: version ?? this.version,
      darkMode: darkMode ?? this.darkMode,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'version': version});
    result.addAll({'darkMode': darkMode});
    return result;
  }

  factory ApplicationModel.fromMap(Map<String, dynamic> map) {
    return ApplicationModel(
      version: map['version'] as String,
      darkMode: map['darkMode'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ApplicationModel.fromJson(String source) =>
      ApplicationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ApplicationModel(version: $version, darkMode: $darkMode)';
}
