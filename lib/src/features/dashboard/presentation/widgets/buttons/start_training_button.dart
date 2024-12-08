import 'package:flutter/material.dart';
import 'package:xmanager/src/core/theme_extension.dart';

class StartTrainingButton extends FilledButton {
  StartTrainingButton({
    required BuildContext context,
    required VoidCallback onPressed,
    required String text,
  }) : super(
          onPressed: onPressed,
          style: FilledButton.styleFrom(
            fixedSize: const Size(150, 50),
            backgroundColor: context.colorScheme.secondaryContainer,
          ),
          child: Text(
            text,
            style: TextStyle(
              color: context.colorScheme.surface,
              fontWeight: FontWeight.w900,
            ),
          ),
        );
}
