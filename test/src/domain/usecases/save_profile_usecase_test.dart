import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/shared/domain/entities/dinamo_entity.dart';
import 'package:xmanager/src/shared/domain/entities/profile_entity.dart';
import 'package:xmanager/src/shared/domain/repository/profile_repository.dart';
import 'package:xmanager/src/shared/domain/usecases/save_profile_usecase.dart';

import 'save_profile_usecase_test.mocks.dart';

@GenerateMocks([ProfileRepository])
void main() {
  late MockProfileRepository mockProfileRepository;
  late SaveProfileUsecase usecase;

  setUp(() {
    mockProfileRepository = MockProfileRepository();
    usecase = SaveProfileUsecase(mockProfileRepository);
  });

  test('should save profile from repository', () async {
    const tProfile = ProfileEntity(
      fullname: '',
      dinamo: DinamoEntity(
        leftBleMac: '',
        rightBleMac: '',
      ),
    );

    when(mockProfileRepository.saveProfile("fullname"))
        .thenAnswer((_) async => const Right(tProfile));

    const profileParams = ProfileParams(fullname: "fullname");
    final result = await usecase(profileParams);

    expect(result, const Right(tProfile));
    verify(mockProfileRepository.saveProfile("fullname"));
    verifyNoMoreInteractions(mockProfileRepository);
  });

  test('should return error on save profile from repository', () async {
    when(mockProfileRepository.saveProfile("fullname"))
        .thenAnswer((_) async => Left(SaveProfileError()));

    const profileParams = ProfileParams(fullname: "fullname");
    final result = await usecase(profileParams);

    expect(result, Left(SaveProfileError()));
    verify(mockProfileRepository.saveProfile("fullname"));
    verifyNoMoreInteractions(mockProfileRepository);
  });
}
