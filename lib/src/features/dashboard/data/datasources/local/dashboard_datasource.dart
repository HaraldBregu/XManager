import 'package:xmanager/main.dart';
import 'package:xmanager/src/features/dashboard/data/models/dashboard_player_model.dart';
import 'package:xmanager/src/features/dashboard/data/models/dashboard_profile_model.dart';
import 'package:xmanager/src/features/dashboard/data/models/dashboard_training_model.dart';

abstract class DashboardDataSource {
  Future<DashboardProfileModel> getProfile();
  Future<DashboardTrainingModel> getTraining();
  Future<List<DashboardPlayerModel>> getPlayers();
}

class DashboardDataSourceImpl implements DashboardDataSource {
  const DashboardDataSourceImpl();

  @override
  Future<List<DashboardPlayerModel>> getPlayers() async {
    return objectBox.playerBox
        .getAll()
        .map((e) => DashboardPlayerModel.fromJson(e.toJson()))
        .toList();
  }

  @override
  Future<DashboardProfileModel> getProfile() async {
    return objectBox.profileBox
        .getAll()
        .map((e) => DashboardProfileModel.fromJson(e.toJson()))
        .toList()
        .first;
  }

  @override
  Future<DashboardTrainingModel> getTraining() async {
    return objectBox.sessionProgramBox
        .getAll()
        .map((e) => DashboardTrainingModel.fromJson(e.toJson()))
        .toList()
        .first;
  }
}
