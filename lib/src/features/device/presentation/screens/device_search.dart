import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/enums.dart';
import '../../../../shared/presentation/bloc/app/app_bloc.dart';
import '../../../../shared/presentation/bloc/app/app_event.dart';
import 'device_detail_test.dart';

class DeviceSearch extends StatefulWidget {
  const DeviceSearch({super.key});

  @override
  State<DeviceSearch> createState() => _DeviceSearchState();
}

class _DeviceSearchState extends State<DeviceSearch> {
  final List<BluetoothDevice> devicesList = <BluetoothDevice>[];
  final Map<Guid, List<int>> readValues = <Guid, List<int>>{};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bluetooth"),
        actions: [
          TextButton(
            child: const Text("SEARCH"),
            onPressed: () =>
                FlutterBluePlus.startScan(timeout: const Duration(seconds: 5)),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          [
            Permission.location,
            Permission.bluetooth,
            Permission.bluetoothConnect,
            Permission.bluetoothScan,
            Permission.storage,
          ].request();

          //FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ListTile(
                    title: const Text("Location granted"),
                    trailing: Text(context
                                .watch<AppBloc>()
                                .state
                                .locationPermissionStatus ==
                            AppPermissionStatus.granted
                        ? "true"
                        : "false"),
                    onTap: () => context.read<AppBloc>()
                      ..add(RequestLocationPermission()),
                  ),
                  ListTile(
                    title: const Text("Bluetooth granted"),
                    trailing: Text(context
                                .watch<AppBloc>()
                                .state
                                .bluetoothPermissionStatus ==
                            AppPermissionStatus.granted
                        ? "true"
                        : "false"),
                    onTap: () => context.read<AppBloc>()
                      ..add(RequestBluetoothPermission()),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: StreamBuilder<List<BluetoothDevice>>(
                stream: Stream.periodic(const Duration(seconds: 2))
                    .asyncMap((_) => FlutterBluePlus.connectedSystemDevices),
                initialData: const [],
                builder: (c, snapshot) => Column(
                  children: snapshot.data!
                      .map((d) => ListTile(
                            title: Text(d.localName),
                            subtitle: Text(d.remoteId.toString()),
                            trailing: StreamBuilder<BluetoothConnectionState>(
                              stream: d.connectionState,
                              initialData:
                                  BluetoothConnectionState.disconnected,
                              builder: (c, snapshot) {
                                if (snapshot.data ==
                                    BluetoothConnectionState.connected) {
                                  return ElevatedButton(
                                    child: const Text('OPEN'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DeviceDetailTest(device: d),
                                        ),
                                      );
                                    },
                                  );
                                }
                                return Text(snapshot.data.toString());
                              },
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: StreamBuilder<List<ScanResult>>(
                stream: FlutterBluePlus.scanResults,
                initialData: const [],
                builder: (c, snapshot) {
                  return Column(
                    children: snapshot.data!.map((r) {
                      return ListTile(
                        title: Text("Device name: ${r.device.localName}"),
                        subtitle: Text("UUID: ${r.device.remoteId}"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DeviceDetailTest(
                                device: r.device,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
