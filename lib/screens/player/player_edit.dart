import 'package:flutter/material.dart';


class PlayerEdit extends StatefulWidget {
  const PlayerEdit({Key? key}) : super(key: key);

  @override
  State<PlayerEdit> createState() => _PlayerEditState();
}

class _PlayerEditState extends State<PlayerEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Player",
          style: TextStyle(
              color: Colors.white,
              fontSize: 22
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(),
    );
  }
}
