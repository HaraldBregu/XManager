import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:xmanager/screens/player/player_edit.dart';
import 'package:xmanager/screens/settings/account.dart';
import 'screens/home/home.dart';
import 'screens/auth/login.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    brightness: Brightness.light
  ),
  darkTheme: ThemeData(
      brightness: Brightness.dark
  ),
  localizationsDelegates: const [
    AppLocalizations.delegate, // Add this line
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: const [
    Locale("en"),
    Locale("it"),
  ],
  initialRoute: 'home',
  routes: {
    'home': (context) => const Home(),
    'login': (context) => const Login(value: ""),
    'account': (context) => const Account(),
    'player_edit': (context) => const PlayerEdit(),
  },
));