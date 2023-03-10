import 'package:flutter/material.dart';


class XMaterialCard extends StatelessWidget {
  final Widget child;
  const XMaterialCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Material(
      type: MaterialType.canvas,
      elevation: 2,
      surfaceTintColor: colorScheme.background,
      child: child,
    );
  }
}