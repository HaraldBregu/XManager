import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:xmanager/src/core/data/models/settings_model.dart';
import 'package:xmanager/src/core/domain/entities/setttings_entity.dart';
import '../../../../../fixtures/fixture_reader.dart';

void main() {
  const tSettingsModel = SettingsModel(
    appName: "appName",
    packageName: "packageName",
    version: "version",
    buildNumber: "buildNumber",
  );

  test('should be a subclass of Settings entity', () async {
    expect(tSettingsModel, isA<SettingsEntity>());
  });

  group(
    'fromJson',
    () {
      test('should return a valid model when a json number', () async {
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('settings_model.json')) as Map<String, dynamic>;

        final result = SettingsModel.fromJson(jsonMap);

        //expect(result, tSettingsModel);
        expect(result, equals(tSettingsModel));
      });
    },
  );
}
