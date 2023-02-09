import 'package:flutter/material.dart';
import 'package:xmanager/screens/widget/base_card.dart';

class CoachCard extends StatefulWidget {
  const CoachCard({Key? key}) : super(key: key);

  @override
  State<CoachCard> createState() => _CoachCardState();
}

class _CoachCardState extends State<CoachCard> {
  @override
  Widget build(BuildContext context) {

    return Container();
    /*return BaseCard(
      cardPadding: const EdgeInsets.only(left: 15, right: 10, top: 10, bottom: 15),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 30,
                        child: const Text(
                          'COACH',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                              },
                              child: const SizedBox(
                                height: 30,
                                width: 30,
                                child: Icon(
                                  Icons.bar_chart,
                                  color: Colors.white70,
                                  size: 22.0,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                              },
                              child: const SizedBox(
                                height: 30,
                                width: 30,
                                child: Icon(
                                  Icons.data_usage,
                                  color: Colors.white70,
                                  size: 22.0,
                                ),
                              ),
                            ),
                          ],
                        )
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Maldonado Cristian',
                    style: TextStyle(
                        color: Colors.white54,
                        fontSize: 20
                    ),
                  ),
                ),
              ],
            )
          ],
        )
    );*/
  }
}
