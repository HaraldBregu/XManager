import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'route_name.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey(debugLabel: "root");
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey(debugLabel: "shell");

class GoRouterProvider {

  GoRouter goRouter(){
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation:  '/',
      routes: [
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return HomePage(key: state.pageKey, child: child,);
          },
          routes: [
            GoRoute(
              path: "/",
              name: homeRoute,
              pageBuilder: (context, state) {
                return NoTransitionPage(child: child)
              }
            )
          ]
        )
      ]
    );
  }
}