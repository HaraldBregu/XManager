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
                const BleStartScanEvent(seconds: 5),
              ),
            },
          ),
        ],
      ),
      body: const Text("player create"),
    );
  }
}

