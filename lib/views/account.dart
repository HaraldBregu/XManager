import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:provider/provider.dart';
import 'package:xmanager/common.dart';
import 'package:xmanager/main.dart';
import 'package:xmanager/services/app_state_notifier.dart';
import 'package:xmanager/shared/widget/theme_mode_switch.dart';




class Account extends StatefulWidget {
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
    AppLocalizations? localize = AppLocalizations.of(context);
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text("Account")),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          ListTile(
            trailing: Icon(Icons.bluetooth),
            title: Text('Bluetooth state', style: textTheme.titleMedium),
            onTap: () => {},
          ),
          ListTile(
            title: const Text('Theme Mode'),
            trailing: ThemeModeSwitch(
              themeMode: context.watch<AppStateNotifier>().themeMode,
              onChanged: (ThemeMode mode) {
                setState(() {
                  context.read<AppStateNotifier>().setThemeMode(mode);
                });
              },
            )
          ),
          ListTile(
            title: Text('App Permissions', style: textTheme.titleMedium),
            onTap: () => Navigator.pushNamed(context, RouteNames.appPermissions),
          ),
          SwitchListTile(
              title: Text('Switch tile', style: textTheme.titleMedium),
              value: context.watch<AppStateNotifier>().darkMode,
              onChanged: (bool value) {
                setState(() {
                  context.watch<AppStateNotifier>().setDarkMode(value);
                });
              }
          ),
          ListTile(
            title: const Text('Bluetooth search'),
            trailing: const Icon(Icons.search),
            onTap: () => Navigator.pushNamed(context, RouteNames.deviceSearch),
          ),
        ],
      )
    );
  }
}