import 'package:flutter/material.dart';
import 'package:xmanager/models/models.dart';
import 'package:xmanager/main.dart';
import 'package:xmanager/screens/shared/player_card.dart';
import 'package:xmanager/common.dart';

class PlayerCardSection extends StatefulWidget {
  const PlayerCardSection({Key? key}) : super(key: key);

  @override
  State<PlayerCardSection> createState() => _PlayerCardSectionState();
}

class _PlayerCardSectionState extends State<PlayerCardSection> {
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<List<Player>>(
        key: UniqueKey(),
        stream: objectBox.getPlayers(),
        builder: (context, snapshot) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
                ((BuildContext context, int index) {

                  if (snapshot.data == null || snapshot.data?.isEmpty == true) {
                    return SizedBox(height: 0);
                  }

                  Player player = snapshot.data![index];

                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context,
                          'player_detail', arguments: player);
                    },
                    child: PlayerCard(
                      title: player.role ?? AppLocalizations.of(context)!.player.toUpperCase(),
                      name: player.name ?? "-",
                      onOptionSelected: (option) {
                        switch (option)  {
                          case PlayerCardOptionMenu.Delete:
                            objectBox.playerBox.remove(player.id);
                            break;
                          case PlayerCardOptionMenu.Edit:
                            Navigator.pushNamed(
                                context,
                                'player_edit',
                                arguments: player);
                            break;
                          case PlayerCardOptionMenu.Detail:
                            break;
                        }
                      },
                    ),
                  );
                }),
                childCount: snapshot.hasData ? snapshot.data!.length : 0),
          );
        });
  }
}
