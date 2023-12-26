import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xmanager/firebase_options.dart';
import 'package:xmanager/src/config/theme/app_theme.dart';
import 'package:xmanager/src/core/common.dart';
import 'package:xmanager/src/core/data/databases/objectbox_db.dart';
import 'package:xmanager/src/core/data/datasources/local/bluetooth_datasource.dart';
import 'package:xmanager/src/core/data/datasources/local/permissions_datasource.dart';
import 'package:xmanager/src/core/data/datasources/local/shared_preferences_datasource.dart';
import 'package:xmanager/src/core/data/datasources/remote/remote_datasource_impl.dart';
import 'package:xmanager/src/core/data/repository/app_repository_impl.dart';
import 'package:xmanager/src/core/data/repository/bluetooth_repository_impl.dart';
import 'package:xmanager/src/core/data/repository/user_repository_impl.dart';
import 'package:xmanager/src/core/domain/repository/application_repository.dart';
import 'package:xmanager/src/core/domain/repository/bluetooth_repository.dart';
import 'package:xmanager/src/core/domain/repository/user_repository.dart';
import 'package:xmanager/src/core/domain/usecases/auth_current_usecase.dart';
import 'package:xmanager/src/core/domain/usecases/auth_login_usecase.dart';
import 'package:xmanager/src/core/domain/usecases/auth_logout_usecase.dart';
import 'package:xmanager/src/core/domain/usecases/bluetooth_usecases.dart';
import 'package:xmanager/src/core/domain/usecases/current_user.dart';
import 'package:xmanager/src/core/domain/usecases/get_app_permissions.dart';
import 'package:xmanager/src/presentation/bloc/app_bloc.dart';
import 'package:xmanager/src/presentation/bloc/app_event.dart';
import 'package:xmanager/src/presentation/bloc/bloc.dart';
import 'package:xmanager/src/presentation/bloc/player_bloc.dart';
import 'package:xmanager/src/presentation/bloc/user_bloc.dart';
import 'package:xmanager/src/presentation/bloc/user_event.dart';
import 'package:xmanager/src/presentation/screens/auth/login_page.dart';
import 'package:xmanager/src/presentation/screens/auth/recovery_page.dart';
import 'package:xmanager/src/presentation/screens/auth/signup_page.dart';
import 'package:xmanager/src/presentation/screens/ble/ble_debug_page.dart';
import 'package:xmanager/src/presentation/screens/ble/debug_page.dart';
import 'package:xmanager/src/presentation/screens/ble/device_list_page.dart';
import 'package:xmanager/src/presentation/screens/ble/device_page.dart';
import 'package:xmanager/src/presentation/screens/ble/device_search.dart';
import 'package:xmanager/src/presentation/screens/home/dashboard_page.dart';
import 'package:xmanager/src/presentation/screens/home/profile_page.dart';
import 'package:xmanager/src/presentation/screens/home/program_create.dart';
import 'package:xmanager/src/presentation/screens/home/program_detail.dart';
import 'package:xmanager/src/presentation/screens/home/program_list.dart';
import 'package:xmanager/src/presentation/screens/home/program_update.dart';
import 'package:xmanager/src/presentation/screens/settings/account_page.dart';
import 'package:xmanager/src/presentation/screens/settings/permissions_page.dart';
import 'package:xmanager/src/presentation/screens/settings/settings_page.dart';
import 'package:xmanager/src/presentation/screens/start/start_page.dart';

