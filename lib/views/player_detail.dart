import 'package:flutter/material.dart';
import 'package:xmanager/common.dart';
import 'package:xmanager/main.dart';
import 'package:xmanager/model/player_model.dart';

class PlayerDetail extends StatefulWidget {
  const PlayerDetail({Key? key}) : super(key: key);

  @override
  State<PlayerDetail> createState() => _PlayerDetailState();
}

class _PlayerDetailState extends State<PlayerDetail> {

  @override
  Widget build(BuildContext context) {
    AppLocalizations? localize = AppLocalizations.of(context);
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    Object? object = ModalRoute.of(context)?.settings.arguments;
    Player? player = object as Player?;
    player ??= Player();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Player data"),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.playerEdit, arguments: player).then((updatedPlayer) => {
                    setState(() {
                      if (updatedPlayer != null) {
                        player = updatedPlayer as Player;
                      }
                    })
                  });
                },
              )
          ),
        ],
      ),
      body: ListView(
          children: <Widget>[
            Material(
              type: MaterialType.canvas,
              elevation: 1,
              surfaceTintColor: colorScheme.surfaceTint,
              shadowColor: colorScheme.shadow,
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(player?.fullname ?? "-", style: textTheme.headlineLarge)
                    ),
                    const SizedBox(height: 10),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("ITA - CENTROCAMPISTA", style: textTheme.titleMedium)
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text("ETA: 34 Anni", style: textTheme.bodyMedium),
                        Text((player?.birthdate.toString() ?? ""), style: textTheme.bodyMedium),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("PESO: ${(player?.weight ?? "")}", style: textTheme.bodyMedium),
                          Text("Altezza: ${(player?.height ?? "")}", style: textTheme.bodyMedium)
                        ]
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                        children: [
                          const CircleAvatar(child: const Icon(Icons.train)),
                          const SizedBox(width: 10),
                          Text("Ore totali di training", style: textTheme.bodyLarge)
                        ]
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                        children: [
                          const CircleAvatar(child: const Icon(Icons.train)),
                          const SizedBox(width: 10),
                          Text("Ore totali di training", style: textTheme.bodyLarge)
                        ]
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: Card(
                      elevation: 6,
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Row(
                                children: [
                                  const CircleAvatar(child: const Icon(Icons.train)),
                                  const SizedBox(width: 10),
                                  Text("Ore", style: textTheme.bodyLarge)
                                ]
                            )
                          ],
                        ),
                      ),
                    )),
                const SizedBox(width: 10),
                Expanded(
                    child: Card(
                      elevation: 6,
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Row(
                                children: [
                                  const CircleAvatar(child: const Icon(Icons.train)),
                                  const SizedBox(width: 10),
                                  Text("Ore totali", style: textTheme.bodyLarge)
                                ]
                            )
                          ],
                        ),
                      ),
                    )),
              ],
            )
          ]),
    );
  }
}
