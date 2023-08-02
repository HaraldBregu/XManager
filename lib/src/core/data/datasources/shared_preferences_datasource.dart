import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xmanager/src/core/data/models/app_model.dart';
import 'package:xmanager/src/core/data/models/user_model.dart';

abstract class SharedPreferencesDataSource {
  Future<UserModel> getUser();

  Future<AppModel> getApp();
  Future<bool> setApp(AppModel app);
  Future<bool> setUserFullName(String fullname);
  Future<bool> clearUserFullName();
}

class SharedPreferencesDataSourceImpl implements SharedPreferencesDataSource {
  SharedPreferencesDataSourceImpl({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  static String kAppSharedPrefs = "APP_SHARED_PREFERENCES";
  static String kUserSharedPrefs = "USER_SHARED_PREFERENCES";

  @override
  Future<UserModel> getUser() async {
    final string = sharedPreferences.getString(kUserSharedPrefs);

    if (string != null) {
      final map = json.decode(string) as Map<String, dynamic>;
      final user = UserModel.fromMap(map);
      return user;
    }

    return const UserModel(
      fullname: "",
      description: "",
      firstName: "",
      lastName: "",
    );
  }
  
  @override
  Future<AppModel> getApp() async {
    return const AppModel(
      version: "123",
      darkMode: true,
    );
  }

  @override
  Future<bool> setApp(AppModel app) async {
    final appString = json.encode(app.toMap());
    return sharedPreferences.setString(kAppSharedPrefs, appString);
  }

 

  @override
  Future<bool> setUserFullName(String fullname) async {
    final string = sharedPreferences.getString(kUserSharedPrefs);

    if (string != null) {
      final map = json.decode(string) as Map<String, dynamic>;
      final user = UserModel.fromMap(map);
      final newUser = user.copyWith(fullname: fullname);
      final appString = json.encode(newUser.toMap());
      return sharedPreferences.setString(kUserSharedPrefs, appString);
    }

    final newUser = UserModel(
      fullname: fullname,
      description: "",
      firstName: "",
      lastName: "",
    );

    final appString = json.encode(newUser.toMap());
    return sharedPreferences.setString(kUserSharedPrefs, appString);
  }

  @override
  Future<bool> clearUserFullName() async {
    final string = sharedPreferences.getString(kUserSharedPrefs);

    if (string != null) {
      final map = json.decode(string) as Map<String, dynamic>;
      final user = UserModel.fromMap(map);
      final newUser = user.copyWith(fullname: "");
      final appString = json.encode(newUser.toMap());
      return sharedPreferences.setString(kUserSharedPrefs, appString);
    }

    return true;
  }
}
