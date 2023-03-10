import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:xmanager/common.dart';
import 'package:xmanager/presentation/pages/account.dart';
import 'package:xmanager/presentation/pages/device/device_search.dart';
import 'package:xmanager/presentation/pages/permissions.dart';
import 'package:xmanager/presentation/pages/player/player_detail.dart';
import 'package:xmanager/presentation/pages/player/player_edit.dart';
import 'package:xmanager/presentation/pages/program/program_create.dart';
import 'package:xmanager/presentation/pages/program/program_list.dart';
import 'package:xmanager/presentation/pages/responsive/responsive_layout.dart';
import 'package:xmanager/providers/app_state_notifier.dart';

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

const FlexScheme scheme = FlexScheme.bigStone;

final ThemeData _lightThemeData = FlexThemeData.light(
    scheme: scheme,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 9,
    appBarElevation: 2,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      inputDecoratorBorderType: FlexInputBorderType.underline,
      sliderBaseSchemeColor: SchemeColor.onSecondaryContainer,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: GoogleFonts.notoSans().fontFamily
);

final ThemeData _darkThemeData = FlexThemeData.dark(
    scheme: scheme,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 15,
    appBarElevation: 4.0,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      inputDecoratorBorderType: FlexInputBorderType.underline,
      radioSchemeColor: SchemeColor.onSecondaryContainer,
      sliderBaseSchemeColor: SchemeColor.onSecondaryContainer,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: GoogleFonts.notoSans().fontFamily
);

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(builder: (context, appState, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _lightThemeData,
        darkTheme: _darkThemeData,
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
        home: const ResponsiveLayout(),
        routes: {
          RouteNames.account: (context) => const Account(),
          RouteNames.playerEdit: (context) => const PlayerEdit(player: null),
          RouteNames.playerDetail: (context) => const PlayerDetail(player: null),
          RouteNames.appPermissions: (context) => const Permissions(),
          RouteNames.programCreate: (context) => const ProgramCreate(program: null),
          RouteNames.programList: (context) => const ProgramList(),
          RouteNames.deviceSearch: (context) => const DeviceSearch(),
        },
      );
    });
  }
}