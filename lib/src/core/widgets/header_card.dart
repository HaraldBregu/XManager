import 'package:flutter/material.dart';
import 'package:xmanager/src/core/localizations_extension.dart';
import 'package:xmanager/src/core/theme_extension.dart';

class HeaderCard extends StatelessWidget {
  final String title;

  const HeaderCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          top: 15,
          bottom: 5,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "HARALD BREGU",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                //color: context.colorScheme.onBackground,
                fontSize: context.textTheme.labelSmall?.fontSize,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: context.textTheme.headlineMedium?.fontSize,
                fontWeight: FontWeight.bold,
                // height: 2,
              ),
            ),
          ],
        ),
      ),
      /*ListTile(
        title: Text(
          context.loc.dashboard,
          style: TextStyle(
            fontSize: context.textTheme.headlineMedium?.fontSize,
            fontWeight: FontWeight.bold,
            height: 2,
          ),
        ),
      ),*/
    );
  }
}
