import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:xmanager/src/presentation/bloc/bloc.dart';

class DeviceList extends StatelessWidget {
  const DeviceList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BleBloc, BleState>(
      builder: (context, state) {
        final devices = state.devices;
        final length = devices.length;
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: length,
          itemBuilder: (BuildContext context, int index) {
            final device = devices[index];
            return ListTile(
              title: Text("Device name: ${device.name}"),
              subtitle: Text(device.uuid),
              onTap: () {
                //"E7:C8:DF:65:5B:4B"
              },
            );
          },
        );
      },
    );

    // return BlocBuilder<BleBloc, BleState>(
    //   builder: (context, state) {
    //     final devices = state.devices;
    //     final length = devices.length;
    //     return SliverList(
    //       delegate: SliverChildBuilderDelegate(
    //         (BuildContext context, int index) {
    //           final device = devices[index];
    //           return ListTile(
    //             title: Text("Device name: ${device.name}"),
    //             subtitle: Text(device.uuid),
    //             onTap: () {},
    //           );
    //         },
    //         childCount: length,
    //       ),
    //     );
    //   },
    // );
  }
}
