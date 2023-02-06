import 'package:flutter/material.dart';

class HeaderActions extends StatefulWidget {
  //final Widget child;

  const HeaderActions({Key? key}) : super(key: key);

  @override
  State<HeaderActions> createState() => _HeaderActionsState();
}

class _HeaderActionsState extends State<HeaderActions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(left: 20, right: 15),
      color: const Color.fromRGBO(16, 17, 18, 1.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                direction: Axis.vertical,
                children:  [
                  Container(
                    //color: Colors.red,
                    padding: const EdgeInsets.all(0),
                    child: const Text(
                      "Board manager options",
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: 17
                      ),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("object 1");
                    },
                    child: Container(
                      //color: Colors.red,
                      height: 40.0,
                      width: 40.0,
                      child: const Icon(
                        Icons.widgets,
                        color: Colors.white70,
                        size: 24.0,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("object");
                    },
                    child: Container(
                      //color: Colors.purple,
                      height: 40.0,
                      width: 40.0,
                      child: const Icon(
                        Icons.watch_later_outlined,
                        color: Colors.white70,
                        size: 24.0,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("object");
                    },
                    child: Container(
                      //color: Colors.purple,
                      height: 40.0,
                      width: 40.0,
                      child: const Icon(
                        Icons.calendar_month,
                        color: Colors.white70,
                        size: 24.0,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
