import 'package:flutter/material.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/shared/domain/entities/program_entity.dart';

typedef SelectProgram = void Function(ProgramEntity program);

class ProgramList extends StatelessWidget {
  final List<ProgramEntity> programList;
  final SelectProgram onSelectProgram;

  const ProgramList({
    super.key,
    required this.programList,
    required this.onSelectProgram,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: ListTile(
            title: Text(
              'Training programs',
              style: TextStyle(
                fontSize: context.textTheme.titleLarge?.fontSize,
                fontFamily: context.textTheme.titleLarge?.fontFamily,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              'Select a program and upload it to device',
              style: TextStyle(
                fontSize: context.textTheme.bodySmall?.fontSize,
                fontFamily: context.textTheme.bodySmall?.fontFamily,
              ),
            ),
          ),
        ),
        ListView.separated(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return const Divider(
              height: 0,
              color: Colors.white10,
              indent: 15,
              endIndent: 15,
            );
          },
          itemCount: programList.length,
          itemBuilder: (BuildContext context, int index) {
            final program = programList[index];

            return ListTile(
              title: Text(
                program.title,
                style: TextStyle(
                  fontSize: context.textTheme.titleMedium?.fontSize,
                  fontFamily: context.textTheme.titleMedium?.fontFamily,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Text(
                "DURATION: 23:04",
                style: TextStyle(
                  fontSize: context.textTheme.bodySmall?.fontSize,
                  fontFamily: context.textTheme.bodySmall?.fontFamily,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onTap: () {
                onSelectProgram.call(program);
              },
            );
          },
        ),
      ],
    );
  }
}
