import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:xmanager/src/core/failures.dart';
import 'package:xmanager/src/features/settings/domain/entities/setttings_entity.dart';
import 'package:xmanager/src/features/settings/domain/repositories/settings_repository.dart';
import 'package:xmanager/src/features/settings/domain/usecases/get_settings_items.dart';

import 'get_settings_items_test.mocks.dart';

@GenerateMocks([SettingsRepository])
void main() {
  late SettingsRepository mockSettingsRepository;
  late GetSettingsItems getSettingItemsUsecase;

  setUp(() {
    mockSettingsRepository = MockSettingsRepository();
    getSettingItemsUsecase = GetSettingsItemsImpl(mockSettingsRepository);
  });

  test("should get the items from settings usecases", () async {
    const Either<Failure, SettingsEntity> repoResult =
        Right<Failure, SettingsEntity>(
      SettingsEntity(
        appName: "appName",
        packageName: "packageName",
        version: "version",
        buildNumber: "buildNumber",
      ),
    );

    when(mockSettingsRepository.getSettings())
        .thenAnswer((_) async => repoResult);

    final result = await getSettingItemsUsecase.execute();

    expect(result, equals(repoResult));

    verify(mockSettingsRepository.getSettings());

    verifyNoMoreInteractions(mockSettingsRepository);
  });
}
