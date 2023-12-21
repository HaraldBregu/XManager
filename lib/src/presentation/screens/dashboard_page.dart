import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:xmanager/src/core/localizations_extension.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/presentation/bloc/bloc.dart';
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
        onPressed: () async {
          final ins = FirebaseAuth.instance.currentUser;
          print("######");
          print(ins);
          print("######");

          //UserCredential userCredential =  await FirebaseAuth.instance.signInAnonymously();
          //print("###cred###");
          //print(userCredential);
          //print("###cred###");
          BlocProvider.of<AuthBloc>(context).add(LogOutEvent());

          return;
          UserCredential userCredential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: "barry.allen@example.com",
            password: "SuperSecretPassword!",
          );

          return;
          final docUser = FirebaseFirestore.instance.collection("users").doc();

          final json = {
            'name': "John doe",
            'age': 26,
            'familyname': "brefdlkjbnd",
          };

          await docUser.set(json);
        },
        /*onPressed: () => showModalBottomSheet<void>(
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
        ),*/
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
          SliverToBoxAdapter(
            child: PlayerCard(
              onTap: () =>
                  context.pushNamed("Profile page", params: {"id": "relfkemr"}),
            ),
          ),

        ],
      ),
      drawer: const DrawerMenu(),
    );
  }
}