late ObjectBox objectBox;
final sl = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //objectBox = await ObjectBox.create();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('fonts/Poppins/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  


  //! Features

  // Bloc
  sl.registerFactory(
    () => AuthBloc(
      authCurrentUseCase: sl(),
      authLogOutUseCase: sl(),
      authLogInUseCase: sl(),
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
      bluetoothStartScan: sl(),
      bluetoothStopScan: sl(),
      bluetoothScanResults: sl(),
      bluetoothIsScanning: sl(),
      bluetoothConnectDevice: sl(),
      bluetoothDisconnectDevice: sl(),
      bluetoothDeviceConnected: sl(),
      bluetoothDiscoverServices: sl(),
    ),
  );
  sl.registerFactory(
    () => PlayerBloc(
        // savePlayerUseCase: sl(),
    ),
  );

  // UseCases
  sl.registerLazySingleton(() => AuthCurrentUseCase(sl()));
  sl.registerLazySingleton(() => AuthLogInUseCase(sl()));
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

  sl.registerLazySingleton(() => CurrentUserUseCase(sl()));
  sl.registerLazySingleton(() => BluetoothStartScan(sl()));
  sl.registerLazySingleton(() => BluetoothStopScan(sl()));
  sl.registerLazySingleton(() => BluetoothScanResults(sl()));

  sl.registerLazySingleton(() => BluetoothIsScanning(sl()));
  sl.registerLazySingleton(() => BluetoothConnectDevice(sl()));
  sl.registerLazySingleton(() => BluetoothDisconnectDevice(sl()));
  sl.registerLazySingleton(() => BluetoothDeviceConnected(sl()));
  sl.registerLazySingleton(() => BluetoothDiscoverServices(sl()));
  
  // Repository
  sl.registerLazySingleton<ApplicationRepository>(
    () => AppRepositoryImpl(
      sharedPreferencesDataSourceImpl: sl(),
      permissionsDataSourceImpl: sl(),
    ),
  );
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDataSourceImpl: sl(),
      sharedPreferencesDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<BluetoothRepository>(
    () => BluetoothRepositoryImpl(sl()),
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
  sl.registerLazySingleton(() => BluetoothDataSourceImpl());

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
  //sl.registerLazySingleton(() => FlutterBluePlus.instance);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => sl()..add(AuthEventInitial())),
        BlocProvider<AppBloc>(create: (_) => sl()..add(AppStartEvent())),
        BlocProvider<UserBloc>(create: (_) => sl()..add(InitialUserEvent())),
        BlocProvider<BleBloc>(create: (_) => sl()),
        BlocProvider<PlayerBloc>(create: (_) => sl()),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: GoRouter(
        //initialLocation: userStateAuthorized ? "/dashboard" : '/auth',
        //initialLocation: "/start/signup",
        //initialLocation: "/start",
        //initialLocation: "/auth",
        initialLocation:
            context.watch<AuthBloc>().state is AuthAuthenticatedState
                ? "/"
                : "/start",
        //initialLocation: "/players/:id",
        //initialLocation: "/debug/bluetooth",
        //redirect: (context, state) => userStateAuthorized ? null : '/start',
        /*redirect: (context, state) {
          final isAuthenticated =
              context.watch<AuthBloc>().state is AuthAuthenticatedState;

          print("###################");
          print(state);

          if (!isAuthenticated) {
            return "/start";
          } else if (isAuthenticated) {
            return '/';
          }
          return null;
        },*/
        //errorBuilder: (context, state) => const ErrorPage(),
        routes: [
          GoRoute(
            name: "dashboard",
            path: "/",
            builder: (context, state) => const DashboardPage(),
            routes: [
              GoRoute(
                name: "Program list",
                path: 'programs',
                builder: (context, state) => const ProgramList(),
                routes: [
                  GoRoute(
                    name: "Program create",
                    path: 'create',
                    builder: (context, state) => const ProgramCreate(),
                  ),
                  GoRoute(
                    name: "Program update",
                    path: 'update',
                    builder: (context, state) => const ProgramUpdate(),
                  ),
                ],
              ),
              GoRoute(
                name: "Program detail",
                path: 'programs/:id',
                builder: (context, state) => ProgramDetail(
                  id: state.params['id'],
                ),
              ),
              GoRoute(
                name: "Profile page",
                path: 'profile/:id',
                builder: (context, state) => const ProfilePage(),
              ),
              GoRoute(
                name: "Device list",
                path: 'devices',
                builder: (context, state) => const DeviceListPage(),
                routes: [
                  GoRoute(
                    name: "Device page",
                    path: 'devices/:id',
                    builder: (context, state) => const DevicePage(),
                  ),
                  // GoRoute(
                  //   name: "Device add",
                  //   path: 'add',
                  //   builder: (context, state) => const DeviceAdd(),
                  // ),
                ],
              ),
            ],
          ),
          GoRoute(
            name: "start",
            path: '/start',
            builder: (context, state) => const StartPage(),
            routes: [
              GoRoute(
                name: "login",
                path: 'login',
                builder: (context, state) => const LoginPage(),
              ),
              GoRoute(
                name: "signup",
                path: 'signup',
                builder: (context, state) => const SignupPage(),
              ),
              GoRoute(
                name: "recovery",
                path: 'recovery',
                builder: (context, state) => const RecoveryPage(),
              ),
            ],
          ),
          GoRoute(
            name: "Settings page",
            path: '/settings',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: const SettingsPage(),
                //transitionDuration: const Duration(milliseconds: 400),
                //fullscreenDialog: true,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: CurveTween(curve: Curves.easeInOutCirc)
                        .animate(animation),
                    child: child,
                  );
                },
              );
            },
            routes: [
              GoRoute(
                name: "Permissions page",
                path: 'permissions',
                builder: (context, state) => const PermissionsPage(),
              ),
              GoRoute(
                name: "Account page",
                path: 'account',
                builder: (context, state) => const AccountPage(),
              ),
              GoRoute(
                name: "Current profile page",
                path: 'profile',
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
          GoRoute(
            name: "Debug",
            path: '/debug',
            builder: (context, state) => const DebugPage(),
            routes: [
              GoRoute(
                name: "bluetooth debug page",
                path: 'bluetooth',
                builder: (context, state) => const BleDebugPage(),
              ),
              GoRoute(
                name: "bluetooth search page",
                path: 'bluetooth_search',
                builder: (context, state) => const DeviceSearch(),
              ),
              GoRoute(
                name: "bluetooth list page",
                path: 'bluetooth_list',
                builder: (context, state) => const DeviceListPage(),
              ),
            ],
          ),
        ],
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en"),
      ],
    );
  }
}
