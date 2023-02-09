import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:xmanager/screens/widget/base_card.dart';

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
          child: BaseCard(
              margin: const EdgeInsets.only(left: 15),
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 15),
              header: Container(
                alignment: Alignment.centerLeft,
                height: 30,
                child: const Text(
                  'METEO',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12
                  ),
                ),
              ),
              body: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 40,
                          child: const Text(
                            '23 °C',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 27
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              footer: const SizedBox(height: 0),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: BaseCard(
              margin: const EdgeInsets.only(right: 15),
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 15),
              header: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(9)),
                ),
              ),
              body: Container(
                alignment: Alignment.centerLeft,
                height: 30,
                child: const Text(
                  'Posizione',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12
                  ),
                ),
              ),
              footer: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 40,
                          child: const Text(
                            '23 C',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 27
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
          ),
        )
      ],
    );


    /*
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: BaseCard(
            padding: const EdgeInsets.only(left: 15),
              cardPadding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 15),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 30,
                    child: const Text(
                      'METEO',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 40,
                              child: const Text(
                                '23 °C',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 27
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              )
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: BaseCard(
              padding: const EdgeInsets.only(right: 15),
              cardPadding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 15),
              child: Column(
                children: [
                  Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(),
                      borderRadius: const BorderRadius.all(Radius.circular(9)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 30,
                    child: const Text(
                      'Posizione',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 40,
                              child: const Text(
                                '23 C',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 27
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              )
          ),
        )
      ],
    );

    */
  }
}
