import 'package:flutter/material.dart';
import 'package:xmanager/pages/responsive/mobile_layout.dart';


class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 500) {
            return const MobileLayout();
          }
          return const MobileLayout();
        });
  }
}