import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xmanager/src/core/localizations_extension.dart';
import 'package:xmanager/src/core/theme_extension.dart';

class NavBarDashboard extends StatelessWidget {
  const NavBarDashboard();

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (BuildContext context, constraints) {
        final scrolled = constraints.scrollOffset > 0;
        final scrolled50 = constraints.scrollOffset > 50;
      
        /*
        return SliverAppBar(
          expandedHeight: 120.0,
          floating: false,
          pinned: true,
          flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(left: 18, bottom: 18),
                title: Text(
                  context.loc.dashboard,
                  style: TextStyle(
                    fontSize: context.textTheme.headlineSmall?.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        );*/

        return SliverAppBar(
          backgroundColor: scrolled ? null : Colors.transparent,
          title: scrolled50
              ? Text(
                  context.loc.dashboard,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                )
              : null,
          pinned: true,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              size: 28,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notification_important_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const FittedBox(
                child: CircleAvatar(
                  child: Icon(
                    Icons.person,
                  ),
                ),
              ),
              onPressed: () => context.pushNamed('Settings page'),
            ),
          ],
        );
      },
    );
  }
}
