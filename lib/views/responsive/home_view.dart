import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:xmanager/common.dart';
import 'package:xmanager/main.dart';
import 'package:xmanager/model/player_model.dart';

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
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        title: Text("Cristian Maldonado", style: textTheme.titleLarge),
        subtitle: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.", style: textTheme.bodySmall),
        selected: true,
        trailing: IconButton(
          icon: const Icon(Icons.bar_chart),
          onPressed: () {},
        ),
      ),
    );

    /// Card of training session program
    Widget trainingCard() => Material(
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
              title: Text("Cristian Maldonado", style: textTheme.titleLarge),
              subtitle: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.", style: textTheme.bodySmall),
              selected: true,
              trailing: IconButton(
                icon: const Icon(Icons.bar_chart),
                onPressed: () => {},
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('PROGRAMMA DI ALLENAMENTO', style: textTheme.titleMedium),
              subtitle: Text("Crea e gestisci il tuo programma di allenamento", style: textTheme.bodySmall),
              trailing: OutlinedButton.icon(
                  onPressed: () async {
                    Navigator.of(context).pushNamed(RouteNames.programCreate);

                    final hasVibrator = await Vibration
                        .hasVibrator() ?? false;
                    if (hasVibrator) {
                      Vibration.vibrate();
                    }
                  },
                  icon: Icon(Icons.add),
                  label: Text("CREA")),
              selected: true,
            ),
            const SizedBox(height: 25),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("PROGRAMMA", style: textTheme.labelSmall),
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: 30,
                  child: Text(
                      "Allenamento con l'esterno sinistro",
                      style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600)
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: SizedBox(
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
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //IconButton(icon: const Icon(Icons.bar_chart), onPressed: () {}),
                    //Text("STATISTICHE", style: textTheme.bodyLarge),
                    ElevatedButton.icon(
                        onPressed: (){},
                        icon: Icon(Icons.bar_chart),
                        label: Text("")),
                    /*OutlinedButton.icon(
                        onPressed: () async {
                          final hasVibrator = await Vibration
                              .hasVibrator() ?? false;
                          if (hasVibrator) {
                            Vibration.vibrate();
                          }
                        },
                        icon: Icon(Icons.bar_chart),
                        label: Text("STATISTICHE")),*/
                  ],
                ),
                Container(
                  alignment: Alignment.centerRight,
                  height: 40,
                  child: Text(
                      '$hours:$minutes:$seconds',
                      style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600)
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
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
            var fullnameStyle = textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500);
            var playerRole = player.role?.toUpperCase() ?? "-";
            var roleStyle = textTheme.labelMedium;

            return Card(
              elevation: 4,
              child: ListTile(
                title: Text(playerFullname, style: fullnameStyle),
                subtitle: Text(playerRole, style: roleStyle),
                trailing: SizedBox(
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
                onTap: () => Navigator.pushNamed(context, RouteNames.playerDetail, arguments: player),
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
        //SliverToBoxAdapter(child: coachHeader()),
        //SliverToBoxAdapter(child: SizedBox(height: 20)),

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
      ],
    );
  }
}


