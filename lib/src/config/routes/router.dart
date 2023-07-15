import 'package:go_router/go_router.dart';
import 'package:path/path.dart';
import 'package:xmanager/src/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:xmanager/src/features/settings/presentation/pages/permissions_page.dart';
import 'package:xmanager/src/features/settings/presentation/pages/settings_page.dart';

class RouteNames {
  static const String root = '/';
  static const String account = '/account';
  static const String playerEdit = '/player_edit';
  static const String playerDetail = '/player_detail';
  static const String appPermissions = '/app_permissions';
  static const String programCreate = '/program_create';
  static const String programList = '/program_list';
  static const String deviceSearch = '/device_search';
}

final GoRouter router = GoRouter(
  //initialLocation: '/auth',
  routes: [
    GoRoute(path: '/auth', builder: (context, state) => const SettingsPage()),
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

/*
final GoRouter router = GoRouter(routes: [
  GoRoute(
      path: "/",
      builder: (context, state) {
        return BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (oldState, newState) {
            return oldState is AuthInitialState;
           },
          builder: (context, state) {
             if (state is AuthLoading) {
              // return const SplashScreen();           // alternative way
               context.goNamed(SplashScreen.routeName); 👈 Display your splash screen here and you can provide delay while changing state in your bloc
            }
            else if (state is AuthenticationUnauthenticated) {
               context.goNamed(LoginPage.routeName);  
            } else if (state is Authenticated) {
                context.goNamed(HomePage.routeName);           
             } else {
              return const Scaffold();
            }
          },
        );
      }),
]);
*/