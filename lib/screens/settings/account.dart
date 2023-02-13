import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:xmanager/screens/settings/ble_devices_list.dart';
import 'package:xmanager/screens/settings/permissions.dart';

class Account extends StatefulWidget   {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> with WidgetsBindingObserver {
  var switched = false;
  var blestate = "Unactive";
  final FlutterBluePlus flutterBlue = FlutterBluePlus.instance;



  Future<bool> _checkDeviceBluetoothIsOn() async {
    var i = await flutterBlue.isOn;
    setState(() {
      if (i==true) {
        blestate = "Active";
      } else {
        blestate = "Unactive";
      }
    });
    return i;
  }

  @override
  void initState() {
    super.initState();

    flutterBlue.state.listen((event) {
      _checkDeviceBluetoothIsOn();
    });
    _checkDeviceBluetoothIsOn();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        print("app in resumed");
        _checkDeviceBluetoothIsOn();

        break;
      case AppLifecycleState.inactive:
        print("app in inactive");
        break;
      case AppLifecycleState.paused:
        print("app in paused");
        break;
      case AppLifecycleState.detached:
        print("app in detached");
        break;
    }

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: const Text("Account"),
          backgroundColor: Colors.black,
          centerTitle: true,
          elevation: 0
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          InkWell(
            child: Container(
              height: 60,
              color: const Color.fromRGBO(32, 33, 36, 1.0),
              margin: const EdgeInsets.only(bottom: 5),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Bluetooth is active',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),
                          ),
                        ),
                        Container(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [

                              ],
                            )
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BleDevicesList()));
            },
            child: Container(
              height: 60,
              color: const Color.fromRGBO(32, 33, 36, 1.0),
              margin: const EdgeInsets.only(bottom: 5),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Bluetooth',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),
                          ),
                        ),
                        Container(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                              ],
                            )
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const Permissions()));
            },
            child: Container(
              height: 60,
              color: const Color.fromRGBO(32, 33, 36, 1.0),
              margin: const EdgeInsets.only(bottom: 5),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Permissions',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),
                          ),
                        ),
                        Container(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                              ],
                            )
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}












