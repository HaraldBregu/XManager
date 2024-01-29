import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:xmanager/src/data/models/dinamo_model.dart';
import 'package:xmanager/src/data/models/profile_model.dart';
import 'package:xmanager/src/domain/entities/profile_entity.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  const tProfileModel = ProfileModel(
    fullname: 'John Doe',
    dinamo: DinamoModel(
      leftBleMac: '123456',
      rightBleMac: '123456',
    ),
  );

  test('should be a subclass of Profile Entity', () async {
    expect(tProfileModel, isA<ProfileEntity>());
  });

  group(
    'fromJson',
    () {
      test('should return a valid Model when a JSON is passed', () async {
        final fixtureData = fixture('profile_model.json');
        final jsonMap = json.decode(fixtureData) as Map<String, dynamic>;

        final result = ProfileModel.fromMap(jsonMap);

        expect(result, tProfileModel);
        expect(result, equals(tProfileModel));
      });
    },
  );

  group(
    'toJson',
    () {
      test('should return a JSON when an Object is passed', () async {
        final result = tProfileModel.toMap();

        final expectedMap = {
          'fullname': 'John Doe',
          'dinamo': {'leftBleMac': '123456', 'rightBleMac': '123456'}
        };

        expect(result, expectedMap);
      });
    },
  );
}
