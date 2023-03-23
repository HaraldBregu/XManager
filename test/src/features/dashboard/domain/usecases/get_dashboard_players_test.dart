import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_player_entity.dart';
import 'package:xmanager/src/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:xmanager/src/features/dashboard/domain/usecases/get_dashboard_players.dart';

import 'get_dashboard_players_test.mocks.dart';

@GenerateMocks([DashboardRepository])
void main() {
  late DashboardRepository mockDashboardRepository;
  late GetDashboardPlayers getDashboardPlayersUseCase;

  setUp(() {
    mockDashboardRepository = MockDashboardRepository();
    getDashboardPlayersUseCase = GetDashboardPlayersImpl(mockDashboardRepository);
  });

  test("should get the players from dashboard repository", () async {
    const Either<Failure, List<DashboardPlayerEntity>> repoResult =
    Right<Failure, List<DashboardPlayerEntity>>(
      [
        DashboardPlayerEntity(id: 0, fullname: "john doe")
      ]
    );

    when(mockDashboardRepository.getPlayers())
        .thenAnswer((_) async => repoResult);

    final result = await getDashboardPlayersUseCase.execute();

    expect(result, equals(repoResult));

    verify(mockDashboardRepository.getPlayers());

  });
}
