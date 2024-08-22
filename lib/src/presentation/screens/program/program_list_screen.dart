import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xmanager/src/core/theme_extension.dart';

class ProgramListScreen extends StatelessWidget {
  const ProgramListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text(
              "Program list",
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
            pinned: true,
            //centerTitle: true,
            actions: [
              PopupMenuButton(
                itemBuilder: (context) {
                  return const [
                    PopupMenuItem<int>(
                      value: 0,
                      child: Text("Elimina dispositivo"),
                    ),
                    PopupMenuItem<int>(
                      value: 1,
                      child: Text("Disconnetti"),
                    ),
                    PopupMenuItem<int>(
                      value: 2,
                      child: Text("Demo animation"),
                    ),
                  ];
                },
                onSelected: (value) {
                  if (value == 0) {
                  } else if (value == 1) {
                  } else if (value == 2) {}
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: ListView.separated(
              physics: const ScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 0,
                  color: Colors.white10,
                  indent: 20,
                  endIndent: 20,
                );
              },
              itemCount: 40,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  title: Text(
                    "Base training program",
                    style: TextStyle(
                      fontSize: context.textTheme.titleMedium?.fontSize,
                      fontFamily: context.textTheme.titleMedium?.fontFamily,
                      fontWeight: FontWeight.w600,
                      color: context.colorScheme.onBackground,
                    ),
                  ),
                  subtitle: Text(
                    "DURATION: 23:04",
                    style: TextStyle(
                      fontSize: context.textTheme.bodySmall?.fontSize,
                      fontFamily: context.textTheme.bodySmall?.fontFamily,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    size: 34,
                  ),
                  onTap: () {
                    context.pushNamed("program edit screen");
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                fixedSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                context.pushNamed("program edit screen");
              },
              child: const Text('CREA PROGRAMMA'),
            ),
          ],
        ),
      ),
    );
  }
}
