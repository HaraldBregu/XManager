import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:xmanager/app_router.dart';
import 'package:xmanager/app_theme.dart';
import 'package:xmanager/injection_container.dart' as di;
import 'package:xmanager/injection_container.dart';
import 'package:xmanager/local_variables.dart';
import 'package:xmanager/src/core/common.dart';
import 'package:xmanager/src/features/home/presentation/bloc/device/device_bloc.dart';
import 'package:xmanager/src/features/home/presentation/bloc/device/device_event.dart';
import 'package:xmanager/src/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:xmanager/src/features/home/presentation/bloc/home/home_event.dart';
import 'package:xmanager/src/features/home/presentation/bloc/program/program_bloc.dart';
import 'package:xmanager/src/features/home/presentation/bloc/program/program_event.dart';
import 'package:xmanager/src/features/home/presentation/bloc/uploader/uploader_bloc.dart';
import 'package:xmanager/src/features/start/presentation/bloc/login_bloc.dart';
import 'package:xmanager/src/shared/presentation/bloc/app/app_bloc.dart';
import 'package:xmanager/src/shared/presentation/bloc/app/app_event.dart';
import 'package:xmanager/src/shared/presentation/bloc/bloc.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //await Future.delayed(Durations.short1);
  //FlutterNativeSplash.remove();

  await Supabase.initialize(
    url: SUPABASE_URL,
    anonKey: SUPABASE_ANON_KEY,
  );

  await di.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (_) => sl()..add(StartUserEvent()),
        ),
        BlocProvider<LoginBloc>(create: (_) => sl()),
        BlocProvider<HomeBloc>(
          create: (_) => sl()..add(StartDashboard()),
        ),
        BlocProvider<ProgramBloc>(
          create: (_) => sl()..add(const GetPrograms()),
        ),
        BlocProvider<DeviceBloc>(
          create: (_) => sl()..add(const GetDevices()),
        ),
        BlocProvider<UploaderBloc>(
          create: (_) => sl(),
        ),
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
