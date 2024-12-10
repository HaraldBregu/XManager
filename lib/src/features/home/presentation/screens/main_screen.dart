import 'package:flutter/material.dart';
import 'package:xmanager/responsive.dart';
import 'package:xmanager/src/features/home/presentation/screens/mobile_screen.dart';
import 'package:xmanager/src/features/home/presentation/screens/tablet_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileScreen(),
      tablet: TabletScreen(),
    );
  }
}
