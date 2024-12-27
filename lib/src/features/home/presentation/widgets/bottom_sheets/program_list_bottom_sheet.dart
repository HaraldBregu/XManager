import 'package:flutter/material.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/shared/domain/entities/program_entity.dart';

Future<void> showProgramListBottomSheet({
  required BuildContext context,
  required List<ProgramEntity> programList,
  required Function(ProgramEntity program) onSelectProgram,
}) {
  return showModalBottomSheet<void>(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // Top
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  width: 30.0,
                  height: 3.0,
                  decoration: BoxDecoration(
                    color: context.colorScheme.onPrimaryContainer,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),

                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Select program",
                        style: context.textTheme.titleLarge
                            ?.copyWith(
                              fontWeight: FontWeight.w600,
                            )
                            .copyWith(
                              color: context.colorScheme.onSurface,
                            ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Choose a program you want to start',
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),

                // List
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: ListView.separated(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return const Divider(
                          height: 0,
                          color: Colors.white10,
                          indent: 0,
                          endIndent: 0,
                        );
                      },
                      itemCount: programList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final program = programList[index];

                        return InkWell(
                          onTap: () => onSelectProgram(program),
                          child: Padding(
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
                                          ?.copyWith(
                                              fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // Action button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(
                        50,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("SELECT"),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
