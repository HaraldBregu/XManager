import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/presentation/bloc/ble/bloc.dart';

class DeviceListPage extends StatelessWidget {
  const DeviceListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Device list"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => {
              BlocProvider.of<BleBloc>(context).add(
                const StartScanning(seconds: 10),
              ),
            },
          ),
          TextButton(
            child: const Text("stop"),
            onPressed: () => {
              BlocProvider.of<BleBloc>(context).add(
                StopScanning(),
              ),
            },
          ),
        ],
      ),
      body: const _DeviceListBody(),
    );
  }
}

class _DeviceListBody extends StatelessWidget {
  const _DeviceListBody();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: ListTile(
            title: Text("Scanning State"),
            subtitle: Text("scanning"),
          ),
        ),
        BlocBuilder<BleBloc, BleState>(
          builder: (context, state) {
            // if (state is AddingDevices) {
            //   final devices = state.devices;
            //   final length = devices.length;

            //   return SliverList(
            //     delegate: SliverChildBuilderDelegate(
            //       (BuildContext context, int index) {
            //         final device = devices[index];
            //         return ListTile(
            //           title: Text("Device name: ${device.name}"),
            //           subtitle: Text(device.uuid),
            //           onTap: () {},
            //         );
            //       },
            //       childCount: length,
            //     ),
            //   );
            // }
            return const SliverToBoxAdapter(
              child: SizedBox(
                height: 0,
              ),
            );
          },
        ),
      ],
    );
  }
}
