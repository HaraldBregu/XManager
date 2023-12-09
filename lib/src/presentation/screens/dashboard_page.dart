import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xmanager/src/core/localizations_extension.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/presentation/widgets/drawer_menu.dart';
import 'package:xmanager/src/presentation/widgets/header_card.dart';
import 'package:xmanager/src/presentation/widgets/nav_bar.dart';
import 'package:xmanager/src/presentation/widgets/player_card.dart';
import 'package:xmanager/src/presentation/widgets/training_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: 400,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('Modal BottomSheet'),
                    ElevatedButton(
                      child: const Text('Close BottomSheet'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        backgroundColor: context.colorScheme.secondaryContainer,
        foregroundColor: context.colorScheme.onSecondaryContainer,
        icon: const Icon(Icons.play_circle),
        label: const Text('START'),
      ),
      body: CustomScrollView(
        slivers: [
          const NavBarDashboard(),

          HeaderCard(
            title: context.loc.dashboard,
            topTitle: "HARALD BREGU",
          ),
          TrainingCard(
            title: "TRAINING SESSION",
            subtitle: "Nessun programma attivo",
            description: "3/4 programmi terminati", // optional
            options: const [
              "Current trainig program",
              "Training program list",
              "Create program",
            ],
            onTapOption: (option) async {
              print(option);
            },
          ),
          const _PlayerListTitle(),

          // Here listen to current players stored in db
          SliverList(
            delegate: SliverChildListDelegate(
              List.generate(
                5,
                (idx) {
                  return PlayerCard(
                    onTap: () => context
                        .pushNamed("Player detail", params: {"id": "relfkemr"}),
                  );
                },
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(13, 15, 13, 15),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: context.textTheme.titleMedium?.fontSize,
                  ),
                  children: [
                    const WidgetSpan(
                      child: Icon(
                        Icons.add,
                        size: 20,
                      ),
                    ),
                    TextSpan(
                      text: 'ADD NEW PLAYER',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => print('Tap Here onTap'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
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
                trailing: const Text("9"),
                //trailing: Icon(Icons.add),
              ),
              //OutlinedButton(onPressed: () {}, child: Text("Create")),
            ],
          ),
        ),
      ),
    );
  }
}
