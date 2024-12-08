import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:xmanager/src/features/dashboard/presentation/bloc/dashboard_state.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      buildWhen: (context, state) {
        return state is DevicesLoading ||
            state is DevicesError ||
            state is DevicesSuccess;
      },
      builder: (context, state) {
        if (state is DevicesLoading) {
          context.loaderOverlay.show();
        } else if (state is DevicesSuccess || state is DevicesError) {
          context.loaderOverlay.hide();
        }

        return Scaffold(
          body: RefreshIndicator(
            onRefresh: () async {
              // final bloc = context.read<DashboardBloc>();
              // const event = GetTrainingProgramListEvent();
              // bloc.add(event);
            },
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text(
                    'Select devices',
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
                    childCount: state.devices.length,
                    (BuildContext context, int index) {
                      final device = state.devices[index];
                      final hashCode = device.hashCode;

                      final selectedHashCode = context
                          .watch<DashboardBloc>()
                          .state
                          .selectedProgram
                          .hashCode;

                      return ListTile(
                        title: Text(
                          device.macAddress,
                          style: context.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        leading: Radio<int>(
                          value: hashCode,
                          groupValue: selectedHashCode,
                          onChanged: (value) {
                            // final bloc = context.read<DashboardBloc>();
                            // bloc.add(SelectTrainingProgramEvent(program));
                          },
                        ),
                        onTap: () {
                          // final bloc = context.read<DashboardBloc>();
                          // bloc.add(SelectTrainingProgramEvent(program));
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
                              // final bloc = context.read<DashboardBloc>();
                              // context.pushNamed('program select device screen');
                              // bloc.add(const GetDevicesHomeEvent());
                              //context.pushNamed('program edit screen');
                            },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
