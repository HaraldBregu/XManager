import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:xmanager/src/core/data/models/account.dart';
import 'package:xmanager/src/core/databases/preferences.dart';
import 'package:xmanager/src/core/presentation/bloc/user/user_bloc.dart';
import 'package:xmanager/src/core/presentation/bloc/user/user_event.dart';
import 'package:xmanager/src/core/presentation/bloc/user/user_state.dart';
import 'package:xmanager/src/core/utils/localizations_extension.dart';
import 'package:xmanager/src/core/utils/theme_extension.dart';


class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
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
          IconButton(
            icon: const Icon(
              Icons.logout,
            ),
            onPressed: () {
              context.read<UserBloc>().add(const ExitUserEvent());
            },
          ),
        ],
      ),
      //body: Text("nothing"), //const _DashboardPageBody(),
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
    );
  }
}

class _DashboardPageBody extends StatelessWidget {
  const _DashboardPageBody();

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        _ProfileSection(),
        _TrainingSection(),
        //_DashboardPagePlayerHeaderSection(),
        //_DashboardPagePlayerSection(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 120,
          ),
        ),
      ],
    );
  }
}

class _ProfileSection extends StatelessWidget {
  const _ProfileSection();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 8, 5, 0),
        child: Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                BlocBuilder<UserBloc, UserState>(
                  builder: (bloc, state) {
                    if (state is UserStateAuthorized) {
                      return ListTile(
                        title: const Text("Massimo Allegri"),
                        subtitle: const Text("• FiFa Pro"),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.settings,
                          ),
                          onPressed: () => {},
                        ),
                      );
                    }
                    if (state is UserStateUnAuthorized) {
                      return const Text("Logged out");
                    }

                    return const Text("NO STATE");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TrainingSection extends StatelessWidget {
  const _TrainingSection();

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
                          borderRadius: const BorderRadius.all(
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
                          borderRadius: const BorderRadius.all(
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
    return Placeholder();
    /*
      return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 34,
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
      */
  }
}
