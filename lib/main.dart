import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:xmanager/src/app.dart';
import 'package:xmanager/src/core/app_state_notifier.dart';
import 'package:xmanager/src/core/databases/objectbox_db.dart';
import 'package:xmanager/src/features/dashboard/data/datasources/local/dashboard_datasource.dart';
import 'package:xmanager/src/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:xmanager/src/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:xmanager/src/features/dashboard/presentation/bloc/bloc.dart';

late ObjectBox objectBox;

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.create();

  runApp(
    const App(),
    /*
    RepositoryProvider(
      create: (context) => DashboardRepositoryImpl(
          localDataSource: DashboardLocalDataSourceImpl()),

      child: BlocProvider(
        create: (context) => DashboardBloc(),
        child: const App(),
      ),
    )*/
  );


    /*
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppStateNotifier(),
        ),
      ],
      child: const App(),
      */

}
