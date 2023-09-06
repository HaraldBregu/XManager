import 'package:flutter/material.dart';

class BleDebugPage extends StatelessWidget {
  const BleDebugPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          _BleDebugHeader(),
          _BleDebugContent(),
        ],
      ),
    );
  }
}

class _BleDebugHeader extends StatelessWidget {
  const _BleDebugHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      title: Text("Ble debug"),
    );
  }
}

class _BleDebugContent extends StatelessWidget {
  const _BleDebugContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: const Text("Search for ble devices"),
            trailing: const Icon(Icons.bluetooth),
            onTap: () => showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 400,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text('Modal BottomSheet'),
                        ElevatedButton(
                          child: Text('Close BottomSheet'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const ListTile(
            title: Text("Current selected device"),
            subtitle: Text("E4IURNV34CEIFNC4"),
          ),
          const ListTile(
            title: Text("State"),
            subtitle: Text("DISCONNECTED"),
          ),
          ListTile(
            leading: OutlinedButton(
              onPressed: () {},
              child: const Text("Connect"),
            ),
            trailing: OutlinedButton(
              onPressed: () {},
              child: const Text("Disconnect"),
            ),
          ),
        ],
      ),
    );
  }
}
