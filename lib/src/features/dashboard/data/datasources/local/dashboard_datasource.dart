import 'package:shared_preferences/shared_preferences.dart';
import 'package:xmanager/main.dart';
import 'package:xmanager/src/core/databases/preferences.dart';
import 'package:xmanager/src/core/error/exeptions.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/data/models/account.dart';
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
/*
  @override
  Future<DashboardProfileModel> getProfile() async {

    //Account account = Account(fullname: "Harald Bregu");
    //Account.fromMap(map)
    //final newAccount = prefs.get(DashboardProfileModel.fromJson());


    try {

      final profiles = await objectBox.getProfiles();
      final mProfiles =
          profiles.map((e) => DashboardProfileModel.fromJson(e.toJson()));
      if (mProfiles.isEmpty) {
        throw DatabaseFailure();
      }
      return mProfiles.first;
    } on DatabaseFailure {
      throw DatabaseExeption();
    }
  }*/

  @override
  Future<DashboardTrainingModel> getTraining() async {
    try {
      return objectBox.sessionProgramBox
          .getAll()
          .map((e) => DashboardTrainingModel.fromJson(e.toJson()))
          .toList()
          .first;
    } on DatabaseFailure {
      throw DatabaseExeption();
    }
  }

  @override
  Future<DashboardProfileModel> getProfile() async {
    final currentAccount = await Preferences.currentAccount();
    if (currentAccount != null) {
      final map = currentAccount.toMap();
      try {
        return DashboardProfileModel.fromJson(map);
      } catch (err) {
        throw DatabaseFailure();
      }
    } else {
      throw DatabaseFailure();
    }
  }
}
