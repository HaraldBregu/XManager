import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:xmanager/src/core/localizations_extension.dart';
import 'package:xmanager/src/core/presentation/bloc/user/bloc.dart';
import 'package:xmanager/src/core/theme_extension.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    return Scaffold(
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Visibility(
        visible: true,
        child: FloatingActionButton.extended(
          onPressed: () async {
            /*
            final json = objectBox.playerBox.getAll().first.toJson();
            final objecjson = DashboardPlayerModel.fromJson(json);
            print(objecjson.fullname);
            */
          },
          backgroundColor: colorScheme.secondaryContainer,
          foregroundColor: colorScheme.onSecondaryContainer,
          //splashColor: colorScheme.secondary,
          icon: const Icon(Icons.play_circle),
          label: const Text('START'),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          _DashboardNavigation(),
          _DashboardHeader(),
          //_DashboarCoachSection(),
          //_DashboardTrainingEmptySection(),
/*
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(8, 5, 8, 0),
              child: Card(
                elevation: 1,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5, 15, 5, 5),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          'PROGRAM',
                          //textAlign: TextAlign.left,
                          style: context.textTheme.titleSmall,
                        ),
                        subtitle: Text(
                          "00:12:56",
                          //textAlign: TextAlign.left,
                          style: context.textTheme.titleLarge,
                        ),
                        trailing: IconButton(
                          color: colorScheme.secondary,
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            size: 30,
                          ),
                          //label: Text("Change"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TweenAnimationBuilder(
                          tween: Tween(begin: 0.0, end: 0.75),
                          duration: const Duration(seconds: 10),
                          builder: (context, value, _) {
                            return CircularPercentIndicator(
                              radius: 120,
                              lineWidth: 10,
                              percent: value,
                              progressColor: colorScheme.secondary,
                              backgroundColor: colorScheme.onSecondary,
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
                                        ?.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            );
                          },
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
                                style: TextStyle(
                                    fontSize: context
                                        .textTheme.headlineMedium?.fontSize,
                                    fontWeight: FontWeight.w700),
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
          ),
*/

          _DashboardTrainingSection(),
          _DashboardPageTrainingSection(),
          //_PlayerSection(),
          _PlayerListTitle(),
          _PlayerList(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
            ),
          ),
        ],
      ),
    );
  }
}

class _DashboardNavigation extends StatelessWidget {
  const _DashboardNavigation();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    return SliverLayoutBuilder(
      builder: (BuildContext context, constraints) {
        final scrolled = constraints.scrollOffset > 0;
        final scrolled50 = constraints.scrollOffset > 50;
        return SliverAppBar(
          backgroundColor: scrolled ? null : Colors.transparent,
          title: scrolled50
              ? Text(
                  "Dashboard",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                )
              : null,
          pinned: true,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              size: 28,
            ),
            onPressed: () => GoRouter.of(context).pushNamed('settings'),
          ),
          actions: [
            // IconButton(
            //   icon: const Icon(Icons.logout),
            //   onPressed: () => context.goNamed('start'),
            // ),
            IconButton(
              icon: const FittedBox(
                child: CircleAvatar(
                  child: Icon(
                    Icons.person,
                  ),
                ),
              ),
              onPressed: () => context.pushNamed('settings'),
            ),
          ],
        );
      },
    );
  }
}

class _DashboardHeader extends StatelessWidget {
  const _DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    return SliverToBoxAdapter(
      child: ListTile(
        // isThreeLine: true,
        title: Text(
          "Dashboard",
          style: TextStyle(
            fontSize: context.textTheme.headlineSmall?.fontSize,
            fontWeight: FontWeight.w700,
            height: 2,
          ),
        ),
        // subtitle: const Text(
        //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        // ),
      ),
    );
  }
}

class _DashboarCoachSection extends StatelessWidget {
  const _DashboarCoachSection();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return SliverToBoxAdapter(
      child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
          child: Card(
            elevation: 1,
            child: Column(
              children: [
                BlocBuilder<UserBloc, UserState>(
                  builder: (bloc, state) {
                    if (state is UserAuthorizedState) {
                      return ListTile(
                        title: const Text("Massimo Allegri"),
                        subtitle: const Text("FiFa Pro"),
                        leading: const FittedBox(
                          child: CircleAvatar(
                            child: Icon(
                              Icons.person,
                            ),
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.east,
                          ),
                          onPressed: () => {},
                        ),
                        onTap: () => context.pushNamed("Profile page"),
                      );
                    }
                    if (state is UserUnAuthorizedState) {
                      return ListTile(
                        title: const Text("Massimo Allegri"),
                        subtitle: const Text("FiFa Pro"),
                        leading: const FittedBox(
                          child: CircleAvatar(
                            child: Icon(
                              Icons.person,
                            ),
                          ),
                        ),
                        onTap: () => context.pushNamed("Profile page"),
                      );
                    }

                    return const Text("NO STATE");
                  },
                ),
              ],
            ),
          )),
    );
  }
}

