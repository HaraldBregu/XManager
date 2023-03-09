import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:xmanager/common.dart';
import 'package:xmanager/main.dart';
import 'package:xmanager/model/data_model.dart';
import 'package:xmanager/views/player/player_detail.dart';


enum PlayerCardOptionMenu { Delete, Edit, Detail }

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    AppLocalizations? localize = AppLocalizations.of(context);
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;
    final TextTheme primaryTextTheme = theme.primaryTextTheme;

    Duration myDuration = const Duration(days: 5);
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
    // Step 7
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    final seconds2 = strDigits(myDuration.inSeconds.remainder(60));

    /// Card of coach
    Widget coachHeader() => Material(
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
              //contentPadding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              title: Text(
                  "Cristian Maldonado",
                  style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900)),
              subtitle: Text("Lorem Ipsum is simply dummy text of the.", style: textTheme.bodyMedium),
              selected: true,

            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SizedBox(
                    height: 25,
                    child: Row(
                      children: [
                        const Icon(Icons.domain, size: 20),
                        const SizedBox(width: 5),
                        Text("www.sports.com", style: textTheme.bodyLarge)
                      ],
                    )
                ),
                const SizedBox(width: 15),
                SizedBox(
                    height: 25,
                    child: Row(
                      children: [
                        const Icon(Icons.location_on_outlined, size: 20),
                        const SizedBox(width: 5),
                        Text("Milano, Italy", style: textTheme.bodyLarge)
                      ],
                    )
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
                height: 25,
                child: Row(
                  children: [
                    const Icon(Icons.email_outlined, size: 20,),
                    const SizedBox(width: 5),
                    Text("harald.bregu@gmail.com", style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w900))
                  ],
                )
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SizedBox(
                    height: 25,
                    child: Row(
                      children: [
                        const Icon(Icons.workspace_premium, size: 20),
                        const SizedBox(width: 5),
                        Text("ProUEFA", style: textTheme.bodyLarge)
                      ],
                    )
                ),
                const SizedBox(width: 15),
                SizedBox(
                    height: 25,
                    child: Row(
                      children: [
                        const Icon(Icons.star_border_outlined, size: 20),
                        const SizedBox(width: 5),
                        Text("24 Stars", style: textTheme.bodyLarge)
                      ],
                    )
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );

    Widget trainingSectionCard() => Material(
        type: MaterialType.canvas,
        elevation: 1,
        surfaceTintColor: colorScheme.surfaceTint,
        shadowColor: colorScheme.shadow,
        child: Column(
          children: [
            ListTile(
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
              onTap: () => Navigator.pushNamed(context, RouteNames.programList),
            )
          ],
        )
    );

    /// Card of training session program
    Widget trainingCard() => Material(
      type: MaterialType.canvas,
      elevation: 1,
      surfaceTintColor: colorScheme.surfaceTint,
      shadowColor: colorScheme.shadow,
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            title: Text('PROGRAMMA', style: textTheme.labelSmall),
            subtitle: Text(
                "Allenamento da brividi",
                style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700)
            ),
            selected: true
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 10,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: TweenAnimationBuilder(
                      tween: Tween(begin: 0.0, end: 1.0),
                      duration: const Duration(seconds: 10),
                      builder: (context, value, _) {
                        return LinearProgressIndicator(value: value);
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("IN ESECUZIONE", style: textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w400)),
                    const SizedBox(width: 20),
                    Text('$hours:$minutes:$seconds', style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );

    /// Cards of players
    Widget playersCard() => StreamBuilder<List<Player>>(
        key: UniqueKey(),
        stream: objectBox.getPlayers(),
        builder: (context, snapshot) {
          return SliverList(delegate: SliverChildBuilderDelegate(((BuildContext context, int index) {
            if (snapshot.data == null || snapshot.data?.isEmpty == true) {
              return const SizedBox(height: 0);
            }

            Player player = snapshot.data![index];

            var playerFullname = player.fullname;
            var fullnameStyle = textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700);
            var playerRole = player.role?.toUpperCase() ?? "-";
            var roleStyle = textTheme.labelMedium;

            return Material(
              type: MaterialType.canvas,
              elevation: 1,
              surfaceTintColor: colorScheme.surfaceTint,
              shadowColor: colorScheme.shadow,
              child: ListTile(
                title: Text(playerFullname, style: fullnameStyle),
                subtitle: Text(playerRole, style: roleStyle),
                /*trailing: SizedBox(
                  height: 30,
                  width: 30,
                  child: PopupMenuButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.menu),
                    onSelected: (item) {
                      switch (item) {
                        case PlayerCardOptionMenu.Delete:
                          objectBox.playerBox.remove(
                              player.id);
                          break;
                        case PlayerCardOptionMenu.Edit:
                          Navigator.pushNamed(
                              context,
                              RouteNames.playerEdit,
                              arguments: player);
                          break;
                        case PlayerCardOptionMenu.Detail:
                          break;
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<PlayerCardOptionMenu>>[
                      const PopupMenuItem<
                          PlayerCardOptionMenu>(
                        value: PlayerCardOptionMenu.Detail,
                        child: Text('Show Data'),
                      ),
                      const PopupMenuItem<
                          PlayerCardOptionMenu>(
                        value: PlayerCardOptionMenu.Edit,
                        child: Text('Edit'),
                      ),
                      const PopupMenuItem<
                          PlayerCardOptionMenu>(
                        value: PlayerCardOptionMenu.Delete,
                        child: Text('Delete'),
                      ),
                    ],
                  ),
                ),*/
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlayerDetail(player: player)),
                  );
                },
              ),
            );


            return Card(
              elevation: 4,
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, RouteNames.playerDetail, arguments: player),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text(
                                  player.role?.toUpperCase() ?? "-",
                                  style: textTheme.titleSmall)),
                          const Expanded(child: SizedBox(
                              width: double.infinity)),
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: PopupMenuButton(
                              padding: EdgeInsets.zero,
                              icon: const Icon(Icons.menu),
                              onSelected: (item) {
                                switch (item) {
                                  case PlayerCardOptionMenu.Delete:
                                    objectBox.playerBox.remove(
                                        player.id);
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
                              itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<PlayerCardOptionMenu>>[
                                const PopupMenuItem<
                                    PlayerCardOptionMenu>(
                                  value: PlayerCardOptionMenu.Detail,
                                  child: Text('Show Data'),
                                ),
                                const PopupMenuItem<
                                    PlayerCardOptionMenu>(
                                  value: PlayerCardOptionMenu.Edit,
                                  child: Text('Edit'),
                                ),
                                const PopupMenuItem<
                                    PlayerCardOptionMenu>(
                                  value: PlayerCardOptionMenu.Delete,
                                  child: Text('Delete'),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final hasVibrator = await Vibration
                                  .hasVibrator() ?? false;
                              if (hasVibrator) {
                                Vibration.vibrate();
                              }
                            },
                            child: const SizedBox(
                              height: 30,
                              width: 30,
                              child: Icon(Icons.bar_chart),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const SizedBox(
                              height: 30,
                              width: 30,
                              child: Icon(Icons.watch_later_rounded),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  player.fullname,
                                  style: textTheme.titleLarge
                                      ?.copyWith(
                                      fontWeight: FontWeight.w500)
                              )
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                    ],
                  ),
                ),
              ),
            );

            return Material(
              type: MaterialType.canvas,
              elevation: 1,
              surfaceTintColor: colorScheme.surfaceTint,
              shadowColor: colorScheme.shadow,
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, RouteNames.playerDetail, arguments: player),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text(
                                  player.role?.toUpperCase() ?? "-",
                                  style: textTheme.titleSmall)),
                          const Expanded(child: SizedBox(
                              width: double.infinity)),
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: PopupMenuButton(
                              padding: EdgeInsets.zero,
                              icon: const Icon(Icons.menu),
                              onSelected: (item) {
                                switch (item) {
                                  case PlayerCardOptionMenu.Delete:
                                    objectBox.playerBox.remove(
                                        player.id);
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
                              itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<PlayerCardOptionMenu>>[
                                const PopupMenuItem<
                                    PlayerCardOptionMenu>(
                                  value: PlayerCardOptionMenu.Detail,
                                  child: Text('Show Data'),
                                ),
                                const PopupMenuItem<
                                    PlayerCardOptionMenu>(
                                  value: PlayerCardOptionMenu.Edit,
                                  child: Text('Edit'),
                                ),
                                const PopupMenuItem<
                                    PlayerCardOptionMenu>(
                                  value: PlayerCardOptionMenu.Delete,
                                  child: Text('Delete'),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final hasVibrator = await Vibration
                                  .hasVibrator() ?? false;
                              if (hasVibrator) {
                                Vibration.vibrate();
                              }
                            },
                            child: const SizedBox(
                              height: 30,
                              width: 30,
                              child: Icon(Icons.bar_chart),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const SizedBox(
                              height: 30,
                              width: 30,
                              child: Icon(Icons.watch_later_rounded),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  player.fullname,
                                  style: textTheme.titleLarge
                                      ?.copyWith(
                                      fontWeight: FontWeight.w500)
                              )
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                    ],
                  ),
                ),
              ),
            );
          }
          ),
              childCount: snapshot.hasData ? snapshot.data!.length : 0),
          );
        });

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: coachHeader()),
        const SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverToBoxAdapter(child: trainingSectionCard()),
        const SliverToBoxAdapter(child: SizedBox(height: 10)),

        SliverToBoxAdapter(child: trainingCard()),
        //SliverToBoxAdapter(child: WeatherCard()),
        SliverToBoxAdapter(child: Column(
          children: [
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Players',
                style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 20),
          ],
        )),
        playersCard(),
        const SliverToBoxAdapter(child: SizedBox(height: 90)),

      ],
    );
  }
}


