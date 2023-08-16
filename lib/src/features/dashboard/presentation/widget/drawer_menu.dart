import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: ListView(
        children: [
          DrawerHeader(
            child: Card(
              elevation: 4,
              child: Center(
                child: Text('Drawer Header'),
              ),
            ),
          ),
          DrawerButton(
            onPressed: () {},
          ),
          DrawerButtonIcon(),
          ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.person,
              ),
            ),
            title: Text("John Doe"),
            subtitle: Text("Top Manager"),
          ),
          ListTile(
            title: Text("Dark mode"),
          ),
          ListTile(
            title: Text("Title three"),
          ),
          ListTile(
            title: Text("Title four"),
          ),
          SwitchListTile(
            title: Text("Dark mode"),
            value: false,
            onChanged: (bool boolvalue) {},
          ),
        ],
      ),
    );
  }
}
