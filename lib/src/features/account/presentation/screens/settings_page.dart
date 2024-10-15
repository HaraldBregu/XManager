import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme_extension.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          _SettingsHeader(),
          _SettingsContent(),
        ],
      ),
    );
  }
}

class _SettingsHeader extends StatelessWidget {
  const _SettingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      title: Text("Settings"),
    );
  }
}

class _SettingsContent extends StatelessWidget {
  const _SettingsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: [
        ListTile(
          leading: const Icon(
            Icons.settings,
            size: 25.0,
          ),
          title: Text(
            'Account settings',
            style: context.textTheme.titleMedium,
          ),
          onTap: () => context.pushNamed('Account page'),
        ),
        ListTile(
          leading: const Icon(
            Icons.person,
            size: 25.0,
          ),
          title: Text(
            'Profile settings',
            style: context.textTheme.titleMedium,
          ),
          onTap: () => context.pushNamed('Profile page'),
        ),
        ListTile(
          leading: const Icon(
            Icons.bluetooth,
            size: 25.0,
          ),
          title: Text(
            'Bluetooth settings',
            style: context.textTheme.titleMedium,
          ),
          onTap: () => {},
        ),
      
        ListTile(
          leading: const Icon(
            Icons.perm_camera_mic,
            size: 25.0,
          ),
          title: Text(
            'App Permissions',
            style: context.textTheme.titleMedium,
          ),
          onTap: () => context.pushNamed('Permissions page'),
        ),
        ListTile(
          leading: const Icon(
            Icons.search,
            size: 25.0,
          ),
          title: const Text('Bluetooth search'),
          onTap: () => {},
        ),
        ListTile(
          leading: const Icon(
            Icons.logout,
            size: 20.0,
          ),
          title: Text(
            'Exit',
            style: context.textTheme.titleMedium,
          ),
          onTap: () => context.go('/start'),
        ),
      ],
    );
  }
}
