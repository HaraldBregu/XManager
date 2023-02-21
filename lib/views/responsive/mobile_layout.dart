import 'package:flutter/material.dart';
import 'package:xmanager/common.dart';
import 'package:xmanager/main.dart';
import 'package:xmanager/views/responsive/drawer_layout.dart';
import 'package:xmanager/views/responsive/home_view.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations? localize = AppLocalizations.of(context);
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final GlobalKey _scaffoldKey = GlobalKey();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(localize?.dashboard ?? ""),
        //centerTitle: true,
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
      drawer: DrawerLayout(),
      body: SafeArea(
        child: HomeView(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context,RouteNames.playerEdit),
        backgroundColor: Colors.green,
        icon: const Icon(Icons.play_circle),
        label: const Text('AVVIA PROGRAMMA'),
      ),

    );
  }
}