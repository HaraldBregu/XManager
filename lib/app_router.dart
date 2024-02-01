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
import 'package:xmanager/src/presentation/screens/recovery_screen.dart';
import 'package:xmanager/src/presentation/screens/settings/account_page.dart';
import 'package:xmanager/src/presentation/screens/settings/permissions_page.dart';
import 'package:xmanager/src/presentation/screens/settings/settings_page.dart';
import 'package:xmanager/src/presentation/screens/signup_screen.dart';
import 'package:xmanager/src/presentation/screens/start_screen.dart';

class GoRouterObserver extends NavigatorObserver {
  final BuildContext context;

  GoRouterObserver(this.context);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('MyTest didPush: $route');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('MyTest didPop: $route');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('MyTest didRemove: $route');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    print('MyTest didReplace: $newRoute');
  }
}

/// makes GoRouter redirect when stream recevies an event
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }
  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

GoRouter router(BuildContext context) {
  final userStateWatch = context.read<UserBloc>().state;
  final authenticated = userStateWatch is UserAuthenticatedState;

  return GoRouter(
    refreshListenable: GoRouterRefreshStream(context.watch<UserBloc>().stream),
    debugLogDiagnostics: true,
    observers: [GoRouterObserver(context)],
    initialLocation: authenticated ? '/home' : '/',
    redirect: (context, state) {
      final location = state.matchedLocation;

      //print("location: $location");

      if (authenticated && location == '/login') {
        return '/home';
      } else if (!authenticated && location != '/login') {
        // return '/';
      }
      return null;
    },
    /*redirect: (context, state) {
      final location = state.matchedLocation;
      final startPath = location == '/';
      final loginPath = location.startsWith('/login');
      final signupPath = location.startsWith('/signup');

      print("authentication: $authenticated");
      print("location: $location");

//final res = context.select<UserBloc, UserState>((value) => value.state);

      if (authenticated && (loginPath || signupPath)) {
        print("location: in login path");
        return null;
      } else if (!authenticated && (loginPath || signupPath)) {
        print("location: in login path unath");
        return null;
      } else if (authenticated) {
        print("location: only authenticated");
        return '/home';
      }

      return null;
    },*/
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
