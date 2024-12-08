import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:xmanager/src/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:xmanager/src/features/dashboard/presentation/bloc/dashboard_state.dart';

class ProgramsScreen extends StatelessWidget {
  const ProgramsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: BlocBuilder<DashboardBloc, DashboardState>(
        buildWhen: (context, state) {
          return state is TrainingProgramsStateLoading ||
              state is TrainingProgramsStateSuccess ||
              state is TrainingProgramsStateSuccess;
        },
        builder: (context, state) {
          if (state is TrainingProgramsStateLoading) {
            context.loaderOverlay.show();
          } else if (state is TrainingProgramsStateSuccess) {
            context.loaderOverlay.hide();
          }

          return Scaffold(
            body: RefreshIndicator(
              onRefresh: () async {
                final bloc = context.read<DashboardBloc>();
                const event = GetTrainingProgramListEvent();
                bloc.add(event);
              },
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Text(
                      'Select a program',
                      style: context.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    pinned: true,
                  ),

                  SliverToBoxAdapter(
                    child: Container(
                      height: 10,
                    ),
                  ),

                  // List
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: state.programs.length,
                      (BuildContext context, int index) {
                        final program = state.programs[index];
                        final hashCode = program.hashCode;

                        final selectedHashCode = context
                            .watch<DashboardBloc>()
                            .state
                            .selectedProgram
                            .hashCode;

                        return ListTile(
                          title: Text(
                            program.title,
                            style: context.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          trailing: Radio<int>(
                            value: hashCode,
                            groupValue: selectedHashCode,
                            onChanged: (value) {
                              final bloc = context.read<DashboardBloc>();
                              bloc.add(SelectTrainingProgramEvent(program));
                            },
                          ),
                          onTap: () {
                            final bloc = context.read<DashboardBloc>();
                            bloc.add(SelectTrainingProgramEvent(program));
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FilledButton.icon(
                    style: FilledButton.styleFrom(
                      fixedSize: const Size(150, 50),
                      backgroundColor: context.colorScheme.secondaryContainer,
                    ),
                    label: Text(
                      "NEXT",
                      style: TextStyle(
                        color: context.colorScheme.surface,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    onPressed:
                        context.watch<DashboardBloc>().state.selectedProgram ==
                                null
                            ? null
                            : () {
                                final bloc = context.read<DashboardBloc>();
                                context.pushNamed('select devices screen');
                                bloc.add(const GetDevices());
                              },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
