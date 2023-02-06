import 'package:flutter/material.dart';
import 'package:xmanager/screens/home/widgets/home_card.dart';

class ProgramCard extends StatefulWidget {
  const ProgramCard({Key? key}) : super(key: key);

  @override
  State<ProgramCard> createState() => _ProgramCardState();
}

class _ProgramCardState extends State<ProgramCard> {
  @override
  Widget build(BuildContext context) {
    return HomeCard(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Wrap(
                direction: Axis.vertical,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 20, bottom: 5),
                    child: Text(
                      "TRAINING",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Align(
              alignment: Alignment(1.0, 0.0),
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("object");
                    },
                    child: const Padding(
                      padding: const EdgeInsets.all(15.0),
                      child:  Icon(
                        Icons.watch_later_rounded,
                        color: Colors.white70,
                        size: 22.0,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("object");
                    },
                    child: const Padding(
                      padding: const EdgeInsets.all(15.0),
                      child:  Icon(
                        Icons.create_outlined,
                        color: Colors.white70,
                        size: 22.0,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("object 1");
                    },
                    child: const Padding(
                      padding: const EdgeInsets.all(15.0),
                      child:  Icon(
                        Icons.wb_sunny_outlined,
                        color: Colors.white70,
                        size: 22.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}
