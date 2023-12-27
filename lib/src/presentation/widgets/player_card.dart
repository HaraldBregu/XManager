import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xmanager/src/core/theme_extension.dart';

class PlayerCard extends StatelessWidget {
  final void Function() onTap;

  const PlayerCard({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 5),
      child: Card(
        elevation: 1,
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Container(
              height: 50.0,
              width: 50.0,
              color: context.colorScheme.primaryContainer,
              child: const Icon(
                Icons.person,
                size: 25.0,
              ),
            ),
          ),
          title: Text(
            "Juan Martin",
            style: TextStyle(
              fontSize: context.textTheme.labelLarge?.fontSize,
              fontFamily: context.textTheme.labelLarge?.fontFamily,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            "28 anni",
            style: TextStyle(
              fontSize: context.textTheme.labelLarge?.fontSize,
              fontFamily: context.textTheme.labelLarge?.fontFamily,
              fontWeight: FontWeight.normal,
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
