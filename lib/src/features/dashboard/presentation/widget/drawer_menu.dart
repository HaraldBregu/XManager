import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xmanager/src/core/theme_extension.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 320,
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              //color: context.colorScheme.background,
              border: Border(
                bottom: BorderSide(
                  color: context.colorScheme.background,
                ),
              ),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 40.0, 0, 0),
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
          const ListTile(
            title: Text("Exit"),
            leading: Icon(
              Icons.exit_to_app,
            ),
          ),
        ],
      ),
    );
  }
}
