import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:xmanager/screens/home/widgets/header_actions.dart';
import 'package:xmanager/screens/home/widgets/coach_card.dart';
import 'package:xmanager/screens/home/widgets/program_card.dart';
import 'package:xmanager/screens/home/widgets/weather_card.dart';
import 'package:xmanager/screens/settings.dart';
import 'package:xmanager/services/http_client.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var stringData = 'Login';
  List users = [];


  fetchData() async {
    var url = 'https://jsonplaceholder.typicode.com/todos';
    var response = await HttpClient().get(url).catchError((onError) {

    });
    var items = json.decode(response);
    print(items);
    setState(() {
      users = items;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(16, 17, 18, 1.0),
      appBar: AppBar(
        title: const Text("Dashboard"),
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(20, 20, 20, 1.0),
        //shadowColor: Color.fromRGBO(70, 70, 70, 1.0),
        actionsIconTheme: const IconThemeData(
            size: 30.0,
            color: Colors.white,
            opacity: 10.0
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, 
                      MaterialPageRoute(
                          builder: (context) => const Settings()));
                },
                child: Icon(
                    Icons.account_circle
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Settings()));
                },
                child: Icon(
                    Icons.add
                ),
              )
          ),
        ],
      ),
      body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    ((BuildContext context, int index) {
                      switch (index) {
                        case 0: {
                          return HeaderActions();
                        }
                        case 1: {
                          return CoachCard();
                        }
                        case 2: {
                          return ProgramCard();
                        }
                        case 3: {
                          return WeatherCard();
                        }
                      }
                    }),
                    childCount: 4),
              ),

            ],
          )
      ),
    );
  }

  Widget _listView() {
    var headerItem = 1;
    var items = headerItem + users.length;

    return ListView.builder(
        itemCount: items,

        itemBuilder: (context, index) {
          if (index == 0) {
            return _actionHeaderItems();
          }
          return _listItem(users[index-1]);
        }
    );
  }

  Widget _actionHeaderItems() {
    return Container(
      padding: EdgeInsets.only(left: 15.0, top:10, right: 15, bottom: 30),
      child: Text(
        'DASHBOARD',
        style: TextStyle(
          color: Colors.white,

        ),
      ),
    );
  }
  
  Widget _listItem(user) {
    var fullName = user["userId"].toString();
    return Card(
      child: ListTile(
        title: Row(
          children: <Widget>[
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(60/2)
              ),
            ),
            SizedBox(width: 30,),
            Text(fullName),
          ],
        ),
      ),
    );
  }

}



