import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/presentation/bloc/app/bloc.dart';
import 'package:xmanager/src/core/presentation/bloc/ble/bloc.dart';

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
            title: const Text("Location permission"),
            subtitle: context.watch<AppBloc>().state.locationGranted
                ? const Text("GRANTED")
                : const Text("NOT GRANTED"),
            onTap: () {
              context.read<AppBloc>().add(RequestLocationPermission());
            },
          ),
          ListTile(
            title: const Text("Bluetooth permission"),
            subtitle: context.watch<AppBloc>().state.bluetoothGranted
                ? const Text("GRANTED")
                : const Text("NOT GRANTED"),
            onTap: () {
              context.read<AppBloc>().add(RequestBluetoothPermission());
            },
          ),
          ListTile(
            title: const Text("Bluetooth connect permission"),
            subtitle: context.watch<AppBloc>().state.bluetoothConnectGranted
                ? const Text("GRANTED")
                : const Text("NOT GRANTED"),
            onTap: () {
              context.read<AppBloc>().add(RequestBluetoothConnectPermission());
            },
          ),
          ListTile(
            title: const Text("Bluetooth scan permission"),
            subtitle: context.watch<AppBloc>().state.bluetoothScanGranted
                ? const Text("GRANTED")
                : const Text("NOT GRANTED"),
            onTap: () {
              context.read<AppBloc>().add(RequestBluetoothScanPermission());
            },
          ),
          ListTile(
              title: const Text("Search for ble devices"),
              trailing: const Icon(Icons.bluetooth),
              onTap: () {
                BlocProvider.of<BleBloc>(context)
                    .add(const StartScanning(seconds: 10));

                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      child: Center(
                        child: BlocBuilder<BleBloc, BleState>(
                          builder: (context, state) {
                            return const Text("data");
                          },
                        ),
                      ),
                    );

/*
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
                 
                  */
                  },
                );

                // showModalBottomSheet<void>(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return SizedBox(
                //       height: 400,
                //       child: Center(
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           mainAxisSize: MainAxisSize.min,
                //           children: <Widget>[
                //             const Text('Modal BottomSheet'),
                //             ElevatedButton(
                //               child: Text('Close BottomSheet'),
                //               onPressed: () => Navigator.pop(context),
                //             ),
                //           ],
                //         ),
                //       ),
                //     );
                //   },
                // );
              }),
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
