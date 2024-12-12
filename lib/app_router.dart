import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:xmanager/src/features/home/presentation/screens/device/device_screen.dart';
import 'package:xmanager/src/features/home/presentation/screens/device/devices_select_screen.dart';
import 'package:xmanager/src/features/home/presentation/screens/main_screen.dart';
import 'package:xmanager/src/features/home/presentation/screens/old/account_page.dart';
import 'package:xmanager/src/features/home/presentation/screens/old/ble_debug_page.dart';
import 'package:xmanager/src/features/home/presentation/screens/old/debug_page.dart';
import 'package:xmanager/src/features/home/presentation/screens/old/device_list_page.dart';
import 'package:xmanager/src/features/home/presentation/screens/old/device_search.dart';
import 'package:xmanager/src/features/home/presentation/screens/old/devices_scan_screen.dart';
import 'package:xmanager/src/features/home/presentation/screens/old/permissions_page.dart';
import 'package:xmanager/src/features/home/presentation/screens/old/profile_screen.dart';
import 'package:xmanager/src/features/home/presentation/screens/old/settings_page.dart';
import 'package:xmanager/src/features/home/presentation/screens/program/program_select_screen.dart';
import 'package:xmanager/src/features/home/presentation/screens/program/programs_screen.dart';
import 'package:xmanager/src/features/home/presentation/screens/program/training_program_edit_screen.dart';
import 'package:xmanager/src/features/home/presentation/screens/uploader/program_upload_screen.dart';
import 'package:xmanager/src/features/start/presentation/screens/login_screen.dart';
import 'package:xmanager/src/features/start/presentation/screens/recovery_screen.dart';
import 'package:xmanager/src/features/start/presentation/screens/signup_screen.dart';
import 'package:xmanager/src/features/start/presentation/screens/start_screen.dart';
import 'package:xmanager/src/shared/presentation/bloc/bloc.dart';

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
      final registerDevicePath = location.startsWith('/devices_scan_screen');

      final userbloc = context.read<UserBloc>().state;

      final userAuthenticated = userbloc is UserAuthenticatedState;

      if (userAuthenticated && (homePath || registerDevicePath)) {
        return null;
      } else if (userAuthenticated) {
        return '/home';
      } else if (!userAuthenticated && !loginPath && !signupPath) {
        return '/';
      }

      return null;
    },
    routes: [
      // START routes (unauthenticated)
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

      // HOME routes (authenticated)
      GoRoute(
        name: "home screen",
        path: "/home",
        builder: (context, state) => const MainScreen(),
        routes: [
          
          // PROFILE
          GoRoute(
            name: "update profile screen",
            path: 'profile',
            builder: (context, state) => const ProfileScreen(),
          ),

          // SELECT PROGRAM
          GoRoute(
            name: "program select screen",
            path: 'select_program',
            builder: (context, state) => const ProgramSelectScreen(),
          ),
          
          // SELECT DEVICES
          GoRoute(
            name: "select devices screen",
            path: 'select_devices',
            builder: (context, state) => const DevicesSelectScreen(),
          ),

          // PROGRAM UPLOAD 
          GoRoute(
            name: "upload program screen",
            path: 'upload_program',
            /*pageBuilder: (context, state) => const MaterialPage(
              fullscreenDialog: true,
              child: ProgramUploadScreen(),
            ),*/
            builder: (context, state) => const ProgramUploadScreen(),
          ),

          // PROGRAM LIST
          GoRoute(
            name: "program list screen",
            path: 'programs',
            builder: (context, state) => const ProgramsScreen(),
            routes: [
              GoRoute(
                name: "program edit screen",
                path: 'create',
                builder: (context, state) => const ProgramEditScreen(),
              ),
            ],
          ),

          // Device Screen
          GoRoute(
            name: "device screen",
            path: 'device',
            builder: (context, state) => const DeviceScreen(),
          ),

          // Register Device Flow
          GoRoute(
            name: "devices scan screen",
            path: '/devices_scan_screen',
            builder: (context, state) => const DevicesScanScreen(),
          ),

          // Settings screen
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
    ],
  );
}
