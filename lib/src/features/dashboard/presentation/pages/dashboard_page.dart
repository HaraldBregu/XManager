import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/main.dart';
import 'package:xmanager/src/app.dart';
import 'package:xmanager/src/core/databases/preferences.dart';
import 'package:xmanager/src/core/models/models.dart';
import 'package:xmanager/src/core/utils/localizations_extension.dart';
import 'package:xmanager/src/core/utils/theme_extension.dart';
import 'package:xmanager/src/core/widgets/widget.dart';
import 'package:xmanager/src/features/dashboard/data/datasources/local/dashboard_datasource.dart';
import 'package:xmanager/src/features/dashboard/data/models/dashboard_player_model.dart';
import 'package:xmanager/src/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_player_entity.dart';
import 'package:xmanager/src/features/dashboard/domain/usecases/get_dashboard_players.dart';
import 'package:xmanager/src/features/dashboard/domain/usecases/get_dashboard_profile.dart';
import 'package:xmanager/src/features/dashboard/domain/usecases/get_dashboard_training.dart';
import 'package:xmanager/src/features/dashboard/presentation/bloc/bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardBloc = DashboardBloc(
      GetDashboardProfileImpl(
        DashboardRepositoryImpl(
          const DashboardDataSourceImpl(),
        ),
      ),
      GetDashboardTrainingImpl(
        DashboardRepositoryImpl(
          const DashboardDataSourceImpl(),
        ),
      ),
      GetDashboardPlayersImpl(
        DashboardRepositoryImpl(
          const DashboardDataSourceImpl(),
        ),
      ),
    );

    return BlocProvider(
      create: (context) => dashboardBloc..add(DashboardEventStart()),
      child: Scaffold(
        backgroundColor: context.colorScheme.surfaceVariant,
        appBar: AppBar(
          backgroundColor: context.colorScheme.surface,
          title: Text(context.loc.dashboard),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.account_circle,
              ),
              onPressed: () => Navigator.pushNamed(
                context,
                RouteNames.account,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.settings,
              ),
              onPressed: () => Navigator.pushNamed(
                context,
                RouteNames.account,
              ),
            ),
          ],
        ),
        body: const _DashboardPageBody(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            //context.read<DashboardBloc>().add(DashboardEventTest());

            Preferences.saveAccount(
              const Account(
                fullname: "Harald Bregu",
              ),
            );

            //final currentAccount = await Preferences.currentAccount();
            //print(currentAccount.fullname);

            /*final json = objectBox.playerBox.getAll().first.toJson();
            final objecjson = DashboardPlayerModel.fromJson(json);
            print(objecjson.fullname);
            */
          },
          backgroundColor: Colors.green,
          icon: const Icon(Icons.play_circle),
          label: const Text('AVVIA PROGRAMMA'),
        ),
      ),
    );
  }
}

class _DashboardPageBody extends StatelessWidget {
  const _DashboardPageBody();

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        _DashboardPageProfileSection(),
        _DashboardPageTrainingSection(),
        _DashboardPagePlayerHeaderSection(),
        _DashboardPagePlayerSection(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 120,
          ),
        ),
      ],
    );
  }
}

class _DashboardPageProfileSection extends StatelessWidget {
  const _DashboardPageProfileSection();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: const [
          XMaterialCoachCard(
            "Cristiano Ronaldo 2",
            description: "Programmi di allenamento, Programmi di allenamento",
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _DashboardPageTrainingSection extends StatelessWidget {
  const _DashboardPageTrainingSection();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          XMaterialItemCard(
            title: 'Programmi di allenamento',
            icon: Icons.developer_board_outlined,
            onTap: () => Navigator.pushNamed(context, RouteNames.programList),
          ),
          const SizedBox(height: 20),
          XMaterialCard(
            child: Column(
              children: [
                ListTile(
                    contentPadding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    title: Text(
                      'PROGRAMMA',
                      style: context.textTheme.labelSmall,
                    ),
                    subtitle: Text(
                      "Allenamento da brividi",
                      style: context.textTheme.titleSmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    selected: true),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 10,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
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
                          Text("IN ESECUZIONE",
                              style: context.textTheme.labelSmall
                                  ?.copyWith(fontWeight: FontWeight.w400)),
                          const SizedBox(width: 20),
                          Text('Test',
                              style: context.textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w600))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DashboardPagePlayerHeaderSection extends StatelessWidget {
  const _DashboardPagePlayerHeaderSection();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Align(
            child: Text(
              'Players',
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class _DashboardPagePlayerSection extends StatelessWidget {
  const _DashboardPagePlayerSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      buildWhen: (previous, current) => current is DashboardPlayersStateSuccess,
      builder: (context, state) {
        if (state is DashboardPlayersStateSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: state.players.length,
              (BuildContext context, int index) {
                final DashboardPlayerEntity player = state.players[index];

                final playerFullname = player.fullname;
                final fullnameStyle = context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                );
                //final playerRole = player.role?.toUpperCase() ?? "-";
                //final roleStyle = context.textTheme.labelMedium;

                return XMaterialCard(
                  child: ListTile(
                    title: Text(playerFullname, style: fullnameStyle),
                    //subtitle: Text(playerRole, style: roleStyle),
                    onTap: () {},
                  ),
                );
              },
            ),
          );
        }
        return const SliverToBoxAdapter(
          child: SizedBox(height: 0),
        );
      },
    );
/*
    return StreamBuilder<List<Player>>(
      key: UniqueKey(),
      stream: objectBox.getPlayers(),
      builder: (context, snapshot) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: snapshot.hasData ? snapshot.data!.length : 0,
            (BuildContext context, int index) {
              if (snapshot.data == null || snapshot.data?.isEmpty == true) {
                return const SizedBox(height: 0);
              }

              final Player player = snapshot.data![index];

              final playerFullname = player.fullname;
              final fullnameStyle = context.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w700);
              final playerRole = player.role?.toUpperCase() ?? "-";
              final roleStyle = context.textTheme.labelMedium;

              return XMaterialCard(
                child: ListTile(
                  title: Text(playerFullname, style: fullnameStyle),
                  subtitle: Text(playerRole, style: roleStyle),
                  onTap: () {},
                ),
              );
            },
          ),
        );
      },
    );
    */
  }
}
