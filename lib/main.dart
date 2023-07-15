import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xmanager/src/config/theme/app_theme.dart';
import 'package:xmanager/src/core/data/datasources/shared_preferences_datasource.dart';
import 'package:xmanager/src/core/data/repository/app_repository_impl.dart';
import 'package:xmanager/src/core/databases/objectbox_db.dart';
import 'package:xmanager/src/core/domain/repository/app_repository.dart';
import 'package:xmanager/src/core/domain/usecases/authorised_user.dart';
import 'package:xmanager/src/core/domain/usecases/unlock_user.dart';
import 'package:xmanager/src/core/presentation/bloc/user/bloc.dart';
import 'package:xmanager/src/core/utils/common.dart';
import 'package:xmanager/src/features/auth/presentation/pages/login_page.dart';
import 'package:xmanager/src/features/dashboard/presentation/pages/dashboard_page.dart';
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
      authorisedUserUseCase: sl(),
      unlockUserUseCase: sl(),
    ),
  );

  // UseCases
  sl.registerLazySingleton(() => AuthorizedUserUseCase(sl()));
  sl.registerLazySingleton(() => UnlockUserUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(sl()),
  );

  // Data sources
  sl.registerLazySingleton(
    () => SharedPreferencesDataSourceImpl(
      sharedPreferences: sl(),
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

  //final provider = GoRouterProvider();
  //sl.registerLazySingleton(() => provider);
  //sl.registerSingleton<GoRouterProvider>(GoRouterProvider());

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (_) =>
              sl()..add(const StartUserEvent()), //..add(const UserGetEvent()),
        ),
        /*BlocProvider<AppBloc>(
          create: (_) => sl()..add(const UserDataGetEvent()),
        ),*/
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
    //final router = sl.get<GoRouterProvider>();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: GoRouter(
        initialLocation: '/auth',
        /* context.watch<UserBloc>().state is UserStateAuthorized
                ? '/'
                : '/auth',
                */
        // navigatorKey: _rootNavigatorKey,
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
            path: '/auth',
            builder: (context, state) => const LoginPage(),
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
