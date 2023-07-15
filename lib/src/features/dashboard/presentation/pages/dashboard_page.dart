import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:xmanager/src/core/data/models/account.dart';
import 'package:xmanager/src/core/databases/preferences.dart';
import 'package:xmanager/src/core/utils/localizations_extension.dart';
import 'package:xmanager/src/core/utils/theme_extension.dart';
import 'package:xmanager/src/features/dashboard/data/datasources/local/dashboard_datasource.dart';
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
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

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
        //backgroundColor: context.colorScheme.surfaceVariant,
        appBar: AppBar(
          centerTitle: false,
          //backgroundColor: context.colorScheme.background,
          //backgroundColor: Colors.black,
          title: Text(
            context.loc.dashboard,
            style: context.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.settings,
              ),
              onPressed: () => context.go('/settings'),
            ),
          ],
        ),
        body: const _DashboardPageBody(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            //const id = "";
            //context.go('/detail/$id');
            //context.go('/detail', extra: );

            const account = Account(fullname: 'Massimo Allegri');
            Preferences.saveAccount(account);
            //context.read<DashboardBloc>().add(DashboardEventStart());

            final currentAccount = await Preferences.currentAccount();
            print(currentAccount?.fullname);

            /*
            final json = objectBox.playerBox.getAll().first.toJson();
            final objecjson = DashboardPlayerModel.fromJson(json);
            print(objecjson.fullname);
            */
          },
          //elevation: 0,
          backgroundColor: colorScheme.secondaryContainer,
          foregroundColor: colorScheme.onSecondaryContainer,
          //backgroundColor: colorScheme.tertiaryContainer,
          //foregroundColor: colorScheme.onTertiaryContainer,

          splashColor: colorScheme.secondary,
          icon: const Icon(Icons.play_circle),
          label: const Text(
            'AVVIA PROGRAMMA',
          ),
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
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    return BlocBuilder<DashboardBloc, DashboardState>(
      buildWhen: (_, state) => state is DashboardProfileStateSuccess,
      builder: (_, state) {
        if (state is DashboardProfileStateSuccess) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 8, 5, 0),
              child: Card(
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          state.profile.fullname,
                          style: context.textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          state.profile.description ??
                              'This is an example of coach description',
                          style: context.textTheme.bodySmall,
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_vert,
                            size: 28,
                          ),
                        ),
                      ),

                      /*
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('TextButton'),
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            child: Text('outlined icon'),
                          ),
                          Chip(
                            label: const Text('Aaron Burr'),
                          )
                        ],
                      )
                      */
                      /*
                      Row(children: [
                        XMaterialInfoItem("www.sports.com",
                            icon: Icons.domain),
                        const SizedBox(width: 15),
                        const XMaterialInfoItem("Milano, Italy",
                            icon: Icons.location_on_outlined),
                      ]),
                      const SizedBox(height: 8),
                      XMaterialInfoItem("harald.bregu@gmail.com",
                          icon: Icons.email_outlined,
                          style: textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w900)),
                      const SizedBox(height: 8),
                      XMaterialRow(
                        children: [
                          XMaterialInfoItem("ProUEFA",
                              icon: Icons.workspace_premium,
                              style: textTheme.bodyLarge),
                          const SizedBox(width: 15),
                          XMaterialInfoItem("24 Stars",
                              icon: Icons.star_border_outlined,
                              style: textTheme.bodyLarge),
                        ],
                      ),
                      const SizedBox(height: 0),
                      */
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return const SliverToBoxAdapter(
          child: SizedBox(
            height: 0,
          ),
        );
      },
    );
  }
}

class _DashboardPageTrainingSection extends StatelessWidget {
  const _DashboardPageTrainingSection();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    return SliverToBoxAdapter(
      child: Column(
        children: [
          /*
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 3, 5, 0),
            child: Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListTile(
                  title: const Text(
                    'PROGRAMMI',
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          size: 28,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.layers,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          */
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 3, 5, 0),
            child: Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.only(
                        top: 0,
                        left: 5,
                        right: 5,
                      ),
                      title: Text(
                        'IN ESECUZIONE',
                        textAlign: TextAlign.center,
                        style: context.textTheme.labelSmall,
                      ),
                      subtitle: Text(
                        "Allenamento pesante con tanti sforzi e tanto sudore",
                        textAlign: TextAlign.center,
                        style: context.textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      leading: IconButton(
                        color: colorScheme.secondary,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.layers,
                          size: 28,
                        ),
                      ),
                      trailing: IconButton(
                        color: colorScheme.tertiary,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          size: 28,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CircleAvatar(
                        backgroundColor: colorScheme.background,
                        radius: 120,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(
                            Radius.circular(120),
                          ),
                          child: TweenAnimationBuilder(
                            tween: Tween(begin: 0.0, end: 0.75),
                            duration: const Duration(seconds: 10),
                            builder: (context, value, _) {
                              return CircularPercentIndicator(
                                radius: 110,
                                lineWidth: 14,
                                percent: value,
                                //progressColor: colorScheme.secondary,
                                //backgroundColor: colorScheme.onSecondary,
                                progressColor: colorScheme.tertiary,
                                backgroundColor: colorScheme.onTertiary,
                                circularStrokeCap: CircularStrokeCap.round,
                                center: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.bolt,
                                      size: 28,
                                      color: colorScheme.secondary,
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      '${(value * 100).round()} %',
                                      style: context.textTheme.headlineLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          //flex: 2,
                          child: ListTile(
                            title: Text(
                              "DURATA",
                              style: context.textTheme.bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            subtitle: Text(
                              "00:26:00",
                              style: context.textTheme.headlineMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Expanded(
                          //flex: 2,
                          child: ListTile(
                            title: Text(
                              "COUNTDOWN",
                              textAlign: TextAlign.right,
                              style: context.textTheme.bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            subtitle: Text(
                              "00:25:46",
                              textAlign: TextAlign.right,
                              style: context.textTheme.headlineMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
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
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListTile(
                  title: const Text(
                    'PLAYERS',
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          size: 28,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.group,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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

                return Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Card(
                    elevation: 1,
                    child: ListTile(
                      title: Text(playerFullname, style: fullnameStyle),
                      //subtitle: Text(playerRole, style: roleStyle),
                      onTap: () {},
                    ),
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
