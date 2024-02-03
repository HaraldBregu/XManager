import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:xmanager/app_router.dart';
import 'package:xmanager/app_theme.dart';
import 'package:xmanager/firebase_options.dart';
import 'package:xmanager/injection_container.dart' as di;
import 'package:xmanager/injection_container.dart';
import 'package:xmanager/src/core/common.dart';
import 'package:xmanager/src/presentation/bloc/app/app_bloc.dart';
import 'package:xmanager/src/presentation/bloc/app/app_event.dart';
import 'package:xmanager/src/presentation/bloc/bloc.dart';
import 'package:xmanager/src/presentation/bloc/player/player_bloc.dart';
import 'package:xmanager/src/presentation/screens/login/bloc/login_bloc.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:xmanager/src/presentation/bloc/bloc.dart';
import 'package:xmanager/src/presentation/screens/ble/ble_debug_page.dart';
import 'package:xmanager/src/presentation/screens/ble/debug_page.dart';
import 'package:xmanager/src/presentation/screens/ble/device_list_page.dart';
import 'package:xmanager/src/presentation/screens/ble/device_screen.dart';
import 'package:xmanager/src/presentation/screens/ble/device_search.dart';
import 'package:xmanager/src/presentation/screens/home/program_create.dart';
import 'package:xmanager/src/presentation/screens/home/program_detail.dart';
import 'package:xmanager/src/presentation/screens/home/program_list.dart';
import 'package:xmanager/src/presentation/screens/home/program_update.dart';
import 'package:xmanager/src/presentation/screens/home_screen.dart';
import 'package:xmanager/src/presentation/screens/login/login_screen.dart';
import 'package:xmanager/src/presentation/screens/profile_screen.dart';
import 'package:xmanager/src/presentation/screens/recovery/recovery_screen.dart';
import 'package:xmanager/src/presentation/screens/settings/account_page.dart';
import 'package:xmanager/src/presentation/screens/settings/permissions_page.dart';
import 'package:xmanager/src/presentation/screens/settings/settings_page.dart';
import 'package:xmanager/src/presentation/screens/signup/signup_screen.dart';
import 'package:xmanager/src/presentation/screens/start_screen.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Future.delayed(Durations.short1);

  FlutterNativeSplash.remove();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await di.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(create: (_) => sl()..add(StartUserEvent())),
        BlocProvider<LoginBloc>(create: (_) => sl()),
        BlocProvider<AppBloc>(create: (_) => sl()..add(AppStartEvent())),
        BlocProvider<BleBloc>(create: (_) => sl()),
        BlocProvider<PlayerBloc>(create: (_) => sl()),
      ],
      child: const MainApp(),
    ),
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  var _authenticated = false;
  bool get authenticated => _authenticated;

  GoRouterRefreshStream(Stream<UserState> stream) {
    _authenticated = false;
    notifyListeners();

    final broadcastStream = stream.asBroadcastStream();
    _subscription = broadcastStream.listen((UserState state) {
      if (state is UserAuthenticatedState) {
        _authenticated = true;
        notifyListeners();
      } else if (state is UserInitialState) {
        _authenticated = false;
        notifyListeners();
      }
    });
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    final listener = GoRouterRefreshStream(context.read<UserBloc>().stream);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: GoRouter(
        initialLocation: '/',
        refreshListenable: listener,
        redirect: (context, state) {
          final location = state.matchedLocation;
          final loginPath = location.startsWith('/login');
          final signupPath = location.startsWith('/signup');

          final userAuthenticated = listener.authenticated;
          print("userAuthenticated $userAuthenticated");

          if (userAuthenticated) {
            return '/home';
          } else if (!userAuthenticated && !loginPath && !signupPath) {
            return '/';
          }

          //final userRead = context.read<UserBloc>();
          // final userReadState = userRead.state;
          // final authenticatedRead = userReadState is UserAuthenticatedState;

          // final userWatch = context.watch<UserBloc>();
          // final userWatchState = userWatch.state;
          // final authenticatedWatch = userWatchState is UserAuthenticatedState;

          return null;
        },
        routes: [
          GoRoute(
            name: "start screen",
            path: '/',
            builder: (context, state) => const StartScreen(),
            routes: [
              GoRoute(
                name: "login screen",
                path: 'login',
                builder: (context, state) => const LoginScreen(),
                routes: [
                  GoRoute(
                    name: "recovery screen",
                    path: 'recovery',
                    builder: (context, state) => const RecoveryScreen(),
                  ),
                  GoRoute(
                    name: "complete profile screen",
                    path: 'profile',
                    builder: (context, state) => const ProfileScreen(),
                  ),
                ],
              ),
              GoRoute(
                name: "signup screen",
                path: 'signup',
                builder: (context, state) => const SignupScreen(),
                routes: [
                  GoRoute(
                    name: "create profile screen",
                    path: 'profile',
                    builder: (context, state) => const ProfileScreen(),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            name: "home screen",
            path: "/home",
            builder: (context, state) => const HomeScreen(),
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
                name: "Device screen",
                path: 'device',
                builder: (context, state) => const DeviceScreen(),
              ),
            ],
          ),
          GoRoute(
            name: "settings page",
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
                builder: (context, state) => const ProfileScreen(),
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
