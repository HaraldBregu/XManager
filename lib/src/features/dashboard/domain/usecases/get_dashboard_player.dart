import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_player_entity.dart';

import 'package:xmanager/src/features/dashboard/domain/repositories/dashboard_repository.dart';

class GetDashboardPlayers {
  final DashboardRepository _dashboardRepository;

  GetDashboardPlayers(this._dashboardRepository);

  Future<List<DashboardPlayerEntity>> call() async =>
      _dashboardRepository.getPlayers();

}