import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/features/home/presentation/bloc/device/device_bloc.dart';
import 'package:xmanager/src/features/home/presentation/bloc/device/device_event.dart';
import 'package:xmanager/src/features/home/presentation/bloc/program/program_bloc.dart';
import 'package:xmanager/src/features/home/presentation/bloc/program/program_event.dart';
import 'package:xmanager/src/features/home/presentation/bloc/program/program_state.dart';

class ProgramSelectScreen extends StatelessWidget {
  const ProgramSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: BlocBuilder<ProgramBloc, ProgramState>(
        buildWhen: (context, state) =>
            state is GetProgramsLoading ||
            state is GetProgramsSuccess ||
            state is GetProgramsFailure,
        builder: (context, state) {
          if (state is GetProgramsLoading) {
            context.loaderOverlay.show();
          } else if (state is GetProgramsSuccess ||
              state is GetProgramsFailure) {
            context.loaderOverlay.hide();
          }

          return Scaffold(
            body: RefreshIndicator(
              onRefresh: () async {
                final bloc = context.read<ProgramBloc>();
                const event = GetPrograms();
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

                        final selectedHashCode =
                            context.watch<ProgramBloc>().state.program.hashCode;

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
                              context
                                  .read<ProgramBloc>()
                                  .add(SelectProgram(program));
                            },
                          ),
                          onTap: () {
                            context
                                .read<ProgramBloc>()
                                .add(SelectProgram(program));
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
                    onPressed: context.watch<ProgramBloc>().state.program ==
                            null
                        ? null
                        : () {
                            context.read<DeviceBloc>().add(const GetDevices());
                            context.pushNamed('select devices screen');
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
