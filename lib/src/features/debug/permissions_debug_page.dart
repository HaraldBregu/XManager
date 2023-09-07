import 'package:flutter/material.dart';

class PermissionsDebugPage extends StatelessWidget {
  const PermissionsDebugPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              "Permissions",
            ),
            pinned: true,
          ),

          //SliverList(delegate: delegate)
        ],
      ),
    );
  }
}
