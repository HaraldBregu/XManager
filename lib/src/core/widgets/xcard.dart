import 'package:flutter/material.dart';

class XCard extends StatelessWidget {
  final Widget child;
  const XCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Card(
      //margin: EdgeInsets.zero,
      //type: MaterialType.canvas,
      elevation: 8,
      //surfaceTintColor: colorScheme.background,
      //surfaceTintColor: colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: child,
      ),
    );
  }
}
