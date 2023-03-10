import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xmanager/app.dart';
import 'package:xmanager/main.dart';
import 'package:xmanager/models/menu_item.dart';
import 'package:xmanager/shared/widget/theme_mode_switch.dart';

class DrawerLayout extends StatelessWidget {
  const DrawerLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    final items = <MenuItem>[
      MenuItem(
        menuType: MenuType.header,
        title: 'Harald Bregu',
        subtitle: 'harald.bregu@gmail.com',
      ),
      MenuItem(
        title: 'Account',
        subtitle: 'Settings',
        route: RouteNames.account,
      ),
      MenuItem(
        title: 'App Permissions',
        icon: const Icon(Icons.perm_identity_sharp),
        route: RouteNames.appPermissions,
      ),
      MenuItem(
        title: 'Bluetooth state',
        icon: const Icon(Icons.bluetooth),
        route: RouteNames.root,
      ),
      MenuItem(
        title: 'Bluetooth search',
        icon: const Icon(Icons.search),
        route: RouteNames.deviceSearch,
      ),
      MenuItem(
          title: 'Bluetooth search',
          icon: const Icon(Icons.search)
      ),
    ];

    return Drawer(
      child: Row(
        children: [
          Expanded(
            child: ListView(
                padding: EdgeInsets.zero,
                children: items.map((item) {
              switch (item.menuType) {
                case MenuType.header:
                  return UserAccountsDrawerHeader(
                    accountName: Text("AppMaking.co"),
                    accountEmail: Text("sundar@appmaking.co"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1676808625978-400448b79d48?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1676809728898-0ceaa55a4813?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    otherAccountsPictures: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1676808625978-400448b79d48?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1676808625978-400448b79d48?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
                      ),
                    ],
                  );
                case MenuType.item:

                  void pushToRoute(String? route) {
                    if (route != null) {
                      Navigator.pushNamed(context, route);
                    }
                  }

                  if (item.subtitle != null) {
                    return ListTile(
                      leading: item.icon,
                      title: Text(item.title),
                      subtitle: Text(item.subtitle ?? ""),
                      onTap: () => pushToRoute(item.route),
                    );
                  } else {
                    return ListTile(
                      leading: item.icon,
                      title: Text(item.title),
                      onTap: () => pushToRoute(item.route),
                    );
                  }
                case MenuType.footer:
                  break;
              }

              return Text("no data");

            }).toList()
            ),
          ),
          //if (widget.permanentlyDisplay) const VerticalDivider(width: 1)
        ],
      ),
    );
  }
}
