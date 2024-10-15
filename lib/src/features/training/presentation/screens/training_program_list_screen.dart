import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TrainingProgramListScreen extends StatelessWidget {
  const TrainingProgramListScreen({super.key});

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
          /*
          SliverToBoxAdapter(
            child: ProgramList(
              onSelectTrainingProgram: () {},
            ),
          ),*/
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
