import 'package:flutter/material.dart';
import 'package:xmanager/src/shared/widgets/device_list.dart';

class DeviceListPage extends StatelessWidget {
  const DeviceListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Placeholder(),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text("Device list"),
    //     actions: [
    //       IconButton(
    //         icon: const Icon(Icons.search),
    //         onPressed: () => {
    //           BlocProvider.of<BleBloc>(context).add(
    //             const StartScanning(seconds: 10),
    //           ),
    //         },
    //       ),
    //       TextButton(
    //         child: const Text("stop"),
    //         onPressed: () => {
    //           BlocProvider.of<BleBloc>(context).add(
    //             StopScanning(),
    //           ),
    //         },
    //       ),
    //     ],
    //   ),
    //   body: const _DeviceListBody(),
    // );
  }
}

class _DeviceListBody extends StatelessWidget {
  const _DeviceListBody();

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ListTile(
            title: Text("Scanning State"),
            subtitle: Text("scanning"),
          ),
        ),
        DeviceList(),
      ],
    );
  }
}
