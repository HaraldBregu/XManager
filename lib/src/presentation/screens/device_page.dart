import 'package:flutter/material.dart';
import 'package:xmanager/src/core/theme_extension.dart';

class DevicePage extends StatelessWidget {
  const DevicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text(
              "Device",
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
            pinned: true,
            centerTitle: false,
          ),
        ],
      ),
    );
  }
}
