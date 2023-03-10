import 'package:flutter/material.dart';
import 'package:xmanager/app.dart';
import 'package:xmanager/data/models/models.dart';
import 'package:xmanager/main.dart';
import 'package:xmanager/presentation/pages/player/player_edit.dart';
import 'package:xmanager/presentation/widgets/xmaterial_card.dart';
import 'package:xmanager/presentation/widgets/xmaterial_item_card.dart';

import '../../../core/constants/common.dart';


enum PlayerDetailMenuItem {
  delete,
  edit
}

class PlayerDetail extends StatefulWidget {
  const PlayerDetail({Key? key, required this.player}) : super(key: key);

  final Player? player;

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
    Player player = widget.player ?? Player();

    Widget trainingSectionCard() => XMaterialItemCard(
      title: 'Programmi di allenamento',
      icon: Icons.developer_board_outlined,
      onTap: () => Navigator.pushNamed(context, RouteNames.programCreate),
    );

    return Scaffold(
      backgroundColor: colorScheme.surfaceVariant,
      appBar: AppBar(
        title: Text(localize?.player_detail_title ?? "-"),
        actions: [
          PopupMenuButton(
              onSelected: (value) {
                  switch (value) {
                    case PlayerDetailMenuItem.edit:
                      break;
                    case PlayerDetailMenuItem.delete:

                      var idToDelete = player.id ?? 0;
                      objectBox.playerBox.remove(idToDelete);
                      Navigator.pop(context);
                      break;
                  }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                    value: PlayerDetailMenuItem.edit,
                    child: Text("Edit")),
                PopupMenuItem(
                    value: PlayerDetailMenuItem.delete,
                    child: Text("Delete")),
              ])
        ],
      ),
      body: ListView(
          children: <Widget>[
            XMaterialCard(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                          player.fullname,
                          style: textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w900)),
                      selected: true,
                      trailing: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {

                          final editPlayer = PlayerEdit(player: player, updated: (value) {
                            setState(() {
                              player = value;
                            });
                          },);

                          final materialRoute = MaterialPageRoute(builder: (context) => editPlayer);

                          Navigator.push(context, materialRoute);
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        SizedBox(
                            height: 25,
                            child: Row(
                              children: [
                                const Icon(Icons.sports_soccer, size: 20),
                                const SizedBox(width: 5),
                                Text(player.role ?? "-", style: textTheme.bodyLarge)
                              ],
                            )
                        ),
                        const SizedBox(width: 15),
                        SizedBox(
                            height: 25,
                            child: Row(
                              children: [
                                const Icon(Icons.flag_outlined, size: 20),
                                const SizedBox(width: 5),
                                Text(player.nationality ?? "-", style: textTheme.bodyLarge)
                              ],
                            )
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        SizedBox(
                            height: 25,
                            child: Row(
                              children: [
                                const Icon(Icons.monitor_weight_outlined, size: 20),
                                const SizedBox(width: 5),
                                Text(player.weight.toString(), style: textTheme.bodyLarge)
                              ],
                            )
                        ),
                        const SizedBox(width: 15),
                        SizedBox(
                            height: 25,
                            child: Row(
                              children: [
                                const Icon(Icons.height_outlined, size: 20),
                                const SizedBox(width: 5),
                                Text(player.height.toString(), style: textTheme.bodyLarge)
                              ],
                            )
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            trainingSectionCard(),

            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                    child: XMaterialCard(
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),//or 15.0
                          child: Container(
                            height: 35.0,
                            width: 35.0,
                            color: colorScheme.tertiaryContainer,
                            child: Icon(Icons.developer_board_outlined, color:colorScheme.onTertiaryContainer , size: 20.0),
                          ),
                        ),
                        title: Text('Hour', style: textTheme.titleMedium),
                        //trailing: const Icon(Icons.arrow_forward_ios, size: 16,),
                        selected: true,
                        //onTap: () => Navigator.pushNamed(context, RouteNames.programCreate),
                      ),
                    )
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: XMaterialCard(
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),//or 15.0
                          child: Container(
                            height: 35.0,
                            width: 35.0,
                            color: colorScheme.tertiaryContainer,
                            child: Icon(Icons.developer_board_outlined, color:colorScheme.onTertiaryContainer , size: 20.0),
                          ),
                        ),
                        title: Text('Month', style: textTheme.titleMedium),
                        //trailing: const Icon(Icons.arrow_forward_ios, size: 16,),
                        selected: true,
                        //onTap: () => Navigator.pushNamed(context, RouteNames.programCreate),
                      ),
                    )),
              ],
            ),
            const SizedBox(height: 10),
          ]),
    );
  }
}
