import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:xmanager/screens/device/device_search.dart';
import 'package:xmanager/screens/player/player_detail.dart';
import 'package:xmanager/screens/player/player_edit.dart';
import 'package:xmanager/screens/settings/account.dart';
import 'screens/home/home.dart';
import 'screens/auth/login.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'objectbox.dart';


late ObjectBox objectBox;

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.create();
  runApp(const MainApp());
}


class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color.fromRGBO(32, 33, 36, 1.0),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color.fromRGBO(32, 33, 36, 1.0),
        ),
      ),

      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en"),
      ],
      initialRoute: 'home',
      routes: {
        'home': (context) => const Home(),
        'login': (context) => const Login(value: ""),
        'account': (context) => const Account(),
        'player_edit': (context) => const PlayerEdit(),
        'player_detail': (context) => const PlayerDetail(),
        'device_search': (context) => const DeviceSearch(),
      },
    );
  }
}

/*
void main() => runApp(
    MaterialApp(
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
  ],
  initialRoute: 'home',
  routes: {
    'home': (context) => const Home(),
    'login': (context) => const Login(value: ""),
    'account': (context) => const Account(),
    'player_edit': (context) => const PlayerEdit(),
  },
)
);*/




/*
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
*/