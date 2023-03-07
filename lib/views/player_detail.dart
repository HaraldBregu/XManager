import 'package:flutter/material.dart';
import 'package:xmanager/common.dart';
import 'package:xmanager/main.dart';
import 'package:xmanager/model/data_model.dart';

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
      ),
      body: ListView(
          children: <Widget>[
            Material(
              type: MaterialType.canvas,
              elevation: 1,
              surfaceTintColor: colorScheme.surfaceTint,
              shadowColor: colorScheme.shadow,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                          player.fullname ?? "-",
                          style: textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w900)),
                      //subtitle: Text("Lorem Ipsum is simply dummy text of the.", style: textTheme.bodyMedium),
                      selected: true,
                      trailing: IconButton(
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
                                Text(player?.role ?? "-", style: textTheme.bodyLarge)
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
                                Text(player?.nationality ?? "-", style: textTheme.bodyLarge)
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
                                Text(player?.weight.toString() ?? "-", style: textTheme.bodyLarge)
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
                                Text(player?.height.toString() ?? "-", style: textTheme.bodyLarge)
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
            Material(
              type: MaterialType.canvas,
              elevation: 1,
              surfaceTintColor: colorScheme.surfaceTint,
              shadowColor: colorScheme.shadow,
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
                title: Text('Programmi di allenamento', style: textTheme.titleMedium),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16,),
                selected: true,
                onTap: () => Navigator.pushNamed(context, RouteNames.programCreate),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                    child: Material(
                      type: MaterialType.canvas,
                      elevation: 1,
                      surfaceTintColor: colorScheme.surfaceTint,
                      shadowColor: colorScheme.shadow,
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
                    child: Material(
                      type: MaterialType.canvas,
                      elevation: 1,
                      surfaceTintColor: colorScheme.surfaceTint,
                      shadowColor: colorScheme.shadow,
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
