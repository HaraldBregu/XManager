import 'package:flutter/material.dart';


class XMaterialCard extends StatelessWidget {
  final Widget child;
  const XMaterialCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    // return Material(
    //   //type: MaterialType.canvas,
    //   elevation: 2,
    //   //surfaceTintColor: colorScheme.background,
    //   surfaceTintColor: colorScheme.background,
    //   child: child,
    // );

    return Card(
      //type: MaterialType.canvas,
      elevation: 4,
      //surfaceTintColor: colorScheme.background,
      //surfaceTintColor: colorScheme.background,
      child: child,
    );
  }
}