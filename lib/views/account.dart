import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:provider/provider.dart';
import 'package:xmanager/common.dart';
import 'package:xmanager/main.dart';
import 'package:xmanager/model/data_model.dart';
import 'package:xmanager/objectbox.g.dart';
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
    List<Widget> widgets = [];

    widgets.add(ListTile(
      trailing: Icon(Icons.bluetooth),
      title: Text('Bluetooth state', style: textTheme.titleMedium),
      onTap: () => {},
    ));

    widgets.add(ListTile(
        title: const Text('Theme Mode'),
        trailing: ThemeModeSwitch(
          themeMode: context.watch<AppStateNotifier>().themeMode,
          onChanged: (ThemeMode mode) {
            setState(() {
              context.read<AppStateNotifier>().setThemeMode(mode);
            });
          },
        )
    ));

    widgets.add(ListTile(
      title: Text('App Permissions', style: textTheme.titleMedium),
      onTap: () => Navigator.pushNamed(context, RouteNames.appPermissions),
    ));

    widgets.add(ListTile(
      title: const Text('Bluetooth search'),
      trailing: const Icon(Icons.search),
      onTap: () => Navigator.pushNamed(context, RouteNames.deviceSearch),
    ));

    if (kDebugMode) {
      widgets.add(SwitchListTile(
          title: Text('Switch tile', style: textTheme.titleMedium),
          value: context.watch<AppStateNotifier>().darkMode,
          onChanged: (bool value) {
            setState(() {
              context.watch<AppStateNotifier>().setDarkMode(value);
            });
          }
      ));
      widgets.add(ListTile(
        title: const Text('Add test data'),
        onLongPress: () {

          try {
            Player pl = Player();
            pl.fullname = "Ezequiel Lavezzi";
            throw objectBox.playerBox.put(pl);
          } catch (error) {
            print(error);
          }

          try {
            Player pl = Player();
            pl.fullname = "Iker Casillas";
            throw objectBox.playerBox.put(pl);
          } catch (error) {
            print(error);
          }

          try {
            Player pl = Player();
            pl.fullname = "Zlatan Ibrahimovic";
            throw objectBox.playerBox.put(pl);
          } catch (error) {
            print(error);
          }

          try {
            Player pl = Player();
            pl.fullname = "Zlatan Ibrahimovic";
            throw objectBox.playerBox.put(pl);
          } catch (error) {
            print(error);
          }

          try {
            Player pl = Player();
            pl.fullname = "David Beckham";
            throw objectBox.playerBox.put(pl);
          } catch (error) {
            print(error);
          }

          try {
            Player pl = Player();
            pl.fullname = "Cristiano Ronaldo";
            throw objectBox.playerBox.put(pl);
          } catch (error) {
            print(error);
          }

          try {
            Player pl = Player();
            pl.fullname = "Lionel Messi";
            throw objectBox.playerBox.put(pl);
          } catch (error) {
            print(error);
          }

          try {
            SessionProgram sp1 = SessionProgram();
            sp1.title = "Default program";
            sp1.programs = [
              DeviceProgram(),
              DeviceProgram(),
            ];
            throw objectBox.sessionProgramBox.put(sp1);
          } catch (error) {
            print(error);
          }

          try {
            SessionProgram sp1 = SessionProgram();
            sp1.title = "Demo program";
            sp1.programs = [
              DeviceProgram(),
              DeviceProgram(),
            ];
            throw objectBox.sessionProgramBox.put(sp1);
          } catch (error) {
            print(error);
          }

          try {
            SessionProgram sp1 = SessionProgram();
            sp1.title = "Self-training session";
            sp1.programs = [
              DeviceProgram(),
              DeviceProgram(),
            ];
            throw objectBox.sessionProgramBox.put(sp1);
          } catch (error) {
            print(error);
          }

        },
      ));
      widgets.add(ListTile(
        title: const Text('Test Sliver'),
        onTap: () {
          var testSliver = const TestSliver();
          var materialRoute = MaterialPageRoute(builder: (context) => testSliver);
          Navigator.push(context, materialRoute);
        },
      ));
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Account")),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: widgets,
      )
    );
  }
}

class TestSliver extends StatelessWidget {
  const TestSliver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: const Text('App Bar'),
            expandedHeight: 140,
            forceElevated: innerBoxIsScrolled,
            floating: true,
            snap: true,
            pinned: true,
            //flexibleSpace: ,
            actions: [
              
            ],
          ),
        ],
        body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
              title: const Text("Titolo"),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 1),
            itemCount: 30)),
    );
  }
}
