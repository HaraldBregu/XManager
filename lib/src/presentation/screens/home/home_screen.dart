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
import 'package:xmanager/src/presentation/screens/device/bloc/device_state.dart';
import 'package:xmanager/src/presentation/screens/home/bloc/home_bloc.dart';
import 'package:xmanager/src/presentation/screens/home/bloc/home_event.dart';
import 'package:xmanager/src/presentation/screens/home/bloc/home_state.dart';
import 'package:xmanager/src/presentation/widgets/alert_card.dart';
import 'package:xmanager/src/presentation/widgets/drawer_menu.dart';
import 'package:xmanager/src/presentation/widgets/modals/permission_modal_bottom_sheet.dart';
import 'package:xmanager/src/presentation/widgets/nav_bar.dart';
import 'package:xmanager/src/presentation/widgets/training_program_list.dart';

const String bleMac = "E8:29:77:C6:A9:C0";
const String customServiceUuid = "00001600-1212-efde-1523-785feabcd121";
const String actionsCharsUuid = "00001601-1212-efde-1523-785feabcd121";
const String trainingCommandCharsUuid = "00001602-1212-efde-1523-785feabcd121";
const String trainingDataCharsUuid = "00001603-1212-efde-1523-785feabcd121";
const List<int> password = [
  56,
  148,
  132,
  156,
  147,
  134,
  152,
  174,
  236,
  7,
  185,
  208,
  186,
  98,
  59,
  181,
  202,
  0,
  77,
  147,
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceState = context.watch<DeviceBloc>().state;

    return Scaffold(
      drawer: const DrawerMenu(),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1- Open bottom sheet with programs
            // 2- Select a program to upload
            // 3- Close bottom sheet
            // 4- Open bottom sheet for program uploader
            // 5- Connect to current device
            // 6- Authenticate to current device
            // 7- Upload program to current device
            // 8- Disconnect
            // 9- Repeat for other devices

            // SELECT PROGRAM
            // CONNECT DEVICE
            // UPLOAD PROGRAM

            BlocListener<HomeBloc, HomeState>(
              listenWhen: (previous, current) {
                return previous !=
                    current; /* &&
                    (deviceState is DeviceDisconnected ||
                        deviceState is DeviceConnecting ||
                        deviceState is DeviceCanConnectState ||
                        deviceState is DeviceConnectionErrorState ||
                        deviceState is PermissionsDeniedState ||
                        deviceState is PermissionsPermanentlyDeniedState);*/
              },
              listener: (context, state) {
                // state is HomeUploadingProgramToDeviceState
                // get state connected
                // get state authenticated
                // get state uploaded program

                /* 
                 showGeneralDialog(
                    context: context,
                    barrierLabel: "Barrier",
                    barrierDismissible: true,
                    //barrierColor: Colors.black.withOpacity(0.5),
                    //transitionDuration: Duration(milliseconds: 700),
                    pageBuilder: (_, __, ___) {
                      return Center(
                        child: Container(
                          height: 240,
                          //margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            //borderRadius: BorderRadius.circular(40),
                          ),
                          child: const SizedBox.expand(child: FlutterLogo()),
                        ),
                      );
                    },         
                  );*/

                /*if (state is PermissionsDeniedState) {
                  showPermissionModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    header: const Icon(
                      Icons.bluetooth,
                      size: 100,
                    ),
                    title: "Dispositivi nelle vicinanze",
                    description:
                        "Per utilizzare tutte le funzionalità dell'app, è necessario attivare il permesso Bluetooth. Attivando il Bluetooth, potrai accedere a una vasta gamma di servizi e interazioni che migliorano l'esperienza dell'app. Ti preghiamo di concedere il permesso Bluetooth per continuare. Grazie!",
                    actionTitle: "ATTIVA",
                    onPressed: () {
                      context.pop();
                      context
                          .read<AppBloc>()
                          .add(RequestBluetoothConnectPermission());
                    },
                  );
                } else if (state is PermissionsPermanentlyDeniedState) {
                  showPermissionModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    header: const Icon(
                      Icons.bluetooth,
                      size: 100,
                    ),
                    title: "Dispositivi nelle vicinanze",
                    description:
                        "Per utilizzare tutte le funzionalità dell'app, è necessario attivare il permesso Bluetooth. Attivando il Bluetooth, potrai accedere a una vasta gamma di servizi e interazioni che migliorano l'esperienza dell'app. Ti preghiamo di concedere il permesso Bluetooth per continuare. Grazie!",
                    actionTitle: "VAI IN IMPOSTAZIONI",
                    onPressed: () {
                      context.pop();
                      context.read<AppBloc>().add(GoToSettings());
                    },
                  );
                } else if (state is DeviceConnectionErrorState) {
                  Future<void> showMyDialog() async {
                    return showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('AlertDialog Title'),
                          content: const SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text('This is a demo alert dialog.'),
                                Text(
                                  'Would you like to approve of this message?',
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Approve'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }

                  showMyDialog();
                } else if (state is DeviceConnecting) {
                  // Show connecting state
                } else if (state is DeviceConnected) {
                  // Show connected state
                }
                */
              },
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  fixedSize: const Size(150, 50),
                ),
                icon: const Icon(Icons.run_circle),
                label: const Text("START TRAINING"),
                onPressed: () async {
                  return;
                  showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    useSafeArea: true,
                    builder: (context) {
                      return DraggableScrollableSheet(
                        expand: false,
                        snap: true,
                        builder: (_, controller) {
                          return SingleChildScrollView(
                            controller: controller,
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 8.0),
                                  width: 30.0,
                                  height: 3.0,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                ),
                                TrainingProgramList(
                                  onSelectTrainingProgram: () {
                                    context.pop();
                                    /*if (deviceState is! DeviceConnecting) {
                                      context.read<DeviceBloc>().add(
                                            const ConnectToDevice(
                                              bleMac,
                                              customServiceUuid,
                                              actionsCharsUuid,
                                              password,
                                              true,
                                            ),
                                          );
                                    }*/
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
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
