import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xmanager/src/config/theme/app_theme.dart';
import 'package:xmanager/src/core/common.dart';
import 'package:xmanager/src/core/data/datasources/ble_datasource.dart';
import 'package:xmanager/src/core/data/datasources/shared_preferences_datasource.dart';
import 'package:xmanager/src/core/data/repository/app_repository_impl.dart';
import 'package:xmanager/src/core/data/repository/ble_repository_impl.dart';
import 'package:xmanager/src/core/databases/objectbox_db.dart';
import 'package:xmanager/src/core/domain/repository/app_repository.dart';
import 'package:xmanager/src/core/domain/repository/ble_repository.dart';
import 'package:xmanager/src/core/domain/usecases/authorised_user.dart';
import 'package:xmanager/src/core/domain/usecases/current_user.dart';
import 'package:xmanager/src/core/domain/usecases/exit_user.dart';
import 'package:xmanager/src/core/domain/usecases/get_ble_devices.dart';
import 'package:xmanager/src/core/domain/usecases/start_ble_scan.dart';
import 'package:xmanager/src/core/domain/usecases/stop_ble_scan.dart';
import 'package:xmanager/src/core/domain/usecases/unlock_user.dart';
import 'package:xmanager/src/core/presentation/bloc/ble/ble_bloc.dart';
import 'package:xmanager/src/core/presentation/bloc/user/bloc.dart';
import 'package:xmanager/src/features/auth/presentation/pages/login_page.dart';
import 'package:xmanager/src/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:xmanager/src/features/device/presentation/pages/device_add.dart';
import 'package:xmanager/src/features/device/presentation/pages/device_list.dart';
import 'package:xmanager/src/features/player/presentation/pages/player_create.dart';
import 'package:xmanager/src/features/player/presentation/pages/player_detail.dart';
import 'package:xmanager/src/features/player/presentation/pages/player_list.dart';
import 'package:xmanager/src/features/player/presentation/pages/player_update.dart';
import 'package:xmanager/src/features/program/presentation/pages/program_create.dart';
import 'package:xmanager/src/features/program/presentation/pages/program_detail.dart';
import 'package:xmanager/src/features/program/presentation/pages/program_list.dart';
import 'package:xmanager/src/features/program/presentation/pages/program_update.dart';
import 'package:xmanager/src/features/settings/presentation/pages/permissions_page.dart';
import 'package:xmanager/src/features/settings/presentation/pages/settings_page.dart';

late ObjectBox objectBox;
final sl = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //objectBox = await ObjectBox.create();

  //await initializeDependencies();

  //! Features

  // Bloc
  sl.registerFactory(
    () => UserBloc(
      currentUserUseCase: sl(),
      authorisedUserUseCase: sl(),
      unlockUserUseCase: sl(),
      exitUserUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => BleBloc(
      startBleScanUseCase: sl(),
      stopBleScanUseCase: sl(),
      getBleDevicesUseCase: sl(),
    ),
  );

  // UseCases
  sl.registerLazySingleton(() => CurrentUserUseCase(sl()));
  sl.registerLazySingleton(() => AuthorizedUserUseCase(sl()));
  sl.registerLazySingleton(() => UnlockUserUseCase(sl()));
  sl.registerLazySingleton(() => ExitUserUseCase(sl()));
  //sl.registerLazySingleton(() => GetBleDevicesUseCase(sl()));
  sl.registerLazySingleton(() => StartBleScanUseCase(sl()));
  sl.registerLazySingleton(() => StopBleScanUseCase(sl()));
  sl.registerLazySingleton(() => GetBleDevicesUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<BleRepository>(
    () => BleRepositoryImpl(sl()),
  );

  // Data sources
  sl.registerLazySingleton(
    () => SharedPreferencesDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => BleDataSourceImpl(
      flutterBluePlus: sl(),
    ),
  );

  //sl.registerSingleton(SharedPreferencesService);
  // Objectbox
  //final objectBox = await ObjectBox.create();
  //sl.registerSingleton(objectBox);
  //sl.registerLazySingletonAsync<ObjectBox>(() => ObjectBox.create());

//final route = sl.get<Gorouterpr>()

  // Dio

  // Dependencies
  //sl.registerSingleton(SharedPreferencesServiceImpl);

  //sl.registerSingleton(UserRepositoryImpl(sl()));

  // UseCases
  //sl.registerSingleton<GetUserUseCase>(GetUserUseCase(sl()));

  //sl.registerFactory<UserDataBloc>(() => UserDataBloc(sl()));

  //! Core
  // input converter etc

  //! External
  // Drivers, network hardware data
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => FlutterBluePlus.instance);

  //final provider = GoRouterProvider();
  //sl.registerLazySingleton(() => provider);
  //sl.registerSingleton<GoRouterProvider>(GoRouterProvider());

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (_) => sl()..add(InitialUserEvent()),
        ),
        BlocProvider<BleBloc>(
          create: (_) => sl(),
        ),
      ],
      child: const App(),
    ),
  );
}

