import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xmanager/src/core/platform/permissions_datasource.dart';
import 'package:xmanager/src/data/datasources/local/ble_datasource.dart';
import 'package:xmanager/src/data/datasources/local/shared_preferences_datasource.dart';
import 'package:xmanager/src/data/datasources/remote/remote_datasource_impl.dart';
import 'package:xmanager/src/data/repository/ble_repository_impl.dart';
import 'package:xmanager/src/data/repository/permissions_repository_impl.dart';
import 'package:xmanager/src/data/repository/user_repository_impl.dart';
import 'package:xmanager/src/domain/repository/ble_repository.dart';
import 'package:xmanager/src/domain/repository/permissions_repository.dart';
import 'package:xmanager/src/domain/repository/user_repository.dart';
import 'package:xmanager/src/domain/usecases/auth_current_usecase.dart';
import 'package:xmanager/src/domain/usecases/auth_logout_usecase.dart';
import 'package:xmanager/src/domain/usecases/ble_usecases.dart';
import 'package:xmanager/src/domain/usecases/get_app_permissions.dart';
import 'package:xmanager/src/domain/usecases/get_current_user_usecase.dart';
import 'package:xmanager/src/domain/usecases/login_with_email_usecase.dart';
import 'package:xmanager/src/presentation/bloc/app/app_bloc.dart';
import 'package:xmanager/src/presentation/bloc/bloc.dart';
import 'package:xmanager/src/presentation/bloc/player/player_bloc.dart';
import 'package:xmanager/src/presentation/bloc/user/user_bloc.dart';

final getIt = GetIt.instance;

final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  // Bloc
  sl.registerFactory(
    () => AuthBloc(
      authCurrentUseCase: sl(),
      authLogOutUseCase: sl(),
      logInWithEmailUseCase: sl(),
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
    () => UserBloc(
      currentUserUseCase: sl(),
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
  sl.registerFactory(
    () => PlayerBloc(
        // savePlayerUseCase: sl(),
        ),
  );

  // UseCases
  sl.registerLazySingleton(() => AuthCurrentUseCase(sl()));
  sl.registerLazySingleton(() => LogInWithEmailUseCase(sl()));
  sl.registerLazySingleton(() => AuthLogOutUseCase(sl()));

  sl.registerLazySingleton(() => LocationPermissionsGrantedUseCase(sl()));
  sl.registerLazySingleton(() => RequestLocationPermissionsUseCase(sl()));
  sl.registerLazySingleton(() => BluetoothPermissionsGrantedUseCase(sl()));
  sl.registerLazySingleton(() => RequestBluetoothPermissionsUseCase(sl()));
  sl.registerLazySingleton(
      () => BluetoothConnectPermissionsGrantedUseCase(sl()));
  sl.registerLazySingleton(
      () => RequestBluetoothConnectPermissionsUseCase(sl()));
  sl.registerLazySingleton(() => BluetoothScanPermissionsGrantedUseCase(sl()));
  sl.registerLazySingleton(() => RequestBluetoothScanPermissionsUseCase(sl()));

  sl.registerLazySingleton(() => GetCurrentUserUseCase(sl()));

  // BLE usecases
  
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
  sl.registerLazySingleton<PermissionsRepository>(
    () => PermissionsRepositoryImpl(
      permissionsDataSourceImpl: sl(),
    ),
  );
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDataSourceImpl: sl(),
      sharedPreferencesDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<BleRepository>(
    () => BleRepositoryImpl(sl()),
  );

  // Data sources
  sl.registerLazySingleton(
    () => RemoteDataSourceImpl(),
  );
  sl.registerLazySingleton(
    () => PermissionsDataSourceImpl(),
  );
  sl.registerLazySingleton(
    () => SharedPreferencesDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );
  sl.registerLazySingleton(() => BleDataSourceImpl());

  //sl.registerSingleton(SharedPreferencesService);
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
