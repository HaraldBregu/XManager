import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/features/dashboard/data/datasources/dashboard_local_data_source.dart';
import 'package:xmanager/src/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:xmanager/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:xmanager/src/features/dashboard/presentation/bloc/dashboard_state.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: RepositoryProvider(
        create: (context) => DashboardRepositoryImpl(
            localDataSource: DashboardLocalDataSourceImpl()),
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {

            /*
            if (state is PlayerStateEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is PlayerStateLoaded) {
              final name = state.playerEntity.fullname;
              return Center(child: Text(name));
            }*/
            return const Placeholder();
          },
        )
      ),
    );
  }
}
