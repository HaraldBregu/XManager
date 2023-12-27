import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xmanager/src/core/theme_extension.dart';

class ProfileDeviceCard extends StatelessWidget {
  const ProfileDeviceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 5),
        child: Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 8,
            ),
            child: Column(
              children: [
                ListTile(
                  title: const Text("Dinamo"),
                  titleTextStyle: context.textTheme.titleLarge,
                  trailing: const Icon(Icons.file_download_rounded),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 5),
                  child: Card(
                    color: context.colorScheme.surface,
                    child: ListTile(
                      title: Text(
                        "PIEDE DESTRO",
                        style: context.textTheme.titleMedium,
                      ),
                      trailing: Icon(
                        Icons.check_circle,
                        color: context.colorScheme.tertiaryContainer,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 5),
                  child: Card(
                    color: context.colorScheme.surface,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                
                                Text(
                                  "PIEDE DESTRO",
                                  style: context.textTheme.titleMedium
                                      ?.copyWith(fontWeight: FontWeight.bold)
                                      .copyWith(
                                          color: context.colorScheme.onSurface),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: context.colorScheme.secondary,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.cancel_rounded,
                                  color: context.colorScheme.inversePrimary,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
/*
                SizedBox(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Card(
                      color: context.colorScheme.surface,
                      child: ListTile(
                        title: Text(
                          "Destra",
                          style: context.textTheme.titleMedium,
                        ),
                        trailing: Row(
                          children: [
                            Icon(
                              Icons.cancel_rounded,
                              color: context.colorScheme.inversePrimary,
                            ),
                            Icon(
                              Icons.cancel_rounded,
                              color: context.colorScheme.inversePrimary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Card(
                    color: context.colorScheme.surface,
                    child: ListTile(
                      onTap: () => context.pushNamed(
                        "Device page",
                        params: {"id": "relfkemr"},
                      ),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(90.0),
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          color: context.colorScheme.surface,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/cleats6.png'),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      trailing: PopupMenuButton(
                        icon: Icon(
                          Icons.error,
                          color: context.colorScheme.secondaryContainer,
                          size: 25,
                        ),
                        onSelected: (value) {
                          print(value);
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: "one",
                            child: Text(
                              "Reimposta la sinistra",
                            ),
                          ),
                          const PopupMenuItem(
                            value: "two",
                            child: Text(
                              "Reimposta la destra",
                            ),
                          ),
                        ],
                      ),
                      title: Text(
                        "Dinamo v2.0",
                        style: TextStyle(
                          fontSize: context.textTheme.titleSmall?.fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "Accopiato scarpa sinistra",
                        style: TextStyle(
                          fontSize: context.textTheme.bodySmall?.fontSize,
                          color: context.colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: Card(
                    child: ListTile(
                      onTap: () => context.pushNamed(
                        "Device page",
                        params: {"id": "relfkemr"},
                      ),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(90.0),
                        child: Container(
                          height: 60.0,
                          width: 80.0,
                          color: context.colorScheme.surface,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/cleats6.png'),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      trailing: PopupMenuButton(
                        icon: Icon(
                          Icons.error,
                          color: context.colorScheme.secondaryContainer,
                          size: 25,
                        ),
                        onSelected: (value) {
                          print(value);
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: "one",
                            child: Text(
                              "Reimposta la sinistra",
                            ),
                          ),
                          const PopupMenuItem(
                            value: "two",
                            child: Text(
                              "Reimposta la destra",
                            ),
                          ),
                        ],
                      ),
                      title: Text(
                        "Dinamo v2.0",
                        style: TextStyle(
                          fontSize: context.textTheme.titleSmall?.fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "Accopiato scarpa sinistra",
                        style: TextStyle(
                          fontSize: context.textTheme.bodySmall?.fontSize,
                          color: context.colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                ),
                */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
