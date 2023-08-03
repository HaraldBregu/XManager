import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:xmanager/src/features/device/presentation/pages/device_detail_test.dart';

class DeviceSearch extends StatefulWidget {
  const DeviceSearch({super.key});

  @override
  State<DeviceSearch> createState() => _DeviceSearchState();
}

class _DeviceSearchState extends State<DeviceSearch> {
  final FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
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
          title: Text("Bluetooth"),
          actions: [
            TextButton(
              child: Text("SEARCH"),
              onPressed: () => FlutterBluePlus.instance
                  .startScan(timeout: const Duration(seconds: 5)),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            FlutterBluePlus.instance
                .startScan(timeout: const Duration(seconds: 5));
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: StreamBuilder<List<BluetoothDevice>>(
                  stream: Stream.periodic(const Duration(seconds: 2)).asyncMap(
                      (_) => FlutterBluePlus.instance.connectedDevices),
                  initialData: const [],
                  builder: (c, snapshot) => Column(
                    children: snapshot.data!
                        .map((d) => ListTile(
                              title: Text(d.name),
                              subtitle: Text(d.id.toString()),
                              trailing: StreamBuilder<BluetoothDeviceState>(
                                stream: d.state,
                                initialData: BluetoothDeviceState.disconnected,
                                builder: (c, snapshot) {
                                  if (snapshot.data ==
                                      BluetoothDeviceState.connected) {
                                    return ElevatedButton(
                                      child: const Text('OPEN'),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DeviceDetailTest(device: d)),
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
                  stream: FlutterBluePlus.instance.scanResults,
                  initialData: const [],
                  builder: (c, snapshot) {
                    return Column(
                        children: snapshot.data!
                            .map((r) => ListTile(
                                  title: Text("Device name: ${r.device.name}"),
                                  subtitle: Text("UUID: ${r.device.id}"),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DeviceDetailTest(
                                                  device: r.device)),
                                    );
                                  },
                                ))
                            .toList());
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
