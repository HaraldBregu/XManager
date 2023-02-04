import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xmanager',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CircleAvatar(

              backgroundImage: AssetImage("assets/header.jpg"),
              radius: 40,
            ),
            Image.asset("assets/header.jpg"),
           Expanded(
             flex: 3,
             child:  Container(
               padding: const EdgeInsets.all(20.0),
               color: Colors.amberAccent,
               child: const Text("one"),
             ),
           ),
            const SizedBox(height: 20),
            Expanded(
              flex: 3,
              child:  Container(
                padding: const EdgeInsets.all(20.0),
                color: Colors.blue,
                child: const Text("one"),
              ),
            ),
            Expanded(
              flex: 2,
              child:  Container(
                padding: const EdgeInsets.all(20.0),
                color: Colors.green,
                child: const Text("one"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
