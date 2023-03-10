import 'package:flutter/material.dart';
import 'package:xmanager/app.dart';
import 'package:xmanager/data/models/models.dart';
import 'package:xmanager/main.dart';
import 'package:xmanager/presentation/pages/player/player_detail.dart';
import 'package:xmanager/presentation/widgets/xmaterial_card.dart';
import 'package:xmanager/presentation/widgets/xmaterial_coach_card.dart';
import 'package:xmanager/presentation/widgets/xmaterial_item_card.dart';

import '../../core/constants/common.dart';


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

    final GlobalKey _scaffoldKey = GlobalKey();
    
    Duration myDuration = const Duration(days: 5);
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
    // Step 7
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    final seconds2 = strDigits(myDuration.inSeconds.remainder(60));

    Widget coachHeader() => XMaterialCoachCard("Cristiano Ronaldo", description: "Programmi di allenamento, Programmi di allenamento");

    Widget trainingSectionCard() => XMaterialItemCard(
      title: 'Programmi di allenamento',
      icon: Icons.developer_board_outlined,
      onTap: () => Navigator.pushNamed(context, RouteNames.programList),
    );

    Widget trainingCard() => XMaterialCard(
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

    Widget playersCard() => StreamBuilder<List<Player>>(
        key: UniqueKey(),
        stream: objectBox.getPlayers(),
        builder: (context, snapshot) {
          return SliverList(delegate: SliverChildBuilderDelegate(
              childCount: snapshot.hasData ? snapshot.data!.length : 0,
              (BuildContext context, int index) {
                if (snapshot.data == null || snapshot.data?.isEmpty == true) {
                  return const SizedBox(height: 0);
                }

                Player player = snapshot.data![index];

                var playerFullname = player.fullname;
                var fullnameStyle = textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700);
                var playerRole = player.role?.toUpperCase() ?? "-";
                var roleStyle = textTheme.labelMedium;

                return XMaterialCard(
                  child: ListTile(
                    title: Text(playerFullname, style: fullnameStyle),
                    subtitle: Text(playerRole, style: roleStyle),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PlayerDetail(player: player)),
                      );
                    },
                  ),
                );
              }),
          );
        });

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: colorScheme.surfaceVariant,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        title: Text(localize?.dashboard ?? ""),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () => Navigator.pushNamed(context, RouteNames.account),
          ),
          IconButton(
            icon: Icon(Icons.widgets),
            onPressed: () => Navigator.pushNamed(context, RouteNames.account),
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, RouteNames.account),
          ),
        ],
      ),
      //drawer: const DrawerLayout(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: coachHeader()),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(child: trainingSectionCard()),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(child: trainingCard()),
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
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.green,
        icon: const Icon(Icons.play_circle),
        label: const Text('AVVIA PROGRAMMA'),
      ),

    );
  }
}


