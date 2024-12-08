import 'package:get_it/get_it.dart';
import 'package:xmanager/src/features/auth/presentation/bloc/login_bloc.dart';
import 'package:xmanager/src/features/dashboard/data/repository/home_repository_impl.dart';
import 'package:xmanager/src/features/dashboard/domain/repositories/home_repository.dart';
import 'package:xmanager/src/features/dashboard/domain/usecases/get_home_data_usecase.dart';
import 'package:xmanager/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:xmanager/src/features/device/presentation/bloc/device_bloc.dart';
import 'package:xmanager/src/features/training/presentation/bloc/training_program_bloc.dart';
import 'package:xmanager/src/shared/data/datasources/local/ble_datasource.dart';
import 'package:xmanager/src/shared/data/datasources/local/network_datasource.dart';
import 'package:xmanager/src/shared/data/datasources/local/permissions_datasource.dart';
import 'package:xmanager/src/shared/data/datasources/local/utils_datasource.dart';
import 'package:xmanager/src/shared/data/datasources/remote/remote_datasource.dart';
import 'package:xmanager/src/shared/data/repository/ble_repository_impl.dart';
import 'package:xmanager/src/shared/data/repository/device_repository_impl.dart';
import 'package:xmanager/src/shared/data/repository/permissions_repository_impl.dart';
import 'package:xmanager/src/shared/data/repository/program_repository_impl.dart';
import 'package:xmanager/src/shared/data/repository/user_repository_impl.dart';
import 'package:xmanager/src/shared/data/repository/utils_repository_impl.dart';
import 'package:xmanager/src/shared/domain/repository/ble_repository.dart';
import 'package:xmanager/src/shared/domain/repository/device_repository.dart';
import 'package:xmanager/src/shared/domain/repository/permissions_repository.dart';
import 'package:xmanager/src/shared/domain/repository/program_repository.dart';
import 'package:xmanager/src/shared/domain/repository/user_repository.dart';
import 'package:xmanager/src/shared/domain/repository/utils_repository.dart';
import 'package:xmanager/src/shared/domain/usecases/auth_logout_usecase.dart';
import 'package:xmanager/src/shared/domain/usecases/ble_usecases.dart';
import 'package:xmanager/src/shared/domain/usecases/get_app_permissions.dart';
import 'package:xmanager/src/shared/domain/usecases/get_current_user_usecase.dart';
import 'package:xmanager/src/shared/domain/usecases/get_devices_usecase.dart';
import 'package:xmanager/src/shared/domain/usecases/get_programs_usecase.dart';
import 'package:xmanager/src/shared/domain/usecases/login_with_email_usecase.dart';
import 'package:xmanager/src/shared/domain/usecases/password_strength_color_usecase.dart';
import 'package:xmanager/src/shared/domain/usecases/password_strength_perc_usecase.dart';
import 'package:xmanager/src/shared/domain/usecases/valid_email_usecase%20copy.dart';
import 'package:xmanager/src/shared/presentation/bloc/app/app_bloc.dart';
import 'package:xmanager/src/shared/presentation/bloc/bloc.dart';

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
    () => DashboardBloc(
      getHomeDataUseCase: sl(),
      bleConnectPermissions: sl(),
      bleConnect: sl(),
      bleDisconnect: sl(),
      bleConnected: sl(),
      bleDiscoverServices: sl(),
      bleWrite: sl(),
      getDevicesUsecase: sl(),
      getProgramsUseCase: sl(),
    ),
  );

  sl.registerFactory(
    () => TrainingProgramBloc(
      getProgramsUseCase: sl(), 
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
      locationPermissions: sl(),
      bluetoothPermissions: sl(),
      bluetoothConnectPermissions: sl(),
      bluetoothScanPermissions: sl(),
      goToSettings: sl(),
    ),
  );

  sl.registerFactory(
    () => BleBloc(
      bleDeviceIsConnectedUseCase: sl(),
      bleDiscoverServicesUseCase: sl(),
      bluetoothConnectUseCase: sl(),
      bleDisconnectDeviceUseCase: sl(),
      bleDeviceConnectedUseCase: sl(),
      bleReadUseCase: sl(),
      bleWriteUseCase: sl(),
      bleLastValueStreamUseCase: sl(),
      bleSetNotificationUseCase: sl(),
    ),
  );

  sl.registerFactory(
    () => DeviceBloc(
      bleConnectPermissions: sl(),
      bleConnect: sl(),
      bleDisconnect: sl(),
      bleConnected: sl(),
      bleDiscoverServices: sl(),
      bleWrite: sl(),
    ),
  );

  // UseCases
  sl.registerLazySingleton(() => LogInWithEmailUseCase(sl()));
  sl.registerLazySingleton(() => LogOutUserUseCase(sl()));

  sl.registerLazySingleton(() => LocationPermissionsUseCase(sl()));
  sl.registerLazySingleton(() => BluetoothPermissionsUseCase(sl()));
  sl.registerLazySingleton(() => BluetoothConnectPermissionsUseCase(sl()));
  sl.registerLazySingleton(() => BluetoothScanPermissionsUseCase(sl()));
  sl.registerLazySingleton(() => GoToSettingsUseCase(sl()));

  sl.registerLazySingleton(() => GetCurrentUserUseCase(sl()));
  sl.registerLazySingleton(() => ValidEmailUseCase(sl()));
  sl.registerLazySingleton(() => PasswordStrengthPercUseCase(sl()));
  sl.registerLazySingleton(() => PasswordStrengthColorUseCase(sl()));
  sl.registerLazySingleton(() => BleDeviceIsConnectedUseCase(sl()));
  sl.registerLazySingleton(() => BleDiscoverServicesUseCase(sl()));
  sl.registerLazySingleton(() => BluetoothConnectUseCase(sl()));
  sl.registerLazySingleton(() => BleDisconnectDeviceUseCase(sl()));
  sl.registerLazySingleton(() => BleDeviceConnectedUseCase(sl()));
  sl.registerLazySingleton(() => BleReadUseCase(sl()));
  sl.registerLazySingleton(() => BleWriteUseCase(sl()));
  sl.registerLazySingleton(() => BleLastValueStreamUseCase(sl()));
  sl.registerLazySingleton(() => BleSetNotificationUseCase(sl()));
  sl.registerLazySingleton(() => GetProgramsUseCase(sl()));
  sl.registerLazySingleton(() => GetHomeDataUseCase(sl()));
  sl.registerLazySingleton(() => GetDevicesUsecase(sl()));

  // Repository
  sl.registerLazySingleton<BleRepository>(() => BleRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<PermissionsRepository>(
    () => PermissionsRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(sl(), sl()),
  );
  sl.registerLazySingleton<UtilsRepository>(() => UtilsRepositoryImpl(sl()));
  sl.registerLazySingleton<ProgramRepository>(
    () => ProgramRepositoryImpl(sl(), sl()),
  );
  sl.registerLazySingleton<HomeRepository>(
    () => const HomeRepositoryImpl(),
  );
  sl.registerLazySingleton<DeviceRepository>(
    () => DeviceRepositoryImpl(sl(), sl()),
  );

  // Data sources
  sl.registerLazySingleton<BleDataSource>(
    () => BleDataSourceImpl(),
  );
  sl.registerLazySingleton<NetworkDataSource>(() => NetworkDataSourceImpl());
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
  sl.registerLazySingleton<PermissionsDataSource>(
    () => PermissionsDataSourceImpl(),
  );
  /*sl.registerLazySingleton<SharedPreferencesDataSource>(
    () => SharedPreferencesDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );*/
  sl.registerLazySingleton<UtilsDataSource>(() => UtilsDataSourceImpl());

  // Objectbox
  //final objectBox = await ObjectBox.create();
  //sl.registerSingleton(objectBox);
  //sl.registerLazySingletonAsync<ObjectBox>(() => ObjectBox.create());

  //! Core
  // input converter etc

  //! External
  // Drivers, network hardware data
  //final sharedPreferences = await SharedPreferences.getInstance();
  //sl.registerLazySingleton(() => sharedPreferences);
}
