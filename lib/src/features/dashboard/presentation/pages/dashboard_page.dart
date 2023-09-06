import 'package:flutter/gestures.dart';
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
          NavBarDashboard(),
          HeaderSection(),
          CoachCard(),
          TrainingCard(),
          _PlayerListTitle(),
          _PlayerList(),
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
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      color: context.colorScheme.primaryContainer,
                      //color: Color(0xffFF0E58),
                      child: const Icon(
                        Icons.person,
                        //color: Colors.white,
                        size: 25.0,
                      ),
                    ),
                  ),
                  title: Text("Marco Materazzi"),
                  subtitle: Text("Player role"),
                  onTap: () => context
                      .pushNamed("Player detail", params: {"id": "relfkemr"}),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
