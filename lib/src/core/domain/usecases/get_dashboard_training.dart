import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/domain/entities/dashboard_training_entity.dart';
import 'package:xmanager/src/core/failures.dart';
import 'package:xmanager/src/core/domain/repository/dashboard_repository.dart';

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
