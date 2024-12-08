import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/features/training/presentation/bloc/training_program_bloc.dart';
import 'package:xmanager/src/features/training/presentation/bloc/training_program_event.dart';
import 'package:xmanager/src/features/training/presentation/bloc/training_program_state.dart';

class TrainingProgramListScreen extends StatelessWidget {

  const TrainingProgramListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {},
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(
                'Programs',
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              pinned: true,
              actions: [
                PopupMenuButton(
                  itemBuilder: (context) {
                    return const [
                      PopupMenuItem<int>(
                        value: 0,
                        child: Text("Elimina dispositivo"),
                      ),
                      PopupMenuItem<int>(
                        value: 1,
                        child: Text("Disconnetti"),
                      ),
                      PopupMenuItem<int>(
                        value: 2,
                        child: Text("Demo animation"),
                      ),
                    ];
                  },
                  onSelected: (value) {
                    if (value == 0) {
                    } else if (value == 1) {
                    } else if (value == 2) {}
                  },
                ),
              ],
            ),

            SliverToBoxAdapter(
              child: ListTile(
                title: Text(
                  "Select a program you want to upload and go to next page to select devices.",
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),

            // List
            /*
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: state.programs.length,
                (BuildContext context, int index) {
                  final program = state.programs[index];
                  final hashCode = program.hashCode;

                  final selectedHashCode = context
                      .watch<TrainingProgramBloc>()
                      .state
                      .selectedProgram
                      .hashCode;

                  return InkWell(
                    onTap: () => {},
                    child: ListTile(
                      title: Text(
                        program.title,
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      leading: Radio<int>(
                        value: hashCode,
                        groupValue: selectedHashCode,
                        onChanged: (value) {},
                      ),
                      /*trailing: const Icon(
                              Icons.chevron_right,
                              size: 30,
                            ),*/
                      onTap: () {
                        final bloc = context.read<TrainingProgramBloc>();
                        bloc.add(SelectTrainingProgramEvent(program));
                      },
                    ),
                    /*
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  program.title,
                                  style: context.textTheme.bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w400),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.timelapse,
                                      size: 18,
                                      color: context.colorScheme.onSurface,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      "34:00",
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          */
                  );
                },
              ),
            ),
            */
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
              ),
              label: Text(
                "CREATE NEW PROGRAM",
                style: TextStyle(
                  color: context.colorScheme.surface,
                  fontWeight: FontWeight.w900,
                ),
              ),
              onPressed:
                  context.watch<TrainingProgramBloc>().state.selectedProgram ==
                          null
                      ? null
                      : () {
                          context.pushNamed('program edit screen');
                        },
            ),
          ],
        ),
      ),
    );
       
  }
}
