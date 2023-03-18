import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xmanager/objectbox.dart';
import 'package:xmanager/src/app.dart';
import 'package:xmanager/src/core/app_state_notifier.dart';

late ObjectBox objectBox;

Future <void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  //await di.init();

  //objectBox = await ObjectBox.create();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppStateNotifier(),
        ),
      ],
      child: const App(),
    ),
  );
}
