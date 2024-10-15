import 'package:flutter/material.dart';

import '../../core/theme_extension.dart';

class HeaderCard extends StatelessWidget {
  final String title;
  final String topTitle;

  const HeaderCard({
    super.key,
    required this.title,
    required this.topTitle,
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
              topTitle,
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
    );
  }
}
