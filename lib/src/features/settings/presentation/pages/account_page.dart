import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:xmanager/main.dart';
import 'package:xmanager/src/core/common.dart';
import 'package:xmanager/src/core/data/models/models.dart';
import 'package:xmanager/src/core/theme_extension.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> with WidgetsBindingObserver {
  bool switched = false;
  String blestate = "Unactive";
  //final FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

  Future<bool> _checkDeviceBluetoothIsOn() async {
    final i = await FlutterBluePlus.isOn;
    setState(() {
      if (i == true) {
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
    FlutterBluePlus.state.listen((event) {
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
    //final AppLocalizations? localize = AppLocalizations.of(context);
    //final ThemeData theme = Theme.of(context);
    //final TextTheme textTheme = theme.textTheme;
    final List<Widget> widgets = [];

    widgets.add(ListTile(
      trailing: const Icon(Icons.bluetooth),
      title: Text('Bluetooth state', style: context.textTheme.titleMedium),
      onTap: () => {},
    ));
/*
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
    ));*/

    widgets.add(ListTile(
      title: Text('App Permissions', style: context.textTheme.titleMedium),
      onTap: () => Navigator.pushNamed(context, "/app_permissions"),
    ));

    widgets.add(ListTile(
      title: const Text('Bluetooth search'),
      trailing: const Icon(Icons.search),
      onTap: () => Navigator.pushNamed(context, "/device_search"),
    ));

    if (kDebugMode) {
      /*
      widgets.add(SwitchListTile(
          title: Text('Switch tile', style: textTheme.titleMedium),
          value: context.watch<AppStateNotifier>().darkMode,
          onChanged: (bool value) {
            setState(() {
              context.watch<AppStateNotifier>().setDarkMode(value);
            });
          },
      ),);
      */
      /*
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
        ),
      );*/
      widgets.add(ListTile(
        title: const Text('Test Sliver'),
        onTap: () {
          const testSliver = TestSliver();
          final materialRoute =
              MaterialPageRoute(builder: (context) => testSliver);
          Navigator.push(context, materialRoute);
        },
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(title: const Text("Account")),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: widgets,
        ));
  }
}

class TestSliver extends StatelessWidget {
  const TestSliver({super.key});

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
                  actions: [],
                ),
              ],
          body: ListView.separated(
          itemBuilder: (context, index) => const ListTile(
            title: Text("Titolo"),
                  ),
              separatorBuilder: (context, index) => const SizedBox(height: 1),
          itemCount: 30,
        ),
      ),
    );
  }
}
