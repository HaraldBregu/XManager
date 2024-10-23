import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:xmanager/app_router.dart';
import 'package:xmanager/app_theme.dart';
import 'package:xmanager/firebase_options.dart';
import 'package:xmanager/injection_container.dart' as di;
import 'package:xmanager/injection_container.dart';
import 'package:xmanager/src/core/common.dart';
import 'package:xmanager/src/features/auth/presentation/bloc/login_bloc.dart';
import 'package:xmanager/src/features/device/presentation/bloc/device_bloc.dart';
import 'package:xmanager/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:xmanager/src/features/home/presentation/bloc/home_event.dart';
import 'package:xmanager/src/shared/presentation/bloc/app/app_bloc.dart';
import 'package:xmanager/src/shared/presentation/bloc/app/app_event.dart';
import 'package:xmanager/src/shared/presentation/bloc/bloc.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Future.delayed(Durations.short1);

  FlutterNativeSplash.remove();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await di.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (_) => sl()..add(InitialHomeEvent())),
        BlocProvider<UserBloc>(create: (_) => sl()..add(StartUserEvent())),
        BlocProvider<LoginBloc>(create: (_) => sl()),
        BlocProvider<DeviceBloc>(create: (_) => sl()),
        BlocProvider<AppBloc>(create: (_) => sl()..add(AppStartEvent())),
        BlocProvider<BleBloc>(create: (_) => sl()..add(const BleStartEvent())),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: router(context),
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
