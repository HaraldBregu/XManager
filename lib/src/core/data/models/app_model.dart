import 'dart:convert';

import 'package:xmanager/src/core/domain/entities/app_entity.dart';

class AppModel extends AppEntity {
  const AppModel({
    required super.version,
    required super.darkMode,
  });

  AppModel copyWith({
    String? version,
    bool? darkMode,
  }) {
    return AppModel(
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

  factory AppModel.fromMap(Map<String, dynamic> map) {
    return AppModel(
      version: map['version'] as String,
      darkMode: map['darkMode'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppModel.fromJson(String source) =>
      AppModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AppModel(version: $version, darkMode: $darkMode)';
}
