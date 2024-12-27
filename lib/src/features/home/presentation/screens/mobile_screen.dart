import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/features/home/presentation/bloc/program/program_bloc.dart';
import 'package:xmanager/src/features/home/presentation/bloc/program/program_event.dart';
import 'package:xmanager/src/features/home/presentation/bloc/uploader/uploader_bloc.dart';
import 'package:xmanager/src/features/home/presentation/bloc/uploader/uploader_event.dart';
import 'package:xmanager/src/features/home/presentation/screens/analytics/analytics_screen.dart';
import 'package:xmanager/src/features/home/presentation/screens/device/devices_screen.dart';
import 'package:xmanager/src/features/home/presentation/screens/home/home_screen.dart';
import 'package:xmanager/src/features/home/presentation/screens/program/programs_screen.dart';
import 'package:xmanager/src/features/home/presentation/screens/settings/settings_screen.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeWidget(),
    ProgramWidget(),
    DevicesWidget(),
    AnalyticsWidget(),
    SettingsWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      switch (index) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
          _selectedIndex = index;
          break;
      }
    });
  }

  Widget? _actionForTabIndex(int index) {
    switch (index) {
      case 0:
        return FloatingActionButton.extended(
          heroTag: 'start_training_tag',
          icon: const Icon(Icons.play_arrow),
          label: const Text('START'),
          backgroundColor: context.colorScheme.secondaryContainer,
          onPressed: () {
            context.read<ProgramBloc>().add(const GetPrograms());
            context.read<UploaderBloc>().add(const ResetUploader());
            context.pushNamed("program select screen");
          },
        );
      case 1:
        return FloatingActionButton.extended(
          heroTag: 'create_program_tag',
          icon: const Icon(Icons.add),
          label: const Text('NEW'),
          onPressed: () {
            context.pushNamed("program edit screen");
          },
        );
      case 2:
        return FloatingActionButton.extended(
          heroTag: 'create_device_tag',
          icon: const Icon(Icons.add),
          label: const Text('REGISTER'),
          onPressed: () {
            //context.pushNamed("device edit screen");
          },
        );
      case 3:
      case 4:
        return null;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 10,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2_outlined),
              label: 'Programs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.phone_android_outlined),
              label: 'Devices',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_rounded),
              label: 'Data',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          //selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
        floatingActionButton: _actionForTabIndex(_selectedIndex),
      ),
    );
  }
}
