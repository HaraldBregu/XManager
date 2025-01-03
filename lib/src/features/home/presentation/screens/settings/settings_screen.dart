import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/shared/presentation/bloc/bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SettingsWidget();
  }
}

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text(
            "Settings",
            style: TextStyle(
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              /*
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 15.0, 0, 0),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: context.colorScheme.primaryContainer,
                          child: const Icon(
                            Icons.person,
                            size: 35,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15.0, 10.0, 0),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.light_mode,
                            //Icons.dark_mode,
                            // Icons.mode_night,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const ListTile(
                    title: Text("Marco Materazzi"),
                    subtitle: Text("marc@materazzi.com"),
                    trailing: Icon(Icons.expand_more),
                  )
                ],
              ),
              */
              const ListTile(
                title: Text("Profile"),
                leading: Icon(
                  Icons.person_rounded,
                ),
              ),
              const ListTile(
                title: Text("Players"),
                leading: Icon(
                  Icons.groups,
                ),
              ),
              const ListTile(
                title: Text("Devices"),
                leading: Icon(
                  Icons.devices,
                ),
              ),
              const ListTile(
                title: Text("Contacts"),
                leading: Icon(
                  Icons.contacts,
                ),
              ),
              const ListTile(
                title: Text("Invita amici"),
                leading: Icon(
                  Icons.group_add,
                ),
              ),
              const ListTile(
                title: Text("Condividi"),
                leading: Icon(
                  Icons.share,
                ),
              ),
              const ListTile(
                title: Text("Funzioni di Xmanager"),
                leading: Icon(Icons.help),
              ),
              const ListTile(
                title: Text("Network"),
                leading: Icon(Icons.public),
              ),
              Container(
                height: 1,
                color: context.colorScheme.background,
              ),
              ListTile(
                title: const Text("Permissions"),
                leading: const Icon(Icons.perm_camera_mic),
                onTap: () => context.pushNamed('permission list page'),
              ),
              ListTile(
                title: const Text("Bluetooth search"),
                leading: const Icon(Icons.bluetooth),
                onTap: () => context.pushNamed('bluetooth search page'),
              ),
              ListTile(
                title: const Text("Bluetooth debug"),
                onTap: () => context.pushNamed('bluetooth debug page'),
              ),
              ListTile(
                title: const Text("Bluetooth list"),
                leading: const Icon(Icons.bluetooth),
                onTap: () => context.pushNamed('bluetooth list page'),
              ),
              Container(
                height: 1,
                color: context.colorScheme.background,
              ),
              const ListTile(
                title: Text("Licences"),
              ),
              const ListTile(
                title: Text("Terms and Conditions"),
              ),
              ListTile(
                title: const Text("Exit"),
                leading: const Icon(
                  Icons.exit_to_app,
                ),
                onTap: () {
                  final userBloc = context.read<UserBloc>();
                  userBloc.add(LogOutEvent());
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
