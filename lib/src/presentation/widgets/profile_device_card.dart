import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xmanager/src/core/theme_extension.dart';

class ProfileDeviceCard extends StatelessWidget {
  const ProfileDeviceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
        child: Card(
          elevation: 3,
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
                        image: AssetImage('assets/images/cleats6.png'),
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
          /*Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 10,
              bottom: 10,
              right: 20,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Card(
                    elevation: 4.0,
                    color: context.colorScheme.secondaryContainer,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/cleats4.png'),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "DINAMO",
                                style: TextStyle(
                                  fontSize:
                                      context.textTheme.titleSmall?.fontSize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "v2.0.10",
                                style: TextStyle(
                                  fontSize:
                                      context.textTheme.bodySmall?.fontSize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          /*
                          Text(
                            "v2.0.10",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: context.textTheme.bodySmall?.fontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        
                          PopupMenuButton(
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                child: const Text(
                                  "Reimposta la sinistra",
                                ),
                                onTap: () async {},
                              ),
                              PopupMenuItem(
                                child: const Text(
                                  "Reimposta la destra",
                                ),
                                onTap: () async {},
                              ),
                            ],
                          ),*/
                        ],
                      ),
                      /*
                      Row(
                        children: [
                          Container(
                            width: 20,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(3),
                                bottomLeft: Radius.circular(3),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 3,
                              ),
                              child: Text(
                                "L",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize:
                                      context.textTheme.bodySmall?.fontSize,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 20,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(3),
                                bottomRight: Radius.circular(3),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 3,
                              ),
                              child: Text(
                                "R",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize:
                                      context.textTheme.bodySmall?.fontSize,
                                  color: context.colorScheme.onError,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),*/
                    ],
                  ),
                ),
              ],
            ),
          ),*/
        ),
      ),
    );
  }
}
