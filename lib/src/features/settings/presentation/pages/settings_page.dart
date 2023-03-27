import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: const Text("Account")),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: [],
        ));
  }
}
