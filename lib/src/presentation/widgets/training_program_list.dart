import 'package:flutter/material.dart';
import 'package:xmanager/src/core/theme_extension.dart';

class TrainingProgramList extends StatelessWidget {
  final void Function() onSelectTrainingProgram;

  const TrainingProgramList({
    super.key,
    required this.onSelectTrainingProgram,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const ScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return const Divider(
          height: 0,
          color: Colors.white10,
          indent: 20,
          endIndent: 20,
        );
      },
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          title: Text(
            "Base training program",
            style: TextStyle(
              fontSize: context.textTheme.titleMedium?.fontSize,
              fontFamily: context.textTheme.titleMedium?.fontFamily,
              fontWeight: FontWeight.w600,
              color: context.colorScheme.onBackground,
            ),
          ),
          subtitle: Text(
            "DURATION: 23:04",
            style: TextStyle(
              fontSize: context.textTheme.bodySmall?.fontSize,
              fontFamily: context.textTheme.bodySmall?.fontFamily,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: const Icon(
            Icons.chevron_right,
            size: 34,
          ),
          onTap: onSelectTrainingProgram,
        );
      },
    );
  }
}
