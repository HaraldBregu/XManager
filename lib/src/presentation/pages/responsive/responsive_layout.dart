import 'package:flutter/material.dart';
import 'package:xmanager/src/presentation/pages/responsive/mobile_layout.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          //if (constraints.maxWidth < 500) { return const MobileLayout(); }
          return const MobileLayout();
        });
  }
}