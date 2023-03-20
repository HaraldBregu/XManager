import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_profile_entity.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_training_entity.dart';
import 'package:xmanager/src/features/dashboard/domain/repositories/dashboard_repository.dart';

class GetDashboardTraining {
  final DashboardRepository _dashboardRepository;
  GetDashboardTraining(this._dashboardRepository);

  Future<DashboardTrainingEntity> call() async =>
      _dashboardRepository.getTraining();
}