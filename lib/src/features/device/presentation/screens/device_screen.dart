import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/device_bloc.dart';
import '../bloc/device_event.dart';
import '../bloc/device_state.dart';
import '../../../../shared/presentation/bloc/app/app_bloc.dart';
import '../../../../shared/presentation/bloc/app/app_event.dart';
import '../../../../shared/presentation/bloc/bloc.dart';
import '../../../../shared/widgets/alert_card.dart';
import '../../../../shared/widgets/indicator_icon.dart';
import '../../../../shared/widgets/permission_modal_bottom_sheet.dart';
import '../../../../shared/widgets/progress_card.dart';
import '../../../../shared/widgets/device_section.dart';

//const String bleMac = "E7:C8:DF:65:5B:4B";
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

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppBloc>().state;
    final deviceState = context.watch<DeviceBloc>().state;

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
              PopupMenuButton(itemBuilder: (context) {
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
                  context
                      .read<DeviceBloc>()
                      .add(const DisconnectFromDevice(bleMac));
                } else if (value == 2) {
                  print("Demo animation");
                  context.read<BleBloc>().add(
                        const BleWriteEvent(
                          bleMac,
                          customServiceUuid,
                          trainingCommandCharsUuid,
                          [0x01, 0x02, 0x00, 0x05],
                          false,
                        ),
                      );
                }
              }),
            ],
          ),
          DeviceSection(
            iconWidget: RotatedBox(
              quarterTurns: deviceState is DeviceCanConnectState ? 2 : 4,
              child: Icon(
                Icons.double_arrow,
                color: deviceState is DeviceCanConnectState
                    ? Colors.green
                    : Colors.orange,
                size: 70,
              ),
            ),
            title: "LEFT DEVICE",
            description: "Dispositivo non registrato",
            playState: IndicatorIconState.initialIndicatorIconState,
            bleState: deviceState is DeviceConnected
                ? IndicatorIconState.activeIndicatorIconState
                : IndicatorIconState.initialIndicatorIconState,
            chartState: deviceState is DeviceConnected
                ? IndicatorIconState.successIndicatorIconState
                : IndicatorIconState.initialIndicatorIconState,
            updateState: IndicatorIconState.initialIndicatorIconState,
          ),
          AlertSliverCard(
            visible: deviceState is DeviceInitial,
            state: AlertState.warningAlertState,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            elevation: 4,
            text:
                "Dispositivo non registrato. Registra un dispositivo usando il codice pin!",
            icon: Icons.warning_rounded,
          ),
          AlertSliverCard(
            visible: deviceState is DeviceCanConnectState ||
                deviceState is PermissionsDeniedState ||
                deviceState is PermissionsPermanentlyDeniedState ||
                deviceState is DeviceDisconnected,
            state: AlertState.infoAlertState,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            elevation: 4,
            text:
                "Connetti al dispositivo per effeturare download dati e aggiornamenti!",
            icon: Icons.info,
          ),
          AlertSliverCard(
            visible: deviceState is DeviceConnecting,
            state: AlertState.infoAlertState,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            elevation: 4,
            text: "Connesione con il dispositivo in corso...",
            icon: Icons.bluetooth,
          ),
          AlertSliverCard(
            visible: deviceState is DeviceConnected,
            state: AlertState.infoAlertState,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            elevation: 4,
            text: "Dispositivo bluetooth connesso",
            icon: Icons.bluetooth_connected,
          ),
          AlertSliverCard(
            visible: deviceState is DeviceConnectionErrorState,
            state: AlertState.errorAlertState,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            elevation: 4,
            text: "Errore connessione al dispositivo bluetooth!",
            icon: Icons.error,
          ),
          AlertSliverCard(
            visible: deviceState is DeviceConnected,
            state: AlertState.warningAlertState,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            elevation: 4,
            text: "Scarica i dati raccolti dal dispositivo!",
            icon: Icons.bar_chart,
          ),
          const ProgressSliverCard(
            visible: false,
            elevation: 4,
            padding: EdgeInsets.symmetric(horizontal: 10),
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
            child: Text("$deviceState"),
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
              visible: deviceState is DeviceInitial,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  fixedSize: const Size.fromHeight(50),
                ),
                onPressed: () {},
                child: const Text('REGISTRA DISPOSITIVO'),
              ),
            ),

            // CONNECT DEVICE BUTTON
            BlocListener<DeviceBloc, DeviceState>(
              listenWhen: (previous, current) {
                return previous != current &&
                    (deviceState is DeviceDisconnected ||
                        deviceState is DeviceConnecting ||
                        deviceState is DeviceCanConnectState ||
                        deviceState is DeviceConnectionErrorState ||
                        deviceState is PermissionsDeniedState ||
                        deviceState is PermissionsPermanentlyDeniedState);
              },
              listener: (context, state) {
                if (state is PermissionsDeniedState) {
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
                  Future<void> _showMyDialog() async {
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

                  _showMyDialog();
                }
              },
              child: Visibility(
                visible: deviceState is! DeviceConnected,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    fixedSize: const Size.fromHeight(50),
                  ),
                  onPressed: deviceState is DeviceConnecting
                      ? null
                      : () {
                          context.read<DeviceBloc>().add(
                                const ConnectToDevice(
                                  bleMac,
                                  customServiceUuid,
                                  actionsCharsUuid,
                                  password,
                                  true,
                                ),
                              );
                        },
                  child: const Text('CONNETTI AL DISPOSITIVO'),
                ),
              ),
            ),

            // DOWNLOAD DATA BUTTON
            /*Visibility(
              visible: deviceState is DeviceConnected,
              child: BlocListener<DeviceBloc, DeviceState>(
                listenWhen: (context, state) {
                  return state is DeviceConnected;
                },
                listener: (context, state) {},
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        fixedSize: const Size(0, 50),
                      ),
                      onPressed: () {},
                      child: const Text('SCARICA DATI'),
                    );
                  },
                ),
              ),
            ),*/

            Visibility(
              visible: deviceState is DeviceConnected,
              child: BlocListener<BleBloc, BleState>(
                listenWhen: (context, state) {
                  return state is BleDidWriteData || state is BleDidReadData;
                },
                listener: (context, state) {
                  final bleBloc = context.read<BleBloc>();
                  if (state is BleDidWriteData) {
                    bleBloc.add(
                      const BleReadEvent(
                        bleMac,
                        customServiceUuid,
                        trainingDataCharsUuid,
                      ),
                    );
                  } else if (state is BleDidReadData) {
                    final data = state.data;
                    final List<int> newData = [];
                    newData.add(data.first + 1);

                    Future.delayed(
                      const Duration(milliseconds: 200),
                      () async {
                        /*
                        bleBloc.add(
                          BleWriteEvent(
                            bleMac,
                            customServiceUuid,
                            actionsCharsUuid,
                            state.data,
                            false,
                          ),
                        );*/
                        bleBloc.add(
                          BleWriteEvent(
                            bleMac,
                            customServiceUuid,
                            trainingDataCharsUuid,
                            newData,
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
                    final bleBloc = context.read<BleBloc>();

                    // NOTIFICATION ENABLE
                    bleBloc.add(
                      const BleSetNotificationEvent(
                        bleMac,
                        customServiceUuid,
                        trainingDataCharsUuid,
                        true,
                      ),
                    );

                    // CHARACTERISTICS LAST VALUE LISTENER
                    bleBloc.add(
                      const BleLastValueListenerEvent(
                        bleMac,
                        customServiceUuid,
                        trainingDataCharsUuid,
                      ),
                    );

                    // CHARACTERISTICS WRITE VALUE
                    // SEND LAST VALUE REGISTERED
                    // IT CAN BE EMPTY OR WITH DATA
                    /*bleBloc.add(
                          const BleWriteEvent(
                            bleMac,
                            customServiceUuid,
                            actionsCharsUuid,
                        //[],
                        [23, 1, 15, 12, 30, 46],
                            false,
                          ),
                        );*/

                    final List<int> initialCommand = [];
                    for (int i = 0; i < 1; i++) {
                      initialCommand.add(0);
                    }

                    // CHARACTERISTICS WRITE VALUE
                    // SEND LAST VALUE REGISTERED
                    // IT CAN BE EMPTY OR WITH DATA
                    bleBloc.add(
                      BleWriteEvent(
                        bleMac,
                        customServiceUuid,
                        trainingDataCharsUuid,
                        initialCommand,
                        //[23, 1, 15, 12, 30, 46],
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
