import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/presentation/widgets/alert_card.dart';
import 'package:xmanager/src/presentation/widgets/progress_card.dart';

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              "Device",
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
            pinned: true,
            //centerTitle: true,
            actions: [],
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
                              Icon(
                                Icons.bluetooth,
                                size: 25,
                                color: context.colorScheme.primary,
                              ),
                              const SizedBox(width: 5),
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
            state: AlertState.infoAlertState,
            padding: EdgeInsets.symmetric(horizontal: 10),
            elevation: 4,
            text:
                "Connetti al dispositivo per effeturare download dati e aggiornamenti!",
            icon: Icons.error,
          ),
          const AlertSliverCard(
            state: AlertState.errorAlertState,
            padding: EdgeInsets.symmetric(horizontal: 10),
            elevation: 4,
            text: "Errore caricamento dati!",
            icon: Icons.error,
          ),
          const AlertSliverCard(
            state: AlertState.successAlertState,
            padding: EdgeInsets.symmetric(horizontal: 10),
            elevation: 4,
            text: "Scarica i dati raccolti dal dispositivo!",
            icon: Icons.bar_chart,
          ),
          const ProgressSliverCard(
            elevation: 4,
            padding: EdgeInsets.symmetric(horizontal: 10),
            state: ProgresState.successProgressState,
            text: "Download dati in corso",
            percentValue: 10,
          ),
          const AlertSliverCard(
            state: AlertState.warningAlertState,
            padding: EdgeInsets.symmetric(horizontal: 10),
            elevation: 4,
            text:
                "Una nuova versione firmware è disponibile per questo dispositivo. Aggiorna ora!",
            icon: Icons.update,
          ),
          const ProgressSliverCard(
            elevation: 4,
            padding: EdgeInsets.symmetric(horizontal: 10),
            state: ProgresState.warningProgressState,
            text: "Aggiornamento in corso",
            percentValue: 45,
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /*
            FilledButton.tonal(
              onPressed: () {},
              style: FilledButton.styleFrom(fixedSize: const Size(150, 50)),
              child: Text(
                'REGISTRA DISPOSITIVO',
                style: TextStyle(
                  fontSize: context.textTheme.labelLarge?.fontSize,
                  fontFamily: context.textTheme.labelLarge?.fontFamily,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 15),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: context.colorScheme.primaryContainer,
                fixedSize: const Size(150, 50),
              ),
              onPressed: () {},
              child: const Text('REGISTRA DISPOSITIVO'),
            ),
            const SizedBox(height: 15),
            */
            OutlinedButton(
              style: FilledButton.styleFrom(
                fixedSize: const Size(150, 50),
              ),
              onPressed: () {},
              child: const Text('CONNECT TO DEVICE'),
            ),
          ],
        ),
      ),
    );
  }
}
