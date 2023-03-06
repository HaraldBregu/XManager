import 'package:flutter/material.dart';
import 'package:xmanager/main.dart';

List<Widget> homeBarActions(BuildContext context) {
  return [
    Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () {},
          child: const Icon(Icons.widgets),
        )
    ),
    Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, RouteNames.account),
          child: const Icon(Icons.account_circle),
        )
    ),
  ];
}


Widget myDrawer(BuildContext context) => SizedBox(
  //width: MediaQuery.of(context).size.width * 0.25, // 75% of screen will be occupied
  child: Drawer(
    child: Row(
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text('User'),
                accountEmail: Text('user@email.com'),
                currentAccountPicture: CircleAvatar(
                  child: Icon(Icons.android),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: () async {

                  //await _navigateTo(context, RouteNames.home);
                },
                //selected: _selectedRoute == RouteNames.home,
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("PageTitles.gallery"),
                onTap: () async {
                  //await _navigateTo(context, RouteNames.gallery);
                },
                //selected: _selectedRoute == RouteNames.gallery,
              ),
              ListTile(
                leading: const Icon(Icons.slideshow),
                title: const Text("PageTitles.slideshow"),
                onTap: () async {
                  //await _navigateTo(context, RouteNames.slideshow);
                },
                //selected: _selectedRoute == RouteNames.slideshow,
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("PageTitles.settings"),
                onTap: () async {
                  //await _navigateTo(context, RouteNames.settings);
                },
                //selected: _selectedRoute == RouteNames.settings,
              ),
            ],
          ),
        ),
        //if (widget.permanentlyDisplay) const VerticalDivider(width: 1)
      ],
    ),
  )
);



/*
 Column(
    children: const [
      DrawerHeader(child: Icon(Icons.favorite)),
      ListTile(
        leading: Icon(Icons.responsive),
        title: Text("D A S H B O A R D"),
      ),
      ListTile(
        leading: Icon(Icons.responsive),
        title: Text("D A S H B O A R D"),
      ),
      ListTile(
        leading: Icon(Icons.responsive),
        title: Text("D A S H B O A R D"),
      ),
      ListTile(
        leading: Icon(Icons.responsive),
        title: Text("D A S H B O A R D"),
      ),
    ],
  )

*
*/