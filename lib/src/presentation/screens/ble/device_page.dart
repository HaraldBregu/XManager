import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/presentation/bloc/ble/ble_bloc.dart';
import 'package:xmanager/src/presentation/bloc/bloc.dart';
import 'package:xmanager/src/presentation/widgets/device_list.dart';

class DevicePage extends StatelessWidget {
  const DevicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text(
              "Device",
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
            pinned: true,
            centerTitle: false,
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: const Text("Left shoe: E7:C8:DF:65:5B:4B"),
                  onTap: () {
                    BlocProvider.of<BleBloc>(context)
                        .add(const StartScanning(seconds: 10));
// Dinamo
//"E7:C8:DF:65:5B:4B"
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return const DeviceList();
                      },
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: OutlinedButton(
                    child: const Text("Connect"),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: OutlinedButton(
                    child: const Text("Assign to user"),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: OutlinedButton(
                    child: const Text("Delete device"),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
