import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:xmanager/src/core/app_state_notifier.dart';
import 'package:xmanager/src/core/common.dart';
import 'package:xmanager/src/core/theme/app_theme.dart';
import 'package:xmanager/src/features/dashboard/presentation/pages/account.dart';
import 'package:xmanager/src/features/dashboard/presentation/pages/device/device_search.dart';
import 'package:xmanager/src/features/dashboard/presentation/pages/home_view.dart';
import 'package:xmanager/src/features/dashboard/presentation/pages/permissions.dart';
import 'package:xmanager/src/features/dashboard/presentation/pages/player/player_detail.dart';
import 'package:xmanager/src/features/dashboard/presentation/pages/player/player_edit.dart';
import 'package:xmanager/src/features/dashboard/presentation/pages/program/program_create.dart';
import 'package:xmanager/src/features/dashboard/presentation/pages/program/program_list.dart';

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

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(builder: (context, appState, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: appState.themeMode,
        localizationsDelegates: const [
          AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("en"),
        ],
        home: const HomeView(),
        routes: {
          RouteNames.account: (context) => const Account(),
          RouteNames.playerEdit: (context) =>
          const PlayerEdit(
            player: null,),
          RouteNames.playerDetail: (context) =>
          const PlayerDetail(
            player: null,),
          RouteNames.appPermissions: (context) => const Permissions(),
          RouteNames.programCreate: (context) =>
          const ProgramCreate(
            program: null,),
          RouteNames.programList: (context) => const ProgramList(),
          RouteNames.deviceSearch: (context) => const DeviceSearch(),
        },
      );
    },);
  }
}
