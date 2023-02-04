import 'package:flutter/material.dart';

void main() => runApp(App());

void didPressButton() {
  print("did pressed");
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text(
            "Example",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.red, fontSize: 40, fontWeight: FontWeight.bold),
          )),
      floatingActionButton: FloatingActionButton(
        child: Text("exam"),
        onPressed: didPressButton,
      ),
    ));
  }
}
