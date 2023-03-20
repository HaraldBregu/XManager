import 'package:xmanager/main.dart';
import 'package:xmanager/src/features/dashboard/data/models/dashboard_player_model.dart';
import 'package:xmanager/src/features/dashboard/data/models/dashboard_profile_model.dart';
import 'package:xmanager/src/features/dashboard/data/models/dashboard_training_model.dart';

abstract class DashboardLocalDataSource {
  Future<DashboardProfileModel> getProfile();
  Future<DashboardTrainingModel> getTraining();
  Future<List<DashboardPlayerModel>> getPlayers();
}

class DashboardLocalDataSourceImpl implements DashboardLocalDataSource {

  @override
  Future<List<DashboardPlayerModel>> getPlayers() {
    throw UnimplementedError();
  }

  @override
  Future<DashboardProfileModel> getProfile() async {
    final profile = await objectBox.getProfile();

    if (profile != null) {
      return DashboardProfileModel.fromProfile(profile);
    }

    return Future.value();
  }

  @override
  Future<DashboardTrainingModel> getTraining() {
    // TODO: implement getTraining
    throw UnimplementedError();
  }

}
