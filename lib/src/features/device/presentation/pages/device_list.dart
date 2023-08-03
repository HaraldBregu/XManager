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
                const BleStartScanEvent(seconds: 10),
              ),
            },
          ),
          TextButton(
            child: const Text("stop"),
            onPressed: () => {
              BlocProvider.of<BleBloc>(context).add(
                BleStopScanEvent(),
              ),
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("Name bluetooth"),
            subtitle: Text("subtitle uuid"),
            onTap: () {},
            onLongPress: () {},
          );
        },
      ),
      /*BlocBuilder<BleBloc, BleState>(
        builder: (bloc, state) {
          if (state is BleScanningState) {
            return const Text("scanning");
          }
          if (state is BleEndScanningState) {
            return const Text("end scanning");
          }

          return const Text("");
        },
      ),*/

    );
  }
}