class _DashboardTrainingEmptySection extends StatelessWidget {
  const _DashboardTrainingEmptySection();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
            child: Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          Icon(
                            Icons.sports_soccer,
                            size: 20,
                            color: colorScheme.secondary,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'Training program',
                          ),
                        ],
                      ),
                      subtitle: const Text(
                        "Seems you dont have any program yet created. Start creating one now!",
                      ),
                      isThreeLine: true,
                      /*trailing: const Icon(
                        Icons.add,
                      ),*/
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(13, 5, 13, 10),
                      child: OutlinedButton(
                        // style: OutlinedButton.styleFrom(
                        //   minimumSize: const Size.fromHeight(50),
                        // ),
                        child: Text("CREA UN PROGRAMMA"),
                        onPressed: () => context.pushNamed("Program create"),
                        //onPressed: () => context.pushNamed("Program detail",params: {"id": "fdlv"}),
                        //onPressed: () => context
                        //  .goNamed("Program detail", params: {"id": "2374"}),

                        //onPressed: () => context.pushNamed("Program detail", params: {"name": "1123"}),
                      ),
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

class _DashboardTrainingSection extends StatelessWidget {
  const _DashboardTrainingSection();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
        child: Card(
          elevation: 1,
          color: colorScheme.primaryContainer,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 25, top: 30, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Program",
                        style: TextStyle(
                          fontSize: textTheme.headlineSmall?.fontSize,
                          color: colorScheme.onSecondaryContainer,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.radio_button_checked_rounded,
                            color: colorScheme.secondary,
                            size: 15,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "trainning progress",
                            style: TextStyle(
                              color: colorScheme.onSecondaryContainer,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.trip_origin,
                            color: colorScheme.error,
                            size: 15,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "one",
                            style: TextStyle(
                              color: colorScheme.onSecondaryContainer,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.trip_origin,
                            color: colorScheme.secondary,
                            size: 15,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "00:12:05",
                            style: TextStyle(
                              color: colorScheme.onSecondaryContainer,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 0,
                  top: 30,
                  bottom: 30,
                  right: 30,
                ),
                child: TweenAnimationBuilder(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(seconds: 60),
                  builder: (context, value, _) {
                    return CircularPercentIndicator(
                      radius: 60,
                      lineWidth: 8,
                      percent: value,
                      progressColor: colorScheme.secondary,
                      backgroundColor: colorScheme.onTertiary,
                      circularStrokeCap: CircularStrokeCap.square,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.bolt,
                            size: 22,
                            color: colorScheme.secondary,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            '${(value * 100).round()} %',
                            style: TextStyle(
                              fontSize: context.textTheme.titleLarge?.fontSize,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
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
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
            child: Card(
              elevation: 1,
              child: ListTile(
                title: const Text(
                  'PROGRAM LIST',
                ),
                onTap: () {},
                // trailing: IconButton(
                //   onPressed: () {},
                //   icon: const Icon(
                //     Icons.layers,
                //     size: 28,
                //   ),
                // ),
              ),
            ),
          ),
          Visibility(
            visible: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
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
          ),
        ],
      ),
    );
  }
}

class _PlayerSection extends StatelessWidget {
  const _PlayerSection();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
            child: Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: 20,
                            color: colorScheme.tertiary,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'Player',
                          ),
                        ],
                      ),
                      subtitle: const Text(
                        "Registra nuovi player associando con i dispositivi bluetooth e inizia il training!",
                      ),
                      isThreeLine: true,
                      /*trailing: const Icon(
                        Icons.add,
                      ),*/
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(13, 5, 13, 10),
                      child: OutlinedButton(
                        child: const Text("REGISTRA UN PLAYER"),
                        onPressed: () => context.pushNamed("Player create"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          /*
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
                        radius: 100,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                          child: TweenAnimationBuilder(
                            tween: Tween(begin: 0.0, end: 0.75),
                            duration: const Duration(seconds: 10),
                            builder: (context, value, _) {
                              return CircularPercentIndicator(
                                radius: 90,
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
                                      size: 24,
                                      color: colorScheme.secondary,
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      '${(value * 100).round()} %',
                                      style: context.textTheme.headlineSmall
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
        */
        ],
      ),
    );
  }
}

class _PlayerListTitle extends StatelessWidget {
  const _PlayerListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: ListTile(
        title: Text("Player list"),
        trailing: Icon(Icons.add),
      ),
    );
  }
}

class _PlayerList extends StatelessWidget {
  const _PlayerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        List.generate(23, (idx) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
            child: Card(
              elevation: 1,
              child: ListTile(
                title: Text("Marco Materazzi"),
                subtitle: Text("Player role"),
                onTap: () {},
              ),
            ),
          );
        }),
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
