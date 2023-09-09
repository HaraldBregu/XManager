import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/domain/entities/bluetooth_device_entity.dart';
import 'package:xmanager/src/core/presentation/bloc/ble/bloc.dart';

class DeviceList extends StatelessWidget {
  const DeviceList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocBuilder<BleBloc, BleState>(
        builder: (context, state) {
          final count = state.devices.length;
          return ListView.builder(
            itemCount: count,
            itemBuilder: (_, index) {
              final device = state.devices[index];
              final name = device.name;
              final uuid = device.uuid;
              // String type = "";
              // switch (device.type) {
              //   case BLEDeviceType.unknown:
              //     type = "unknown";
              //     break;
              //   case BLEDeviceType.classic:
              //     type = "classic";
              //     break;
              //   case BLEDeviceType.le:
              //     type = "le";
              //     break;
              //   case BLEDeviceType.dual:
              //     type = "dual";
              //     break;
              // }

              return ListTile(
                title: Text("Name: $name"),
                subtitle: Text(uuid),
                //trailing: Text(type),
                onTap: () => context.read<BleBloc>()..add(SelectDevice(device)),
              );
            },
          );
        },
      ),
    );
  }
}
