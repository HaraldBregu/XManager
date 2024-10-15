import 'package:flutter/material.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/features/home/presentation/widgets/program_list.dart';
import 'package:xmanager/src/shared/domain/entities/program_entity.dart';

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
      return DraggableScrollableSheet(
        expand: false,
        snap: true,
        builder: (_, controller) {
          return SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  width: 30.0,
                  height: 3.0,
                  decoration: BoxDecoration(
                    color: context.colorScheme.onPrimaryContainer,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
                ProgramList(
                  programList: programList,
                  onSelectProgram: (program) {
                    onSelectProgram.call(program);
                  },
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
