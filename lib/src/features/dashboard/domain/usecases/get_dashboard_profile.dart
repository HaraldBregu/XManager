import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_profile_entity.dart';
import 'package:xmanager/src/features/dashboard/domain/repositories/dashboard_repository.dart';

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
