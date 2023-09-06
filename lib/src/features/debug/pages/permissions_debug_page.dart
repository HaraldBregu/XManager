import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/presentation/bloc/app/bloc.dart';

class PermissionsDebugPage extends StatelessWidget {
  const PermissionsDebugPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (bloc, state) {
        return const Placeholder();
      },
    );
  }
}
