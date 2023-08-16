import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:xmanager/src/core/localizations_extension.dart';
import 'package:xmanager/src/core/presentation/bloc/user/bloc.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/features/dashboard/presentation/widget/coach_card.dart';
import 'package:xmanager/src/features/dashboard/presentation/widget/drawer_menu.dart';
import 'package:xmanager/src/features/dashboard/presentation/widget/header_section.dart';
import 'package:xmanager/src/features/dashboard/presentation/widget/nav_bar.dart';
import 'package:xmanager/src/features/dashboard/presentation/widget/training_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {},
        backgroundColor: colorScheme.secondaryContainer,
        foregroundColor: colorScheme.onSecondaryContainer,
        icon: const Icon(Icons.play_circle),
        label: const Text('START'),
      ),
      body: CustomScrollView(
        slivers: [
          NavBarDashboard(),
          HeaderSection(),
          CoachCard(),
          TrainingCard(),
          _PlayerListTitle(),
          _PlayerList(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(13, 5, 13, 5),
              child: TextButton(
                onPressed: () {},
                child: Text("ADD NEW"),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
            ),
          ),
        ],
      ),
      drawer: const DrawerMenu(),
    );
  }
}

class _PlayerListTitle extends StatelessWidget {
  const _PlayerListTitle();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
        child: Card(
          elevation: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  "Players",
                  style: TextStyle(
                    fontSize: context.textTheme.titleLarge?.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //trailing: Icon(Icons.add),
              ),
              const Card(
                elevation: 9,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListTile(
                    title: Text(
                      'Number of players',
                    ),
                    trailing: const Icon(
                      Icons.add,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
        List.generate(
          5,
          (idx) {
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
          },
        ),
      ),
    );
  }
}
