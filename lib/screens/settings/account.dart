import 'package:flutter/material.dart';
import 'package:xmanager/screens/settings/permissions.dart';

class Account extends StatefulWidget   {

  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  var switched = false;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: const Text("Account"),
          backgroundColor: Colors.black,
          centerTitle: true,
          elevation: 0
      ),

      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 60,
            color: const Color.fromRGBO(32, 33, 36, 1.0),
            margin: const EdgeInsets.only(bottom: 5),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Permissions',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const Permissions()));

                                  },
                                  child: Text("Permissions"))
                            ],
                          )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 60,
            color: const Color.fromRGBO(32, 33, 36, 1.0),
            margin: const EdgeInsets.only(bottom: 5),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Dark mode',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Switch(
                                // This bool value toggles the switch.
                                value: switched,
                                activeColor: Colors.red,
                                onChanged: (bool value) {
                                  // This is called when the user toggles the switch.
                                  setState(() {
                                    switched = value;
                                  });
                                },
                              ),
                              GestureDetector(
                                onTap: () {
                                },
                                child: const SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Icon(
                                    Icons.bar_chart,
                                    color: Colors.white70,
                                    size: 22.0,
                                  ),
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 60,
            color: const Color.fromRGBO(32, 33, 36, 1.0),
            margin: const EdgeInsets.only(bottom: 5),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Sound effect',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Switch(
                                // This bool value toggles the switch.
                                value: switched,
                                activeColor: Colors.red,
                                onChanged: (bool value) {
                                  // This is called when the user toggles the switch.
                                  setState(() {
                                    switched = value;
                                  });
                                },
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 60,
            color: const Color.fromRGBO(32, 33, 36, 1.0),
            margin: const EdgeInsets.only(bottom: 5),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Dark mode',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Switch(
                                // This bool value toggles the switch.
                                value: switched,
                                activeColor: Colors.red,
                                onChanged: (bool value) {
                                  // This is called when the user toggles the switch.
                                  setState(() {
                                    switched = value;
                                  });
                                },
                              ),
                              GestureDetector(
                                onTap: () {
                                },
                                child: const SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Icon(
                                    Icons.bar_chart,
                                    color: Colors.white70,
                                    size: 22.0,
                                  ),
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 60,
            color: const Color.fromRGBO(32, 33, 36, 1.0),
            margin: const EdgeInsets.only(bottom: 5),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Sound effect',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Switch(
                                // This bool value toggles the switch.
                                value: switched,
                                activeColor: Colors.red,
                                onChanged: (bool value) {
                                  // This is called when the user toggles the switch.
                                  setState(() {
                                    switched = value;
                                  });
                                },
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 60,
            color: const Color.fromRGBO(32, 33, 36, 1.0),
            margin: const EdgeInsets.only(bottom: 5),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Dark mode',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Switch(
                                // This bool value toggles the switch.
                                value: switched,
                                activeColor: Colors.red,
                                onChanged: (bool value) {
                                  // This is called when the user toggles the switch.
                                  setState(() {
                                    switched = value;
                                  });
                                },
                              ),
                              GestureDetector(
                                onTap: () {
                                },
                                child: const SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Icon(
                                    Icons.bar_chart,
                                    color: Colors.white70,
                                    size: 22.0,
                                  ),
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 60,
            color: const Color.fromRGBO(32, 33, 36, 1.0),
            margin: const EdgeInsets.only(bottom: 5),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Sound effect',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Switch(
                                // This bool value toggles the switch.
                                value: switched,
                                activeColor: Colors.red,
                                onChanged: (bool value) {
                                  // This is called when the user toggles the switch.
                                  setState(() {
                                    switched = value;
                                  });
                                },
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}












