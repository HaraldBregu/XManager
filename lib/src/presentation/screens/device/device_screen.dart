import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:xmanager/src/core/enums.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/presentation/bloc/app/app_bloc.dart';
import 'package:xmanager/src/presentation/bloc/app/app_event.dart';
import 'package:xmanager/src/presentation/bloc/bloc.dart';
import 'package:xmanager/src/presentation/screens/device/bloc/device_bloc.dart';
import 'package:xmanager/src/presentation/screens/device/bloc/device_state.dart';
import 'package:xmanager/src/presentation/widgets/alert_card.dart';
import 'package:xmanager/src/presentation/widgets/indicator_icon.dart';
import 'package:xmanager/src/presentation/widgets/progress_card.dart';

const String bleMac = "E7:C8:DF:65:5B:4B";
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

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppBloc>().state;
    final deviceState = context.watch<DeviceBloc>().state;
    final bleState = context.watch<BleBloc>().state;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text(
              "Dispositivo",
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
            pinned: true,
            //centerTitle: true,
            actions: [
              PopupMenuButton(
                  // add icon, by default "3 dot" icon
                  // icon: Icon(Icons.book)
                  itemBuilder: (context) {
                return const [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text("Elimina dispositivo"),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text("Disconnetti"),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Text("Demo animation"),
                  ),
                ];
              }, onSelected: (value) {
                if (value == 0) {
                  print("My account menu is selected.");
                } else if (value == 1) {
                  print("Disconnect from BLE");
                  context.read<BleBloc>().add(const DisconnectDevice(bleMac));
                } else if (value == 2) {
                  print("Demo animation");
                  context.read<BleBloc>().add(
                        const BleWriteEvent(
                            bleMac,
                            customServiceUuid,
                            trainingCommandCharsUuid,
                            [0x01, 0x02, 0x00, 0x05],
                            false),
                      );
                }
              }),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Card(
                        elevation: 4,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Icon(
                            Icons.double_arrow,
                            color: Colors.orange,
                            size: 70,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            "PIEDE SINISTRO",
                            style: TextStyle(
                              fontSize:
                                  context.textTheme.headlineSmall?.fontSize,
                              fontFamily:
                                  context.textTheme.headlineSmall?.fontFamily,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            "Dispositivo non registrato",
                            style: TextStyle(
                              fontSize: context.textTheme.bodyMedium?.fontSize,
                              fontFamily:
                                  context.textTheme.bodyMedium?.fontFamily,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.play_circle,
                                size: 25,
                                color: context.colorScheme.primary,
                              ),
                              const SizedBox(width: 5),
                              IndicatorIcon(
                                padding: const EdgeInsets.only(right: 5),
                                icon: Icons.bluetooth,
                                state: (bleState.connected)
                                    ? IndicatorIconState
                                        .activeIndicatorIconState
                                    : IndicatorIconState
                                        .initialIndicatorIconState,
                              ),
                              Icon(
                                Icons.bar_chart,
                                size: 25,
                                color: context.colorScheme.primary,
                              ),
                              const SizedBox(width: 5),
                              Icon(
                                Icons.update,
                                size: 25,
                                color: context.colorScheme.primary,
                              ),
                              const SizedBox(width: 5),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const AlertSliverCard(
            visible: false,
            state: AlertState.warningAlertState,
            padding: EdgeInsets.symmetric(horizontal: 10),
            elevation: 4,
            text:
                "Dispositivo non registrato. Registra un dispositivo usando il codice pin!",
            icon: Icons.warning_rounded,
          ),
          AlertSliverCard(
            state: AlertState.infoAlertState,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            elevation: 4,
            text: (bleState is BleConnecting)
                ? "Connesione con il dispositivo in corso..."
                : (bleState.connected)
                    ? "Dispositivo bluetooth connesso"
                    : "Connetti al dispositivo per effeturare download dati e aggiornamenti!",
            icon:
                (!bleState.connected) ? Icons.error : Icons.bluetooth_connected,
          ),
          AlertSliverCard(
            visible: bleState.connected,
            state: AlertState.warningAlertState,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            elevation: 4,
            text: "Scarica i dati raccolti dal dispositivo!",
            icon: Icons.bar_chart,
          ),
          ProgressSliverCard(
            visible: bleState.connected && bleState is BleDownloadingData,
            elevation: 4,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            state: ProgresState.warningProgressState,
            text: "Download dati in corso",
            percentValue: 10,
          ),
          const AlertSliverCard(
            visible: false,
            state: AlertState.warningAlertState,
            padding: EdgeInsets.symmetric(horizontal: 10),
            elevation: 4,
            text:
                "Una nuova versione firmware è disponibile per questo dispositivo. Aggiorna ora!",
            icon: Icons.update,
          ),
          const ProgressSliverCard(
            visible: false,
            elevation: 4,
            padding: EdgeInsets.symmetric(horizontal: 10),
            state: ProgresState.warningProgressState,
            text: "Aggiornamento in corso",
            percentValue: 45,
          ),
          SliverToBoxAdapter(
            child: Text('$bleState'),
          ),
          SliverToBoxAdapter(
            child: Text('$appState'),
          ),          
          SliverToBoxAdapter(
            child: Text('$deviceState'),
          ),          
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // REGISTER DEVICE BUTTON
            Visibility(
              visible: deviceState is DeviceRegisterState,
              child: OutlinedButton(
                style: FilledButton.styleFrom(
                  fixedSize: const Size(150, 50),
                ),
                onPressed: () {},
                child: const Text('REGISTER DEVICE'),
              ),
            ),

            // CONNECT DEVICE BUTTON
            Visibility(
              visible: deviceState is DeviceCanConnectState,
              child: OutlinedButton(
                style: FilledButton.styleFrom(
                  fixedSize: const Size(150, 50),
                ),
                onPressed: () {},
                child: const Text('CONNECT TO DEVICE'),
              ),
            ),

            // REQUEST PERMISSIONS DEVICE BUTTON
            Visibility(
              visible: deviceState is MissingBleConnPermissionsState,
              child: OutlinedButton(
                style: FilledButton.styleFrom(
                  fixedSize: const Size(150, 50),
                ),
                onPressed: () {},
                child: const Text('REQUEST PERMISSIONS'),
              ),
            ),

            Visibility(
              visible: false, // !bleState.connected,
              child: BlocListener<BleBloc, BleState>(
                listener: (context, state) {
                  if (state is BleMissingPermissions) {
                    showGeneralDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierLabel: '',
                      transitionDuration: const Duration(milliseconds: 40),
                      pageBuilder: (context, animation1, animation2) {
                        return Container();
                      },
                      transitionBuilder: (context, a1, a2, widget) {
                        final appState = context.watch<AppBloc>().state;

                        return ScaleTransition(
                          scale:
                              Tween<double>(begin: 0.5, end: 1.0).animate(a1),
                          child: FadeTransition(
                            opacity:
                                Tween<double>(begin: 0.5, end: 1.0).animate(a1),
                            child: Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: SizedBox(
                                height: 300,
                                child: Column(
                                  children: [
                                    const Text("Title"),
                                    if (appState.bluetoothPermissionStatus !=
                                        AppPermissionStatus.granted) ...[
                                      ListTile(
                                        title:
                                            const Text("Bluetooth not granted"),
                                        onTap: () {},
                                      ),
                                    ],
                                    if (appState
                                            .bluetoothConnectPermissionStatus !=
                                        AppPermissionStatus.granted) ...[
                                      ListTile(
                                        title: const Text(
                                            "Bluetooth connect not granted"),
                                        onTap: () {
                                          context.read<AppBloc>().add(
                                              RequestBluetoothConnectPermission());
                                        },
                                      ),
                                    ],
                                    if (appState
                                            .bluetoothScanPermissionStatus !=
                                        AppPermissionStatus.granted) ...[
                                      ListTile(
                                        title: const Text(
                                            "Bluetooth scan not granted"),
                                        onTap: () {
                                          context.read<AppBloc>().add(
                                              RequestBluetoothScanPermission());
                                        },
                                      ),
                                    ],
                                    if (context
                                            .read<AppBloc>()
                                            .state
                                            .locationPermissionStatus !=
                                        AppPermissionStatus.granted) ...[
                                      ListTile(
                                        title:
                                            const Text("Location not granted"),
                                        onTap: () async {
                                          context
                                              .read<AppBloc>()
                                              .add(RequestLocationPermission());
                                        },
                                      ),
                                    ]
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                    }
                  },
                  child: OutlinedButton(
                    style: FilledButton.styleFrom(
                      fixedSize: const Size(150, 50),
                    ),
                    onPressed: (bleState is BleConnecting)
                        ? null
                        : () => context
                            .read<BleBloc>()
                            .add(const ConnectAndAuthenticateDevice(
                              bleMac,
                              customServiceUuid,
                              actionsCharsUuid,
                              password,
                              true,
                            )),
                    child: const Text('CONNECT TO DEVICE'),
                  ),
              ),
            ),
            Visibility(
              visible: bleState.connected,
              child: BlocListener<BleBloc, BleState>(
                listenWhen: (context, state) {
                  return state is BleDidWriteData || state is BleDidReadData;
                },
                listener: (context, state) {
                  if (state is BleDidWriteData) {
                    context.read<BleBloc>().add(
                          const BleReadEvent(
                            bleMac,
                            customServiceUuid,
                            trainingDataCharsUuid,
                          ),
                        );
                  } else if (state is BleDidReadData) {
                    Future.delayed(
                      const Duration(milliseconds: 200),
                      () async {
                        context.read<BleBloc>().add(
                              BleWriteEvent(
                                bleMac,
                                customServiceUuid,
                                actionsCharsUuid,
                                state.data,
                                false,
                              ),
                            );
                      },
                    );
                  }
                },
                child: OutlinedButton(
                  style: FilledButton.styleFrom(
                    fixedSize: const Size(150, 50),
                  ),
                  onPressed: () {
                    context.read<BleBloc>().add(
                          const BleSetNotificationEvent(
                            bleMac,
                            customServiceUuid,
                            trainingDataCharsUuid,
                            true,
                          ),
                        );

                    context.read<BleBloc>().add(
                          const BleLastValueEvent(
                            bleMac,
                            customServiceUuid,
                            trainingDataCharsUuid,
                          ),
                        );

                    context.read<BleBloc>().add(
                          const BleWriteEvent(
                            bleMac,
                            customServiceUuid,
                            actionsCharsUuid,
                            [23, 1, 15, 12, 30, 46],
                            false,
                          ),
                        );
                  },
                  child: const Text('SCARICA DATI'),
                ),
              ),
            ),

            /*
            Visibility(
              visible: bleState.connected,
              child: OutlinedButton(
                style: FilledButton.styleFrom(
                  fixedSize: const Size(150, 50),
                ),
                onPressed: () {
                  context.read<BleBloc>().add(
                        const BleLastValueEvent(
                          bleMac,
                          customServiceUuid,
                          trainingDataCharsUuid,
                        ),
                      );
                  context.read<BleBloc>().add(
                        const BleSetNotificationEvent(
                          bleMac,
                          customServiceUuid,
                          trainingDataCharsUuid,
                          true,
                        ),
                      );
                },
                child: const Text('SCARICA DATI'),
              ),
            ),*/

            /*
            OutlinedButton(
              style: FilledButton.styleFrom(
                fixedSize: const Size(150, 50),
              ),
              onPressed: () {
                context.read<BleBloc>().add(
                      const BleSetNotificationEvent(
                        bleMac,
                        customServiceUuid,
                        trainingDataCharsUuid,
                        true,
                      ),
                    );
              },
              child: const Text('ENABLE NOTIFICATIONS'),
            ),
            OutlinedButton(
              style: FilledButton.styleFrom(
                fixedSize: const Size(150, 50),
              ),
              onPressed: () {
                context.read<BleBloc>().add(
                      const BleLastValueEvent(
                        bleMac,
                        customServiceUuid,
                        trainingDataCharsUuid,
                      ),
                    );
              },
              child: const Text('LISTEN LAST VALUE'),
            ),*/

            /*
            
           
            OutlinedButton(
              style: FilledButton.styleFrom(
                fixedSize: const Size(150, 50),
              ),
              onPressed: () {
                context.read<BleBloc>().add(
                      const BleSetNotificationEvent(
                        bleMac,
                        customServiceUuid,
                        trainingDataCharsUuid,
                        false,
                      ),
                    );
              },
              child: const Text('DISABLE NOTIFICATIONS'),
            ),
            OutlinedButton(
              style: FilledButton.styleFrom(
                fixedSize: const Size(150, 50),
              ),
              onPressed: () {
                final randNumber = Random();
                for (int i = 0; i < 1; i++) {
                  context.read<BleBloc>().add(
                        BleWriteEvent(
                          bleMac,
                          customServiceUuid,
                          actionsCharsUuid,
                          [
                            randNumber.nextInt(254),
                            randNumber.nextInt(254),
                            randNumber.nextInt(254),
                          ],
                        ),
                      );
                }
              },
              child: const Text('WRITE ACTION'),
            ),
            OutlinedButton(
              style: FilledButton.styleFrom(
                fixedSize: const Size(150, 50),
              ),
              onPressed: () {
                context.read<BleBloc>().add(
                      const BleReadEvent(
                        bleMac,
                        customServiceUuid,
                        trainingDataCharsUuid,
                      ),
                    );
              },
              child: const Text('READ BIG DATA'),
            ),
            */
          ],
        ),
      ),
    );
  }
}
