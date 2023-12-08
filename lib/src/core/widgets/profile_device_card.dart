import 'package:flutter/material.dart';
import 'package:xmanager/src/core/theme_extension.dart';

class ProfileDeviceCard extends StatelessWidget {
  const ProfileDeviceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
        child: Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 10,
              bottom: 10,
              right: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: Card(
                    elevation: 4.0,
                    color: context.colorScheme.tertiaryContainer,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
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
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Dinamo",
                                  style: TextStyle(
                                    fontSize:
                                        context.textTheme.titleSmall?.fontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "1.3.0",
                                  style: TextStyle(
                                    fontSize:
                                        context.textTheme.bodySmall?.fontSize,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
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
                                        fontSize: context
                                            .textTheme.bodySmall?.fontSize,
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
                                        fontSize: context
                                            .textTheme.bodySmall?.fontSize,
                                        color: context.colorScheme.onError,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
