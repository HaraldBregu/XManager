import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_training_entity.dart';
import 'package:xmanager/src/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:xmanager/src/features/dashboard/domain/usecases/get_dashboard_training.dart';

import 'get_dashboard_training_test.mocks.dart';

@GenerateMocks([DashboardRepository])
void main() {
  late DashboardRepository mockDashboardRepository;
  late GetDashboardTraining getDashboardTrainingUseCase;

  setUp(() {
    mockDashboardRepository = MockDashboardRepository();
    getDashboardTrainingUseCase = GetDashboardTrainingImpl(mockDashboardRepository);
  });

  test("should get the training from dashboard usecases", () async {
    const Either<Failure, DashboardTrainingEntity> repoResult =
    Right<Failure, DashboardTrainingEntity>(
      DashboardTrainingEntity(name: "training name"),
    );

    when(mockDashboardRepository.getTraining())
        .thenAnswer((_) async => repoResult);

    final result = await getDashboardTrainingUseCase.execute();

    expect(result, equals(repoResult));

    verify(mockDashboardRepository.getTraining());

  });
}
