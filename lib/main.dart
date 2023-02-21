import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:xmanager/views/device_search.dart';
import 'package:xmanager/views/player_detail.dart';
import 'package:xmanager/views/player_edit.dart';
import 'package:xmanager/views/account.dart';
import 'package:xmanager/views/permissions.dart';
import 'package:xmanager/views/program_create.dart';
import 'package:xmanager/views/responsive/responsive_layout.dart';
import 'package:xmanager/services/app_state_notifier.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'objectbox.dart';


late ObjectBox objectBox;

class RouteNames {
  static const String root = '/';
  static const String account = '/account';
  static const String playerEdit = '/player_edit';
  static const String playerDetail = '/player_detail';
  static const String deviceSearch = '/device_search';
  static const String appPermissions = '/app_permissions';
  static const String programCreate = '/program__create';
}

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.create();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AppStateNotifier()),
    ],
    child: const MainApp())
  );
}

const FlexScheme scheme = FlexScheme.shark;

final ThemeData _lightThemeData = FlexThemeData.light(
    scheme: scheme,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 9,
    appBarElevation: 2,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      inputDecoratorBorderType: FlexInputBorderType.underline,
      //appBarBackgroundSchemeColor: SchemeColor.onPrimary,
      //radioSchemeColor: SchemeColor.onSecondaryContainer,
      sliderBaseSchemeColor: SchemeColor.onSecondaryContainer,
      //cardRadius: 30
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


class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

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
          RouteNames.playerEdit: (context) => const PlayerEdit(),
          RouteNames.playerDetail: (context) => const PlayerDetail(),
          RouteNames.deviceSearch: (context) => const DeviceSearch(),
          RouteNames.appPermissions: (context) => const Permissions(),
          RouteNames.programCreate: (context) => const ProgramCreate()
        },
      );
    });
  }
}