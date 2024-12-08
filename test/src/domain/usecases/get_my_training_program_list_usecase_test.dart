import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/shared/domain/entities/device_program_entity.dart';
import 'package:xmanager/src/shared/domain/usecases/get_programs_usecase.dart';

import 'get_my_training_program_list_usecase_test.mocks.dart';

@GenerateMocks([TrainingProgramRepository])
void main() {
  late MockTrainingProgramRepository mockTrainingProgramRepository;
  late GetMyTrainingProgramListUsecase usecase;

  setUp(() {
    mockTrainingProgramRepository = MockTrainingProgramRepository();
    usecase = GetMyTrainingProgramListUsecase(mockTrainingProgramRepository);
  });

  test('should get my trainng program list', () async {
    const tTrainingProgramList = [
      TrainingProgramEntity(),
      TrainingProgramEntity(),
    ];

    when(mockTrainingProgramRepository.getMyTrainingProgramList())
        .thenAnswer((_) async => const Right(tTrainingProgramList));

    final result = await usecase(NoParams());

    expect(result, const Right(tTrainingProgramList));
    verify(mockTrainingProgramRepository.getMyTrainingProgramList());
    verifyNoMoreInteractions(mockTrainingProgramRepository);
  });
}
