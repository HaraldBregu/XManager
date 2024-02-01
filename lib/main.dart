import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:xmanager/app_router.dart';
import 'package:xmanager/app_theme.dart';
import 'package:xmanager/firebase_options.dart';
import 'package:xmanager/injection_container.dart' as di;
import 'package:xmanager/injection_container.dart';
import 'package:xmanager/src/core/common.dart';
import 'package:xmanager/src/presentation/bloc/app/app_bloc.dart';
import 'package:xmanager/src/presentation/bloc/app/app_event.dart';
import 'package:xmanager/src/presentation/bloc/bloc.dart';
import 'package:xmanager/src/presentation/bloc/player/player_bloc.dart';
import 'package:xmanager/src/presentation/screens/login/bloc/login_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await di.init();
  
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (_) => sl()),
        BlocProvider<UserBloc>(create: (_) => sl()..add(StartUserEvent())),
        BlocProvider<AppBloc>(create: (_) => sl()..add(AppStartEvent())),
        BlocProvider<BleBloc>(create: (_) => sl()),
        BlocProvider<PlayerBloc>(create: (_) => sl()),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: router,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en"),
      ],
    );
  }
}
