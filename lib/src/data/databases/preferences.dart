import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xmanager/src/data/models/account.dart';

class Preferences {
  static String accountPreferences = "PROFILE_SHARED_PREFERENCES";

  Preferences();

  Future read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key)!);
  }

  static Future<void> saveAccount(Account account) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final accountString = json.encode(account.toMap());
    sharedPreferences.setString(accountPreferences, accountString);
  }

  static Future<Account?> currentAccount() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String accountString =
        sharedPreferences.getString(accountPreferences) ?? "";
    final data = json.decode(accountString) as Map<String, dynamic>;
    final Account account = Account.fromMap(data);
    return account;
  }
}
