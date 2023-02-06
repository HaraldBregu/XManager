import 'package:flutter/material.dart';
import 'package:xmanager/screens/home/widgets/home_card.dart';

class WeatherCard extends StatefulWidget {
  const WeatherCard({Key? key}) : super(key: key);

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: HomeCard(
            padding: EdgeInsets.only(left: 15),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Wrap(
                      direction: Axis.vertical,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            "COACH",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, top: 10, bottom: 20),
                          child: Text(
                            "Dorian Joe",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: const Alignment(1, 0),
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("object 1");
                          },
                          child: const Padding(
                            padding: const EdgeInsets.all(15.0),
                            child:  Icon(
                              Icons.more_vert,
                              color: Colors.white70,
                              size: 22.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: HomeCard(
              padding: EdgeInsets.only(right: 15),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Wrap(
                      direction: Axis.vertical,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10, top: 20),
                          child: Text(
                            "COACH",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, top: 10, bottom: 20),
                          child: Text(
                            "Dorian Joe",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: const Alignment(1, 0),
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("object 1");
                          },
                          child: const Padding(
                            padding: const EdgeInsets.all(15.0),
                            child:  Icon(
                              Icons.more_vert,
                              color: Colors.white70,
                              size: 22.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
          ),
        )
      ],
    );
  }
}
