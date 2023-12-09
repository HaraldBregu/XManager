import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/domain/entities/dashboard_player_entity.dart';
import 'package:xmanager/src/core/domain/repository/dashboard_repository.dart';
import 'package:xmanager/src/core/failures.dart';

abstract class GetDashboardPlayers {
  Future<Either<Failure, List<DashboardPlayerEntity>>> execute();
}

class GetDashboardPlayersImpl implements GetDashboardPlayers {
  final DashboardRepository _dashboardRepository;

  GetDashboardPlayersImpl(this._dashboardRepository);

  @override
  Future<Either<Failure, List<DashboardPlayerEntity>>> execute() async {
    return _dashboardRepository.getPlayers();
  }
}
