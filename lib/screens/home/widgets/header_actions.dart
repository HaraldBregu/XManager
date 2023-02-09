import 'package:flutter/material.dart';

class HeaderActions extends StatefulWidget {
  final Function()? optionsPressed;

  const HeaderActions({
    Key? key,
    this.optionsPressed}) : super(key: key);

  @override
  State<HeaderActions> createState() => _HeaderActionsState();
}

class _HeaderActionsState extends State<HeaderActions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(left: 20, right: 20),
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
                      "Maldonado Cristian",
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: 22
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
                    onTap: widget.optionsPressed,
                    child: Container(
                      //color: Colors.red,
                      height: 40.0,
                      width: 40.0,
                      child: const Icon(
                        Icons.bar_chart,
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
