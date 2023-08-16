import 'package:flutter/material.dart';
import 'package:xmanager/src/core/localizations_extension.dart';
import 'package:xmanager/src/core/theme_extension.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListTile(
        title: Text(
          context.loc.dashboard,
          style: TextStyle(
            fontSize: context.textTheme.headlineMedium?.fontSize,
            fontWeight: FontWeight.bold,
            height: 2,
          ),
        ),
      ),
    );
  }
}
