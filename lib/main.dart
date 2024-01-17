import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:xmanager/app_theme.dart';
import 'package:xmanager/firebase_options.dart';
import 'package:xmanager/injection_container.dart' as di;
import 'package:xmanager/injection_container.dart';
import 'package:xmanager/src/core/common.dart';
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
import 'package:xmanager/src/presentation/screens/ble/device_screen.dart';
import 'package:xmanager/src/presentation/screens/ble/device_search.dart';
import 'package:xmanager/src/presentation/screens/home/dashboard_screen.dart';
import 'package:xmanager/src/presentation/screens/home/profile_page.dart';
import 'package:xmanager/src/presentation/screens/home/program_create.dart';
import 'package:xmanager/src/presentation/screens/home/program_detail.dart';
import 'package:xmanager/src/presentation/screens/home/program_list.dart';
import 'package:xmanager/src/presentation/screens/home/program_update.dart';
import 'package:xmanager/src/presentation/screens/settings/account_page.dart';
import 'package:xmanager/src/presentation/screens/settings/permissions_page.dart';
import 'package:xmanager/src/presentation/screens/settings/settings_page.dart';
import 'package:xmanager/src/presentation/screens/start/start_page.dart';

//late ObjectBox objectBox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //objectBox = await ObjectBox.create();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await di.init();
  
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
      themeMode: ThemeMode.dark,
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
            builder: (context, state) => const DashboardScreen(),
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
                  id: state.pathParameters['id'],
                ),
              ),
              GoRoute(
                name: "Profile page",
                path: 'profile/:id',
                builder: (context, state) => const ProfilePage(),
              ),
              GoRoute(
                name: "Device screen",
                path: 'device',
                builder: (context, state) => const DeviceScreen(),
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
