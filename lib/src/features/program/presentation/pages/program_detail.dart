import 'package:flutter/material.dart';

class ProgramDetail extends StatelessWidget {
  final String? id;

  const ProgramDetail({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Program detail")),
      body: const Text("program detail id"),
    );
  }
}
