import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_profile_entity.dart';
import 'package:xmanager/src/features/dashboard/domain/repositories/dashboard_repository.dart';

class GetDashboardProfile {
  final DashboardRepository _dashboardRepository;
  GetDashboardProfile(this._dashboardRepository);

  Future<DashboardProfileEntity> call() async =>
      _dashboardRepository.getProfile();
}