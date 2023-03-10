import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xmanager/app.dart';
import 'package:xmanager/object_box.dart';
import 'package:xmanager/providers/app_state_notifier.dart';

late ObjectBox objectBox;

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.create();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AppStateNotifier()),
    ],
    child: const App())
  );
}
