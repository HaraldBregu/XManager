import 'package:flutter/material.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/shared/domain/entities/program_entity.dart';

typedef SelectProgram = void Function(ProgramEntity program);

Future<void> showProgramListBottomSheet({
  required BuildContext context,
  required List<ProgramEntity> programList,
  required SelectProgram onSelectProgram,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) {
      return SingleChildScrollView(
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
      
            // Content
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select program',
                        style: context.textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Choose a program you want to start',
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ),

                  // Space
                  const SizedBox(height: 20),

                  // List
                  ListView.separated(
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
                                        ?.copyWith(fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Space
            const SizedBox(height: 40),
          ],
        ),
      );
    },
  );
}
