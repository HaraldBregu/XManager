import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xmanager/src/core/theme_extension.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Account")),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ListTile(
            trailing: const Icon(
              Icons.bluetooth,
            ),
            title: Text(
              'Bluetooth state',
              style: context.textTheme.titleMedium,
            ),
            onTap: () => {},
          ),
          ListTile(
            trailing: const Icon(
              Icons.bluetooth,
            ),
            title: Text(
              'Bluetooth state',
              style: context.textTheme.titleMedium,
            ),
            onTap: () => {},
          ),
          ListTile(
            title: Text(
              'App Permissions',
              style: context.textTheme.titleMedium,
            ),
            onTap: () => context.go('/settings/permissions'),
          ),
          ListTile(
            title: const Text('Bluetooth search'),
            trailing: const Icon(Icons.search),
            onTap: () => {},
          ),
          ListTile(
            title: Text(
              'Exit',
              style: context.textTheme.titleMedium,
            ),
            onTap: () => context.go('/start'),
          ),
        ],
      ),
    );
  }
}
