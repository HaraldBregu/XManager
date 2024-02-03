import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xmanager/src/data/datasources/local/ble_datasource.dart';
import 'package:xmanager/src/data/datasources/local/network_datasource.dart';
import 'package:xmanager/src/data/datasources/local/permissions_datasource.dart';
import 'package:xmanager/src/data/datasources/local/shared_preferences_datasource.dart';
import 'package:xmanager/src/data/datasources/local/utils_datasource.dart';
import 'package:xmanager/src/data/datasources/remote/remote_datasource.dart';
import 'package:xmanager/src/data/repository/ble_repository_impl.dart';
import 'package:xmanager/src/data/repository/permissions_repository_impl.dart';
import 'package:xmanager/src/data/repository/user_repository_impl.dart';
import 'package:xmanager/src/data/repository/utils_repository_impl.dart';
import 'package:xmanager/src/domain/repository/ble_repository.dart';
import 'package:xmanager/src/domain/repository/permissions_repository.dart';
import 'package:xmanager/src/domain/repository/user_repository.dart';
import 'package:xmanager/src/domain/repository/utils_repository.dart';
import 'package:xmanager/src/domain/usecases/auth_logout_usecase.dart';
import 'package:xmanager/src/domain/usecases/ble_usecases.dart';
import 'package:xmanager/src/domain/usecases/get_app_permissions.dart';
import 'package:xmanager/src/domain/usecases/get_current_user_usecase.dart';
import 'package:xmanager/src/domain/usecases/login_with_email_usecase.dart';
import 'package:xmanager/src/domain/usecases/password_strength_color_usecase.dart';
import 'package:xmanager/src/domain/usecases/password_strength_perc_usecase.dart';
import 'package:xmanager/src/domain/usecases/valid_email_usecase%20copy.dart';
import 'package:xmanager/src/presentation/bloc/app/app_bloc.dart';
import 'package:xmanager/src/presentation/bloc/bloc.dart';
import 'package:xmanager/src/presentation/screens/login/bloc/login_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  
  //! Features

  // Bloc
  sl.registerFactory(
    () => LoginBloc(
      validEmailUseCase: sl(),
      passwordStrengthPercUseCase: sl(),
      passwordStrengthColorUseCase: sl(),
    ),
  );

  sl.registerFactory(
    () => UserBloc(
      logInWithEmailUseCase: sl(),
      currentUserUseCase: sl(),
      logOutUserUseCase: sl(),
    ),
  );
  
  sl.registerFactory(
    () => AppBloc(
      locationPermissionsGrantedUseCase: sl(),
      requestLocationPermissionsUseCase: sl(),
      bluetoothPermissionsGrantedUseCase: sl(),
      requestBluetoothPermissionsUseCase: sl(),
      bluetoothConnectPermissionsGrantedUseCase: sl(),
      requestBluetoothConnectPermissionsUseCase: sl(),
      bluetoothScanPermissionsGrantedUseCase: sl(),
      requestBluetoothScanPermissionsUseCase: sl(),
    ),
  );

  sl.registerFactory(
    () => BleBloc(
      bleDeviceIsConnectedUseCase: sl(),
      bleDiscoverServicesUseCase: sl(),
      bleConnectDeviceUseCase: sl(),
      bleDisconnectDeviceUseCase: sl(),
      bleDeviceConnectedUseCase: sl(),
      bleReadUseCase: sl(),
      bleWriteUseCase: sl(),
      bleLastValueStreamUseCase: sl(),
      bleSetNotificationUseCase: sl(),
    ),
  );

  // UseCases
  sl.registerLazySingleton(() => LogInWithEmailUseCase(sl()));
  sl.registerLazySingleton(() => LogOutUserUseCase(sl()));
  sl.registerLazySingleton(() => LocationPermissionsGrantedUseCase(sl()));
  sl.registerLazySingleton(() => RequestLocationPermissionsUseCase(sl()));
  sl.registerLazySingleton(() => BluetoothPermissionsGrantedUseCase(sl()));
  sl.registerLazySingleton(() => RequestBluetoothPermissionsUseCase(sl()));
  sl.registerLazySingleton(
    () => BluetoothConnectPermissionsGrantedUseCase(sl()),
  );
  sl.registerLazySingleton(
    () => RequestBluetoothConnectPermissionsUseCase(sl()),
  );
  sl.registerLazySingleton(() => BluetoothScanPermissionsGrantedUseCase(sl()));
  sl.registerLazySingleton(() => RequestBluetoothScanPermissionsUseCase(sl()));
  sl.registerLazySingleton(() => GetCurrentUserUseCase(sl()));
  sl.registerLazySingleton(() => ValidEmailUseCase(sl()));
  sl.registerLazySingleton(() => PasswordStrengthPercUseCase(sl()));
  sl.registerLazySingleton(() => PasswordStrengthColorUseCase(sl()));
  sl.registerLazySingleton(() => BleDeviceIsConnectedUseCase(sl()));
  sl.registerLazySingleton(() => BleDiscoverServicesUseCase(sl()));
  sl.registerLazySingleton(() => BleConnectDeviceUseCase(sl()));
  sl.registerLazySingleton(() => BleDisconnectDeviceUseCase(sl()));
  sl.registerLazySingleton(() => BleDeviceConnectedUseCase(sl()));
  sl.registerLazySingleton(() => BleReadUseCase(sl()));
  sl.registerLazySingleton(() => BleWriteUseCase(sl()));
  sl.registerLazySingleton(() => BleLastValueStreamUseCase(sl()));
  sl.registerLazySingleton(() => BleSetNotificationUseCase(sl()));

  // Repository
  sl.registerLazySingleton<BleRepository>(() => BleRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<PermissionsRepository>(
    () => PermissionsRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(sl(), sl()),
  );
  sl.registerLazySingleton<UtilsRepository>(() => UtilsRepositoryImpl(sl()));

  // Data sources
  sl.registerLazySingleton<BleDataSource>(() => BleDataSourceImpl());
  sl.registerLazySingleton<NetworkDataSource>(() => NetworkDataSourceImpl());
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
  sl.registerLazySingleton<PermissionsDataSource>(
    () => PermissionsDataSourceImpl(),
  );
  sl.registerLazySingleton<SharedPreferencesDataSource>(
    () => SharedPreferencesDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );
  sl.registerLazySingleton<UtilsDataSource>(() => UtilsDataSourceImpl());

  // Objectbox
  //final objectBox = await ObjectBox.create();
  //sl.registerSingleton(objectBox);
  //sl.registerLazySingletonAsync<ObjectBox>(() => ObjectBox.create());

  //! Core
  // input converter etc

  //! External
  // Drivers, network hardware data
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
