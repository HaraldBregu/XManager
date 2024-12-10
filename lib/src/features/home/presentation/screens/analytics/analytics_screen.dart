import 'package:flutter/material.dart';
import 'package:xmanager/src/core/theme_extension.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AnalyticsWidget(),
    );
  }
}

class AnalyticsWidget extends StatelessWidget {
  const AnalyticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(
            'Analytics',
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 10,
          ),
        ),
      ],
    );
  }
}
