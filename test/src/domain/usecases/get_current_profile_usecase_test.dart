import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/entities/dinamo_entity.dart';
import 'package:xmanager/src/domain/entities/profile_entity.dart';
import 'package:xmanager/src/domain/repository/profile_repository.dart';
import 'package:xmanager/src/domain/usecases/get_current_profile_usecase.dart';

import 'get_current_profile_usecase_test.mocks.dart';

@GenerateMocks([ProfileRepository])
void main() {
  late MockProfileRepository mockProfileRepository;
  late GetCurrentProfileUsecase usecase;

  setUp(() {
    mockProfileRepository = MockProfileRepository();
    usecase = GetCurrentProfileUsecase(mockProfileRepository);
  });

  test('should get current profile from repository', () async {
    const tProfile = ProfileEntity(
      fullname: '',
      dinamo: DinamoEntity(
        leftBleMac: '',
        rightBleMac: '',
      ),
    );

    when(mockProfileRepository.getCurrentProfile())
        .thenAnswer((_) async => const Right(tProfile));

    final result = await usecase(NoParams());

    expect(result, const Right(tProfile));
    verify(mockProfileRepository.getCurrentProfile());
    verifyNoMoreInteractions(mockProfileRepository);
  });
}
