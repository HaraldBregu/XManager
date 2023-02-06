import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xmanager/screens/home/home.dart';
import 'dart:convert' as convert;
import 'package:xmanager/services/http_client.dart';

class Login extends StatefulWidget {
  final String value;

  const Login({Key? key, required this.value}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int counter = 0;

  void getData() async {

    var response = await HttpClient().get('https://jsonplaceholder.typicode.com/todos/1').catchError((onError) {});
    if (response != null) {
      //print(response.toString());
      //Navigator.of(context).pop(response);
      /*Navigator.pop(context, {
        'title' : 'harald'
      });*/
      Navigator.pushReplacement(
        context,
          PageRouteBuilder(
            pageBuilder: (BuildContext context, Animation<double> animation1, Animation<double> animation2) {
              return const Home();
            },
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ));

      var val = widget.value;
      //Navigator.pop(context, response.toString());
      //Navigator.pushReplacementNamed(context, '/home');
      //Navigator.pop(context);
    }

    //var response = await http.get(url);
    /*
    print("test");

    print(response.body.toString());

    if (response.statusCode == 200) {
      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }*/

    /*
    await Future.delayed(Duration(seconds: 3), () {
      print("joshy");
    });

    Future.delayed(Duration(seconds: 3), () {
      print("joshy");
    });*/
  }
  
  @override
  void initState() {
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Login"),
        centerTitle: true,
        elevation: 0,
      ),
      body: TextButton.icon(
        onPressed: (){
            setState(() {
              counter += 1;
            });
        },
        icon: Icon(Icons.login),
        label: Text("counter is $counter"),
      ),
    );
  }
}
