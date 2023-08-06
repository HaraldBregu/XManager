import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/presentation/bloc/ble/bloc.dart';

class DeviceList extends StatelessWidget {
  const DeviceList({super.key});

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
        SliverToBoxAdapter(
          child: ListTile(
            title: const Text("Bluetooth State"),
            trailing: Switch(
              value: false,
              onChanged: (bool value) {},
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: BlocBuilder<BleBloc, BleState>(
            builder: (bloc, state) {
              if (state is Scanning) {
                final devices = state.devices;
                final length = devices.length;
                return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: length,
                  itemBuilder: (BuildContext context, int index) {
                    final device = devices[index];
                    return ListTile(
                      title: Text(device.name),
                      subtitle: Text(device.uuid),
                      onTap: () {},
                      onLongPress: () {},
                    );
                  },
                );
              }
              if (state is EndScanning) {
                return const Text("end scanning");
              }

              return const Text("No data");
            },
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              OutlinedButton(
                child: const Text("Device list test"),
                onPressed: () {},
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 120,
          ),
        ),
      ],
    );
    ;
  }
}
