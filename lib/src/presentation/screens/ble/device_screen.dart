import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:xmanager/src/core/domain/usecases/ble_usecases.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/presentation/bloc/app_bloc.dart';
import 'package:xmanager/src/presentation/bloc/bloc.dart';
import 'package:xmanager/src/presentation/widgets/alert_card.dart';
import 'package:xmanager/src/presentation/widgets/indicator_icon.dart';
import 'package:xmanager/src/presentation/widgets/progress_card.dart';


const String bleMac = "E7:C8:DF:65:5B:4B";
const String trainingServiceUuid = "00001600-1212-efde-1523-785feabcd121";
const String trainingCommandCharsUuid = "00001601-1212-efde-1523-785feabcd121";
const String trainingDataCharsUuid = "00001602-1212-efde-1523-785feabcd121";

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                ];
              }, onSelected: (value) {
                if (value == 0) {
                  print("My account menu is selected.");
                } else if (value == 1) {
                  print("Settings menu is selected.");
                } else if (value == 2) {
                  print("Logout menu is selected.");
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
          const AlertSliverCard(
            visible: false,
            state: AlertState.errorAlertState,
            padding: EdgeInsets.symmetric(horizontal: 10),
            elevation: 4,
            text: "Errore caricamento dati!",
            icon: Icons.error,
          ),
          const AlertSliverCard(
            visible: false,
            state: AlertState.warningAlertState,
            padding: EdgeInsets.symmetric(horizontal: 10),
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
            child: Text('$bleState'),
          ),
          // SliverToBoxAdapter(
          //   child: Text('$serviceUuid'),
          // ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Bluetooth scan permission"),
                if (context.watch<AppBloc>().state.bluetoothScanGranted)
                  const Text("GRANTED")
                else
                  const Text("NOT GRANTED"),
              ],
            ),
          ),

          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Location permission"),
                if (context.watch<AppBloc>().state.locationGranted)
                  const Text("GRANTED")
                else
                  const Text("NOT GRANTED"),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Bluetooth connect permission"),
                if (context.watch<AppBloc>().state.bluetoothConnectGranted)
                  const Text("GRANTED")
                else
                  const Text("NOT GRANTED"),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Bluetooth permission"),
                if (context.watch<AppBloc>().state.bluetoothGranted)
                  const Text("GRANTED")
                else
                  const Text("NOT GRANTED"),
              ],
            ),
          ),

        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OutlinedButton(
              style: FilledButton.styleFrom(
                fixedSize: const Size(150, 50),
              ),
              onPressed: () {
                BlocProvider.of<BleBloc>(context)
                    .add(const ConnectDevice(bleMac));
              },
              child: const Text('CONNECT TO DEVICE'),
            ),
            OutlinedButton(
              style: FilledButton.styleFrom(
                fixedSize: const Size(150, 50),
              ),
              onPressed: () => BlocProvider.of<BleBloc>(context)
                  .add(const DisconnectDevice(bleMac)),
              child: const Text('DISCONNECT TO DEVICE'),
            ),
            /*
            OutlinedButton(
              style: FilledButton.styleFrom(
                fixedSize: const Size(150, 50),
              ),
              onPressed: () {
                BlocProvider.of<BleBloc>(context)
                    .add(const StartScanning(seconds: 10));

                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 400,
                      child: ListView.builder(
                        itemCount:
                            context.watch<BleBloc>().state.devices.length,
                        itemBuilder: (context, index) {
                          final device =
                              context.watch<BleBloc>().state.devices[index];
                          return ListTile(
                            title: Text(device.name),
                            subtitle: Text(device.uuid),
                            onTap: () {
                              // context
                              //     .read<BleBloc>()
                              //     .add(SelectServiceUuid(service.serviceUuid));
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              
              },
              child: const Text('SCAN DEVICES'),
            ),
            */
            OutlinedButton(
              style: FilledButton.styleFrom(
                fixedSize: const Size(150, 50),
              ),
              onPressed: () => context.read<BleBloc>().add(
                    const BleWriteEvent(
                      bleMac,
                      trainingServiceUuid,
                      trainingCommandCharsUuid,
                      [0x01, 0x02, 0x00, 0x05],
                    ),
                  ),
              child: const Text('START ANIMATION'),
            ),
            OutlinedButton(
              style: FilledButton.styleFrom(
                fixedSize: const Size(150, 50),
              ),
              onPressed: () => context.read<BleBloc>().add(
                    const BleWriteEvent(
                      bleMac,
                      trainingServiceUuid,
                      trainingDataCharsUuid,
                      [0, 0, 0, 0, 202, 233, 67, 252],
                    ),
                  ),
              child: const Text('WRITE DATA'),
            ),

          ],
        ),
      ),
    );
  }
}
