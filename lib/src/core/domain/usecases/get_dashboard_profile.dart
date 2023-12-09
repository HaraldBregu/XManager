import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/domain/entities/dashboard_profile_entity.dart';
import 'package:xmanager/src/core/failures.dart';
import 'package:xmanager/src/core/domain/repository/dashboard_repository.dart';

abstract class GetDashboardProfile {
  Future<Either<Failure, DashboardProfileEntity>> execute();
}

class GetDashboardProfileImpl implements GetDashboardProfile {
  final DashboardRepository _dashboardRepository;

  GetDashboardProfileImpl(this._dashboardRepository);

  @override
  Future<Either<Failure, DashboardProfileEntity>> execute() async {
    return _dashboardRepository.getProfile();
  }
}
