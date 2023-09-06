import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xmanager/src/core/localizations_extension.dart';

class NavBarDashboard extends StatelessWidget {
  const NavBarDashboard();

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (BuildContext context, constraints) {
        final scrolled = constraints.scrollOffset > 0;
        final scrolled50 = constraints.scrollOffset > 50;

/*
        return SliverAppBar.large(
          backgroundColor: scrolled ? null : Colors.transparent,
          title: Text(
            "Dashboard",
            style: const TextStyle(
              //fontSize: textTheme.titleMedium?.fontSize,
              fontWeight: FontWeight.w900,
            ),
          ),
          pinned: true,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              size: 28,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            }, // => GoRouter.of(context).pushNamed('Settings page'),
          ),
          actions: [
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
        */

        return SliverAppBar(
          backgroundColor: scrolled ? null : Colors.transparent,
          title: scrolled50
              ? Text(
                  context.loc.dashboard,
                  style: const TextStyle(
                    //fontSize: textTheme.titleMedium?.fontSize,
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
            onPressed: () {
              Scaffold.of(context).openDrawer();
            }, // => GoRouter.of(context).pushNamed('Settings page'),
          ),
          actions: [
            // IconButton(
            //   icon: const Icon(Icons.logout),
            //   onPressed: () => context.goNamed('start'),
            // ),
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
            // IconButton(
            //   icon: const Icon(Icons.bluetooth),
            //   onPressed: () => context.pushNamed('bluetooth debug page'),
            // ),
          ],
        );
      },
    );
  }
}
