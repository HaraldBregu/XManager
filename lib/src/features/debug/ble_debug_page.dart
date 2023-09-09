import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/presentation/bloc/app/bloc.dart';
import 'package:xmanager/src/core/presentation/bloc/ble/bloc.dart';
import 'package:xmanager/src/features/device/widgets/device_list.dart';

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
            if (context.watch<BleBloc>().state.isScanning) ...[
              const Text("Scanning ble devices..."),
            ],
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
                      .add(const StartScanning(seconds: 10)),
                ),
                const SizedBox(
                  width: 5,
                ),
                OutlinedButton(
                  child: const Text("Show devices"),
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
                    Text(
                      "BLE: ${context.watch<BleBloc>().state.selectedDevice?.name}",
                    ),
                    Text(
                      "UUID: ${context.watch<BleBloc>().state.selectedDevice?.uuid}",
                    ),
                    Text(
                      context.watch<BleBloc>().state.connected
                          ? "CONNECTED"
                          : "DISCONNECTED",
                    ),
                  ],
                ),
                OutlinedButton(
                  child: const Text("Connect"),
                  onPressed: () => context.read<BleBloc>().add(ConnectDevice()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
