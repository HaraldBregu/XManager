import 'package:flutter/material.dart';

class ProgramCreate extends StatefulWidget {
  const ProgramCreate({Key? key}) : super(key: key);

  @override
  State<ProgramCreate> createState() => _ProgramCreateState();
}

class _ProgramCreateState extends State<ProgramCreate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crea programma"),
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
