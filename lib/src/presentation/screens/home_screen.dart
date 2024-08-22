import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:xmanager/src/core/localizations_extension.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/presentation/bloc/app/app_bloc.dart';
import 'package:xmanager/src/presentation/bloc/app/app_event.dart';
import 'package:xmanager/src/presentation/bloc/bloc.dart';
import 'package:xmanager/src/presentation/screens/device/bloc/device_bloc.dart';
import 'package:xmanager/src/presentation/screens/device/bloc/device_event.dart';
import 'package:xmanager/src/presentation/widgets/alert_card.dart';
import 'package:xmanager/src/presentation/widgets/drawer_menu.dart';
import 'package:xmanager/src/presentation/widgets/nav_bar.dart';
import 'package:xmanager/src/presentation/widgets/training_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: 400,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('Modal BottomSheet'),
                    ElevatedButton(
                      child: const Text('Close BottomSheet'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        backgroundColor: context.colorScheme.secondaryContainer,
        foregroundColor: context.colorScheme.onSecondaryContainer,
        icon: const Icon(Icons.play_circle),
        label: Text(
          'START TRAINING',
          style: TextStyle(
            fontSize: context.textTheme.labelLarge?.fontSize,
            fontFamily: context.textTheme.labelLarge?.fontFamily,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          const NavBarDashboard(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 15,
                left: 20,
                right: 20,
                bottom: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.loc.dashboard,
                    style: TextStyle(
                      fontSize: context.textTheme.headlineLarge?.fontSize,
                      fontFamily: context.textTheme.headlineLarge?.fontFamily,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: Card(
                elevation: 6,
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      color: context.colorScheme.primaryContainer,
                      child: const Icon(
                        Icons.person,
                        size: 25.0,
                      ),
                    ),
                  ),
                  title: Text(
                    "Juan Martin",
                    style: TextStyle(
                      fontSize: context.textTheme.labelLarge?.fontSize,
                      fontFamily: context.textTheme.labelLarge?.fontFamily,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    "28 anni",
                    style: TextStyle(
                      fontSize: context.textTheme.labelLarge?.fontSize,
                      fontFamily: context.textTheme.labelLarge?.fontFamily,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  onTap: () {
                    context.pushNamed("update profile screen");
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 5, 16, 0),
              child: Card(
                elevation: 6,
                child: ListTile(
                  title: Text(
                    "Program list",
                    style: TextStyle(
                      fontSize: context.textTheme.labelLarge?.fontSize,
                      fontFamily: context.textTheme.labelLarge?.fontFamily,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    context.pushNamed("program list screen");
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 5, 16, 0),
              child: Card(
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 8,
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text("Dinamo"),
                        titleTextStyle: TextStyle(
                          fontSize: context.textTheme.titleLarge?.fontSize,
                          fontFamily: context.textTheme.titleLarge?.fontFamily,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const AlertCard(
                        state: AlertState.warningAlertState,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        text: "Registra tutti i dispositivi!",
                        icon: Icons.error,
                      ),
                      GestureDetector(
                        onTap: () {
                          context
                              .read<AppBloc>()
                              .add(AppPermissionsStatusEvent());
                          context.read<BleBloc>().add(
                                const ListenConnectionStateEvent(
                                    "E7:C8:DF:65:5B:4B"),
                              );

                          const deviceEvent =
                              DeviceSelectEvent("E7:C8:DF:65:5B:4B");
                          context.read<DeviceBloc>().add(deviceEvent);

                          context.pushNamed("Device screen");
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                const Card(
                                  elevation: 0,
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: RotatedBox(
                                      quarterTurns: 2,
                                      child: Icon(
                                        Icons.double_arrow_outlined,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "PIEDE SINISTRO",
                                  style: context.textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<AppBloc>().add(AppStartEvent());
                          context.read<BleBloc>().add(
                                const ListenConnectionStateEvent(
                                    "E7:C8:DF:65:5B:4B"),
                              );
                          final deviceEvent = DeviceStartEvent();
                          context.read<DeviceBloc>().add(deviceEvent);

                          context.pushNamed("Device screen");
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                const Card(
                                  elevation: 0,
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(
                                      //Icons.change_history_outlined,
                                      Icons.double_arrow_outlined,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "PIEDE DESTRO",
                                  style: context.textTheme.titleMedium,
                                ),
                                // const Icon(Icons.arrow_forward),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          /*
          TrainingCard(
            title: "TRAINING SESSION",
            subtitle: "Nessun programma attivo",
            description: "3/4 programmi terminati", // optional
            options: const [
              "Current trainig program",
              "Training program list",
              "Create program",
            ],
            onTapOption: (option) async {
              print(option);
            },
          ),*/
        ],
      ),
      drawer: const DrawerMenu(),
    );
  }
}
