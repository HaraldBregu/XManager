import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:xmanager/src/app.dart';
import 'package:xmanager/objectbox.dart';
import 'package:xmanager/core/app_state_notifier.dart';
import 'package:xmanager/core/service_locator.dart';

late ObjectBox objectBox;

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpServiceLocator();

  objectBox = await ObjectBox.create();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AppStateNotifier()),
    ],
    child: const App()),
  );
}
