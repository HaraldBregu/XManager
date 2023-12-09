import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:xmanager/src/core/failures.dart';
import 'package:xmanager/src/core/domain/entities/dashboard_profile_entity.dart';
import 'package:xmanager/src/core/domain/repository/dashboard_repository.dart';
import 'package:xmanager/src/core/domain/usecases/get_dashboard_profile.dart';

import 'get_dashboard_profile_test.mocks.dart';

@GenerateMocks([DashboardRepository])
void main() {
  late DashboardRepository mockDashboardRepository;
  late GetDashboardProfile getDashboardProfileUseCase;

  setUp(() {
    mockDashboardRepository = MockDashboardRepository();
    getDashboardProfileUseCase = GetDashboardProfileImpl(mockDashboardRepository);
  });

  test("should get the profile from dashboard usecases", () async {
    const Either<Failure, DashboardProfileEntity> repoResult =
    Right<Failure, DashboardProfileEntity>(
        DashboardProfileEntity(fullname: "example"),
    );

    when(mockDashboardRepository.getProfile())
        .thenAnswer((_) async => repoResult);

    final result = await getDashboardProfileUseCase.execute();

    expect(result, equals(repoResult));

    verify(mockDashboardRepository.getProfile());

  });
}
