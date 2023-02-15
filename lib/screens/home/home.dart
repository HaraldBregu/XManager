import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:xmanager/main.dart';
import 'package:xmanager/screens/home/widgets/header_actions.dart';
import 'package:xmanager/screens/home/widgets/player_card_section.dart';
import 'package:xmanager/screens/home/widgets/training_card.dart';
import 'package:xmanager/screens/home/widgets/weather_card.dart';
import 'package:xmanager/screens/home/widgets/widget_dialog.dart';
import 'package:xmanager/services/http_client.dart';
import 'package:xmanager/common.dart';
import '../../models/models.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var stringData = 'Login';
  List users = [];
  int playersCount = 0;

  fetchData() async {
    var url = 'https://jsonplaceholder.typicode.com/todos';
    var response = await HttpClient().get(url).catchError((onError) {

    });
    var items = json.decode(response);
    //print(items);
    setState(() {
      users = items;
    });
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.dashboard,
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actionsIconTheme: const IconThemeData(
            size: 30.0,
            color: Colors.white,
            opacity: 10.0
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: true, // user must tap button!
                    builder: (BuildContext context) {
                      return const WidgetDialog(
                        title: "ds",
                        descriptions: "ds.cjnsdlkcn",
                        text: "f.dkhvbdflbch",
                      );
                    },
                  );
                },
                child: const Icon(
                    Icons.widgets
                ),
              )
          ),
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'account');
                },
                child: const Icon(
                    Icons.account_circle
                ),
              )
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 70),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  ((BuildContext context, int index) {
                    switch (index) {
                      case 0:
                        {
                          return HeaderActions(
                            optionsPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => _buildPopupDialog(context),
                              );
                            },

                          );
                        }
                      case 1:
                        {
                          return const TrainingCard();
                        }
                      case 2:
                        {
                          return const WeatherCard();
                        }
                    }
                  }),
                  childCount: 2),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  ((BuildContext context, int index) {
                    return Column(
                      children: const [
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Players',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    );
                  }),
                  childCount: 1),
            ),
            const PlayerCardSection(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {

          Navigator.pushNamed(
              context,
              'player_edit');

          return;
          Navigator.pushNamed(context, 'player_edit');
          return;
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Widget"),
                  content: const Text("Enable and disable widgets"),
                  actions: <Widget>[
                    // usually buttons at the bottom of the dialog
                    TextButton(
                      child: const Text("Close"),
                      onPressed: () {
                        //Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
        },
        backgroundColor: Colors.green,
        icon: const Icon(Icons.add),
        label: const Text('NEW'),

      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Popup example'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Hello"),
        ],
      ),
      actions: <Widget>[
        Text("data")
      ],
    );
  }

}



