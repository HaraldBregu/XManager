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
import 'package:xmanager/src/core/data/datasources/player_datasource.dart';
import 'package:xmanager/src/core/data/datasources/shared_preferences_datasource.dart';
import 'package:xmanager/src/core/data/repository/app_repository_impl.dart';
import 'package:xmanager/src/core/data/repository/ble_repository_impl.dart';
import 'package:xmanager/src/core/data/repository/player_repository_impl.dart';
import 'package:xmanager/src/core/data/repository/user_repository_impl.dart';
import 'package:xmanager/src/core/databases/objectbox_db.dart';
import 'package:xmanager/src/core/domain/repository/app_repository.dart';
import 'package:xmanager/src/core/domain/repository/ble_repository.dart';
import 'package:xmanager/src/core/domain/repository/player_repository.dart';
import 'package:xmanager/src/core/domain/repository/user_repository.dart';
import 'package:xmanager/src/core/domain/usecases/current_user.dart';
import 'package:xmanager/src/core/domain/usecases/exit_user.dart';
import 'package:xmanager/src/core/domain/usecases/save_player.dart';
import 'package:xmanager/src/core/domain/usecases/start_ble_scan.dart';
import 'package:xmanager/src/core/domain/usecases/stop_ble_scan.dart';
import 'package:xmanager/src/core/domain/usecases/unlock_user.dart';
import 'package:xmanager/src/core/presentation/bloc/ble/ble_bloc.dart';
import 'package:xmanager/src/core/presentation/bloc/player/bloc.dart';
import 'package:xmanager/src/core/presentation/bloc/user/bloc.dart';
import 'package:xmanager/src/features/auth/pages/login_page.dart';
import 'package:xmanager/src/features/auth/pages/recovery_page.dart';
import 'package:xmanager/src/features/auth/pages/signup_page.dart';
import 'package:xmanager/src/features/auth/pages/start_page.dart';
import 'package:xmanager/src/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:xmanager/src/features/device/pages/device_add.dart';
import 'package:xmanager/src/features/device/pages/device_list.dart';
import 'package:xmanager/src/features/player/pages/player_create.dart';
import 'package:xmanager/src/features/player/pages/player_detail.dart';
import 'package:xmanager/src/features/player/pages/player_list.dart';
import 'package:xmanager/src/features/player/pages/player_update.dart';
import 'package:xmanager/src/features/program/presentation/pages/program_create.dart';
import 'package:xmanager/src/features/program/presentation/pages/program_detail.dart';
import 'package:xmanager/src/features/program/presentation/pages/program_list.dart';
import 'package:xmanager/src/features/program/presentation/pages/program_update.dart';
import 'package:xmanager/src/features/settings/presentation/pages/permissions_page.dart';
import 'package:xmanager/src/features/settings/presentation/pages/profile_page.dart';
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
      // authorisedUserUseCase: sl(),
      unlockUserUseCase: sl(),
      exitUserUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => BleBloc(
      startBleScanUseCase: sl(),
      stopBleScanUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => PlayerBloc(
      savePlayerUseCase: sl(),
    ),
  );

  // UseCases
  sl.registerLazySingleton(() => CurrentUserUseCase(sl()));
//  sl.registerLazySingleton(() => AuthorizedUserUseCase(sl()));
  sl.registerLazySingleton(() => UnlockUserUseCase(sl()));
  sl.registerLazySingleton(() => ExitUserUseCase(sl()));
  sl.registerLazySingleton(() => StartBleScanUseCase(sl()));
  sl.registerLazySingleton(() => StopBleScanUseCase(sl()));
  sl.registerLazySingleton(() => SavePlayerUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<BleRepository>(
    () => BleRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<PlayerRepository>(
    () => PlayerRepositoryImpl(sl()),
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
  sl.registerLazySingleton(
    () => PlayerDataSourceImpl(
        //flutterBluePlus: sl(),
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
        BlocProvider<PlayerBloc>(
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
    final userBloc = context.watch<UserBloc>();
    final userState = userBloc.state;
    final userStateAuthorized = userState is UserAuthorizedState;
    //final userStateAuthorized = context.watch<UserBloc>().authorized;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: GoRouter(
        //initialLocation: userStateAuthorized ? "/dashboard" : '/auth',
        //initialLocation: "/start/signup",
        initialLocation: "/start",
        //redirect: (context, state) => userStateAuthorized ? null : '/start',
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
                    builder: (context, state) => PlayerCreate(),
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
              GoRoute(
                name: "Profile page",
                path: 'profile',
                builder: (context, state) => const ProfilePage(),
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
