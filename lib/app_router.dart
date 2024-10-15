// ignore_for_file: always_use_package_imports
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'src/features/account/presentation/screens/account_page.dart';
import 'src/features/account/presentation/screens/permissions_page.dart';
import 'src/features/account/presentation/screens/profile_screen.dart';
import 'src/features/account/presentation/screens/settings_page.dart';
import 'src/features/auth/presentation/screens/login_screen.dart';
import 'src/features/auth/presentation/screens/recovery_screen.dart';
import 'src/features/auth/presentation/screens/signup_screen.dart';
import 'src/features/auth/presentation/screens/start_screen.dart';
import 'src/features/device/presentation/screens/ble_debug_page.dart';
import 'src/features/device/presentation/screens/debug_page.dart';
import 'src/features/device/presentation/screens/device_list_page.dart';
import 'src/features/device/presentation/screens/device_screen.dart';
import 'src/features/device/presentation/screens/device_search.dart';
import 'src/features/home/presentation/screens/home_screen.dart';
import 'src/features/training/presentation/screens/training_program_edit_screen.dart';
import 'src/features/training/presentation/screens/training_program_list_screen.dart';
import 'src/shared/presentation/bloc/bloc.dart';

class GoRouterObserver extends NavigatorObserver {
  final BuildContext context;

  GoRouterObserver(this.context);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    //print('MyTest didPush: $route');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    //print('MyTest didPop: $route');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    //print('MyTest didRemove: $route');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    //print('MyTest didReplace: $newRoute');
  }
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<UserState> stream) {
    notifyListeners();

    final broadcastStream = stream.asBroadcastStream();
    _subscription = broadcastStream.listen((UserState state) {
      if (state is UserAuthenticatedState) {
        notifyListeners();
      } else if (state is UserInitialState) {
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

GoRouter router(BuildContext context) {
  return GoRouter(
    initialLocation: '/',
    refreshListenable: GoRouterRefreshStream(context.read<UserBloc>().stream),
    redirect: (context, state) {
      final location = state.matchedLocation;
      final loginPath = location.startsWith('/login');
      final signupPath = location.startsWith('/signup');
      final homePath = location.startsWith('/home');

      final userbloc = context.read<UserBloc>().state;

      final userAuthenticated = userbloc is UserAuthenticatedState;

      if (userAuthenticated && homePath) {
        return null;
      } else if (userAuthenticated) {
        return '/home';
      } else if (!userAuthenticated && !loginPath && !signupPath) {
        return '/';
      }

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
            ],
          ),
          GoRoute(
            name: "signup screen",
            path: 'signup',
            builder: (context, state) => const SignupScreen(),
          ),
        ],
      ),
      GoRoute(
        name: "home screen",
        path: "/home",
        //builder: (context, state) => const ProgramEditScreen(),
        builder: (context, state) => const HomeScreen(),
        
        routes: [
          GoRoute(
            name: "update profile screen",
            path: 'profile',
            builder: (context, state) => const ProfileScreen(),
          ),
          GoRoute(
            name: "program list screen",
            path: 'programs',
            builder: (context, state) => const TrainingProgramListScreen(),
            routes: [
              GoRoute(
                name: "program edit screen",
                path: 'create',
                builder: (context, state) => const ProgramEditScreen(),
              ),
            ],
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
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
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
  );
}
