import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/presentation/bloc/app_bloc.dart';
import 'package:xmanager/src/presentation/bloc/bloc.dart';
import 'package:xmanager/src/presentation/screens/ble/service_list.dart';
import 'package:xmanager/src/presentation/widgets/device_list.dart';

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
      actions: [],
    );
  }
}

class _BleDebugContent extends StatelessWidget {
  const _BleDebugContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // if (context.watch<BleBloc>().state.isScanning) ...[
            //   const Text("Scanning ble devices..."),
            // ],
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Location permission"),
                if (context.watch<AppBloc>().state.locationGranted)
                  const Text("GRANTED")
                else
                  const Text("NOT GRANTED"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Bluetooth permission"),
                if (context.watch<AppBloc>().state.bluetoothGranted)
                  const Text("GRANTED")
                else
                  const Text("NOT GRANTED"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Bluetooth connect permission"),
                if (context.watch<AppBloc>().state.bluetoothConnectGranted)
                  const Text("GRANTED")
                else
                  const Text("NOT GRANTED"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Bluetooth scan permission"),
                if (context.watch<AppBloc>().state.bluetoothScanGranted)
                  const Text("GRANTED")
                else
                  const Text("NOT GRANTED"),
              ],
            ),
            Row(
              children: [
                OutlinedButton(
                  child: const Text("Scan"),
                  onPressed: () => BlocProvider.of<BleBloc>(context)
                      .add(const StartScanning(seconds: 5)),
                ),
                const SizedBox(
                  width: 5,
                ),
                OutlinedButton(
                  child: const Text("Stop"),
                  onPressed: () =>
                      BlocProvider.of<BleBloc>(context).add(StopScanning()),
                ),
                const SizedBox(
                  width: 5,
                ),
                OutlinedButton(
                  child: const Text("BLE list"),
                  onPressed: () => showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) => const DeviceList(),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Selected device",
                    ),
                    /* Text(
                      "BLE: ${context.watch<BleBloc>().state.selectedDevice?.name}",
                    ),
                    Text(
                      "UUID: ${context.watch<BleBloc>().state.selectedDevice?.uuid}",
                    ),
                    if (context.watch<BleBloc>().state.connectionState ==
                        BleConnectionState.connecting) ...[
                      const Text("CONNECTING..."),
                    ],
                    if (context.watch<BleBloc>().state.connectionState ==
                        BleConnectionState.connected) ...[
                      const Text("CONNECTED"),
                    ] else if (context.watch<BleBloc>().state.connectionState ==
                        BleConnectionState.disconnected) ...[
                      const Text("DISCONNECTED"),
                    ],*/
                  ],
                ),
                Column(
                  children: [
                    OutlinedButton(
                      child: const Text("Connect"),
                      onPressed: () =>
                          context.read<BleBloc>().add(ConnectDevice("")),
                    ),
                    OutlinedButton(
                      child: const Text("Disconnect"),
                      onPressed: () =>
                          context.read<BleBloc>().add(DisconnectDevice("")),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                OutlinedButton(
                  child: const Text("Discover services"),
                  onPressed: () =>
                      context.read<BleBloc>().add(DiscoverServices("")),
                ),
                const SizedBox(
                  width: 5,
                ),
                OutlinedButton(
                  child: const Text("Show services"),
                  onPressed: () => showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) => const ServiceList(),
                  ),
                ),
              ],
            ),
            // if (context.watch<BleBloc>().state.discoveringServices) ...[
            //   const Text("DISCOVERING SERVICES..."),
            // ],
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Selected service",
                    ),
                    // Text(
                    //   "${context.watch<BleBloc>().state.selectedService?.serviceUuid}",
                    // ),
                    // Text(
                    //   "remoteId: ${context.watch<BleBloc>().state.selectedService?.remoteId}",
                    // ),
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Send and get data"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: const Text("Feature one"),
                  subtitle: const Text("select this feature blblblblb one"),
                  trailing: OutlinedButton(
                    child: const Text("Test 2"),
                    onPressed: () {},
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("Feature two"),
                  subtitle: const Text("select this feature blblblblb one"),
                  trailing: OutlinedButton(
                    child: const Text("show data"),
                    onPressed: () {},
                  ),
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
