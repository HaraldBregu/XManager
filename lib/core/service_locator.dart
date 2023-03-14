import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;

Future<void> setUpServiceLocator() async {

  //check if user logged in or not
  /*serviceLocator.registerFactory<CheckUserLoginStatus>(
        () => CheckUserLoginStatusImpl(),
  );*/

  //services
  //serviceLocator.registerSingleton<UserCacheService>(UserCacheService());
  //external
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerFactory<SharedPreferences>(() => sharedPreferences);
  // request
  //serviceLocator.registerSingleton<Request>(Request());

}