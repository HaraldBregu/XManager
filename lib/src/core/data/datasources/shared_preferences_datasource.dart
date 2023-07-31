import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xmanager/src/core/data/models/app_model.dart';
import 'package:xmanager/src/core/data/models/user_model.dart';

abstract class SharedPreferencesDataSource {
  Future<AppModel> getApp();
  Future<bool> setApp(AppModel app);
  Future<UserModel> getUser();
  Future<bool> setUserFullName(String fullname);
  Future<bool> clearUserFullName();
}

class SharedPreferencesDataSourceImpl implements SharedPreferencesDataSource {
  SharedPreferencesDataSourceImpl({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  static String kAppSharedPrefs = "APP_SHARED_PREFERENCES";
  static String kUserSharedPrefs = "USER_SHARED_PREFERENCES";

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
  Future<UserModel> getUser() async {
    final string = sharedPreferences.getString(kUserSharedPrefs);

    if (string != null) {
      final map = json.decode(string) as Map<String, dynamic>;
      final user = UserModel.fromMap(map);
      return user;
    }

    return const UserModel(
      authenticated: false,
      fullname: "",
      description: "",
      firstName: "",
      lastName: "",
    );
  }

  @override
  Future<bool> setUserFullName(String fullname) async {
    final string = sharedPreferences.getString(kUserSharedPrefs);

    if (string != null) {
      final map = json.decode(string) as Map<String, dynamic>;
      final user = UserModel.fromMap(map);
      final newUser = user.copyWith(fullname: fullname, authenticated: true);
      final appString = json.encode(newUser.toMap());
      return sharedPreferences.setString(kUserSharedPrefs, appString);
    }

    final newUser = UserModel(
      authenticated: true,
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
      final newUser = user.copyWith(fullname: "", authenticated: true);
      final appString = json.encode(newUser.toMap());
      return sharedPreferences.setString(kUserSharedPrefs, appString);
    }

    return true;
  }
}
