import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';


class BleDevicesList extends StatefulWidget {
  const BleDevicesList({super.key});

  @override
  State<BleDevicesList> createState() => _BleDevicesListState();
}

class _BleDevicesListState extends State<BleDevicesList> {
  final List<BluetoothDevice> devicesList = <BluetoothDevice>[];
  //List<BluetoothService> _services = [];
  final Map<Guid, List<int>> readValues = <Guid, List<int>>{};

  // ignore: always_declare_return_types, avoid_final_parameters
  _addDeviceTolist(final BluetoothDevice device) {
    if (!devicesList.contains(device)) {
      setState(() {
        devicesList.add(device);
      });
    }
  }


  ListView _buildListViewOfDevices() {
    final List<Widget> containers = <Widget>[];
    for (BluetoothDevice device in devicesList) {
      containers.add(

        Card(
          color: Colors.black,
          child: InkWell(
            child: ListTile(
              title: Text(
                  device.name == '' ? '(unknown device)' : device.name,
                  style: TextStyle(color: Colors.white)),
              subtitle: Text(
                  device.id.id == '' ? '(unknown device)' : device.id.id,
                  style: TextStyle(color: Colors.white)),
              trailing: TextButton(
                child: const Text(
                  'Connect',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                FlutterBluePlus.stopScan();
                  try {
                    await device.connect();
                  } on PlatformException catch (e) {
                    if (e.code != 'already_connected') {
                      rethrow;
                    }
                  } finally {
                  //_services = await device.discoverServices();
                  }
                setState(() {
                  });
                },
              ),
              onTap: () {

              },
            ),
          ),
        )

      );
    }

    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        ...containers,
      ],
    );
  }


  @override
  void initState() {
    super.initState();

    /*
    FlutterBluePlus.connectedDevices
        .asStream()
        .listen((List<BluetoothDevice> devices) {
      for (BluetoothDevice device in devices) {
        _addDeviceTolist(device);
      }
    });*/

    FlutterBluePlus.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        _addDeviceTolist(result.device);
      }
    });
    FlutterBluePlus.startScan();
    //flutterBlue.startScan(withServices: [Guid("yourSpecificServiceUUIDString")]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: Text("Ble ${devicesList.length}"),
          backgroundColor: Colors.black,
          centerTitle: true,
          elevation: 0
      ),
      body: _buildListViewOfDevices()
      /*ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.black,
              child: InkWell(
                child: ListTile(
                  title: const Text(
                      "Titolo",
                  style: TextStyle(color: Colors.white)),
                  subtitle: const Text(
                      "SottoTitolo",
                      style: TextStyle(color: Colors.white)),
                  trailing: const Icon(Icons.arrow_forward_rounded, color: Colors.white,),
                  onTap: () {

                  },
                ),
              ),
            );
          }),*/
    );
  }
}
