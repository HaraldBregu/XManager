import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/main.dart';
import 'package:xmanager/src/app.dart';
import 'package:xmanager/src/core/common.dart';
import 'package:xmanager/src/core/datamodel/datamodels.dart';
import 'package:xmanager/src/core/widgets/widget.dart';
import 'package:xmanager/src/features/dashboard/data/datasources/local/dashboard_datasource.dart';
import 'package:xmanager/src/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:xmanager/src/features/dashboard/domain/usecases/get_dashboard_training.dart';
import 'package:xmanager/src/features/dashboard/presentation/bloc/bloc.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? localize = AppLocalizations.of(context);
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;

    Widget coachHeader() => const XMaterialCoachCard(
        "Cristiano Ronaldo 2",
        description: "Programmi di allenamento, Programmi di allenamento",);

    Widget trainingSectionCard() => XMaterialItemCard(
      title: 'Programmi di allenamento',
      icon: Icons.developer_board_outlined,
      onTap: () => Navigator.pushNamed(context, RouteNames.programList),
    );

    Widget trainingCard() => XMaterialCard(
      child: Column(
        children: [
          ListTile(
              contentPadding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
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
                    Text('Test', style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)
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

                final Player player = snapshot.data![index];

                final playerFullname = player.fullname;
                final fullnameStyle = textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700);
                final playerRole = player.role?.toUpperCase() ?? "-";
                final roleStyle = textTheme.labelMedium;

                return XMaterialCard(
                  child: ListTile(
                    title: Text(playerFullname, style: fullnameStyle),
                    subtitle: Text(playerRole, style: roleStyle),
                    onTap: () {
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => PlayerDataView(player: player),),);
                      /*
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PlayerDetail(player: player)),
                      );*/
                    },
                  ),
                );
              }),
          );
        });

    Widget scrollViewWidget() => CustomScrollView(
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
    );

/*
RepositoryProvider(
        create: (context) => DashboardRepositoryImpl(
            localDataSource: DashboardLocalDataSourceImpl(),),
        child: BlocProvider(
            create: (create) => DashboardBloc(),
            child: BlocBuilder(
              //bloc: BlocProvider.of<DashboardBloc>(context),
              builder: (context, state) {
                return Center(child: Text("text",),);
              },
            ),
        ),
      ),
**/
    return Scaffold(
      backgroundColor: colorScheme.surfaceVariant,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        title: Text(localize?.dashboard ?? ""),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () => Navigator.pushNamed(context, RouteNames.account),
          ),
          IconButton(
            icon: const Icon(Icons.widgets),
            onPressed: () {
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, RouteNames.account),
          ),
        ],
      ),
      body: Placeholder(),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {

          //var objectEncoded = jsonEncode(objectBox.playerBox.getAll().first);
          var objectEncoded = jsonDecode(objectBox.playerBox.getAll().first.toString());

          print(objectEncoded);

        },
        backgroundColor: Colors.green,
        icon: const Icon(Icons.play_circle),
        label: const Text('AVVIA PROGRAMMA'),
      ),
    );
  }
}
