import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xmanager/src/core/theme_extension.dart';

class TrainingProgramListScreen extends StatelessWidget {
  const TrainingProgramListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Programs'),
            pinned: true,
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
          
          // Spacer
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),

          SliverList(
            delegate: SliverChildListDelegate(
              List.generate(
                5,
                (idx) {
                  return ListTile(
                    title: Text(
                      "Title program",
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right,
                      size: 30,
                    ),
                    onTap: () {
                      context.pushNamed('program edit screen');
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FilledButton.icon(
              style: FilledButton.styleFrom(
                fixedSize: const Size(150, 50),
              ),
              label: Text(
                "CREATE NEW PROGRAM",
                style: TextStyle(
                  color: context.colorScheme.surface,
                  fontWeight: FontWeight.w900,
                ),
              ),
              onPressed: () {
                context.pushNamed('program edit screen');
              },
            ),
          ],
        ),
      ),
    );
  }
}
