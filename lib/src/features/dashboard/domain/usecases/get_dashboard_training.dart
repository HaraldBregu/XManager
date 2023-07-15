import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_training_entity.dart';
import 'package:xmanager/src/features/dashboard/domain/repositories/dashboard_repository.dart';

abstract class GetDashboardTraining {
  Future<Either<Failure, DashboardTrainingEntity>> execute();
}

class GetDashboardTrainingImpl implements GetDashboardTraining {
  final DashboardRepository _dashboardRepository;

  GetDashboardTrainingImpl(this._dashboardRepository);

  @override
  Future<Either<Failure, DashboardTrainingEntity>> execute() {
    return _dashboardRepository.getTraining();
  }
}
