import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:xmanager/src/features/dashboard/domain/repositories/dashboard_repository.dart';

class GetDashboardData {
  final DashboardRepository _dashboardRepository;

  GetDashboardData(this._dashboardRepository);

  Future<DashboardEntity> call() async => _dashboardRepository.getDashboard();

}