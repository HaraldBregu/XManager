import 'package:xmanager/src/core/datamodel/datamodels.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_profile_entity.dart';

class DashboardProfileModel extends DashboardProfileEntity {
  const DashboardProfileModel({required super.fullname});

  factory DashboardProfileModel.fromProfile(Profile profile) {
    return DashboardProfileModel(fullname: profile.fullname);
  }
}
