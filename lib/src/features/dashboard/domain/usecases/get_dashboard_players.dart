import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/usecases/usecase.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_player_entity.dart';

import '../repositories/dashboard_repository.dart';

abstract class GetDashboardPlayers {
  Future<Either<Failure, List<DashboardPlayerEntity>>> execute();
}

class GetDashboardPlayersImpl implements GetDashboardPlayers {
  final DashboardRepository dashboardRepository;

  GetDashboardPlayersImpl(this.dashboardRepository);

  @override
  Future<Either<Failure, List<DashboardPlayerEntity>>> execute() async {
    return dashboardRepository.getPlayers();
  }

}