/*
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey(
  debugLabel: 'shell',
);

class GoRouterProvider {
  GoRouter goRouter() {
    return GoRouter(
      initialLocation: '/test',
      navigatorKey: _rootNavigatorKey,
      routes: [
        /*
          ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) {
              return SettingsPage(key: state.pageKey,)
            },
            routes: [
            ],
          ), 
          */

        GoRoute(
          path: '/test',
          builder: (context, state) => const ExampleBlocWidget(),
        ),
        GoRoute(
          path: '/',
          builder: (context, state) => const DashboardPage(),
          routes: [
            GoRoute(
              path: 'player',
              builder: (context, state) => const SettingsPage(),
              routes: [
                GoRoute(
                  path: 'info',
                  builder: (context, state) => const PermissionsPage(),
                ),
              ],
            ),
            GoRoute(
              path: 'settings',
              builder: (context, state) => const SettingsPage(),
              routes: [
                GoRoute(
                  path: 'permissions',
                  builder: (context, state) => const PermissionsPage(),
                ),
              ],
            ),
          ],
        ),
      ],
      redirect: (context, state) {
        return null;
      },
    );
  }
}*/

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final userState = context.watch<UserBloc>().state;
    final userStateAuthorized = userState is UserAuthorizedState;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: GoRouter(
        //initialLocation: userStateAuthorized ? "/dashboard" : '/auth',
        redirect: (context, state) => userStateAuthorized ? null : '/auth',
        //errorBuilder: (context, state) => const ErrorPage(),
        routes: [
          GoRoute(
            name: "dashboard",
            path: "/",
            builder: (context, state) => const DashboardPage(),
            routes: [
              GoRoute(
                name: "settings",
                path: 'settings',
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
                    path: 'permissions',
                    builder: (context, state) => const PermissionsPage(),
                  ),
                ],
              ),
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
                name: "Player list",
                path: 'players',
                builder: (context, state) => const PlayerList(),
                routes: [
                  GoRoute(
                    name: "Player create",
                    path: 'create',
                    builder: (context, state) => const PlayerCreate(),
                  ),
                  GoRoute(
                    name: "Player update",
                    path: 'update',
                    builder: (context, state) => const PlayerUpdate(),
                  ),
                ],
              ),
              GoRoute(
                name: "Player detail",
                path: 'players/:id',
                builder: (context, state) => const PlayerDetail(),
              ),
              GoRoute(
                name: "Device list",
                path: 'devices',
                builder: (context, state) => const DeviceList(),
                routes: [
                  GoRoute(
                    name: "Device add",
                    path: 'add',
                    builder: (context, state) => const DeviceAdd(),
                  ),
                ],
              ),
            ],
          ),
          /*
          GoRoute(
            name: "program",
            path: '/program',
            builder: (context, state) => const ProgramDetail(),
            routes: [
              GoRoute(
                path: 'detail',
                builder: (context, state) => const SettingsPage(),
              ),
            ],
          ),
          GoRoute(
            name: "player",
            path: '/player',
            builder: (context, state) => const SettingsPage(),
            routes: [
              GoRoute(
                path: 'info',
                builder: (context, state) => const PermissionsPage(),
              ),
            ],
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsPage(),
            routes: [
              GoRoute(
                path: 'permissions',
                builder: (context, state) => const PermissionsPage(),
              ),
            ],
          ),*/
          GoRoute(
            name: "auth",
            path: '/auth',
            builder: (context, state) => const LoginPage(),
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
