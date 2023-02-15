import 'package:flutter/material.dart';
import 'package:xmanager/screens/shared/base_card.dart';
import 'package:vibration/vibration.dart';

class TrainingCard extends StatefulWidget {

  const TrainingCard({Key? key}) : super(key: key);

  @override
  State<TrainingCard> createState() => _TrainingCardState();
}

class _TrainingCardState extends State<TrainingCard> {
  @override
  Widget build(BuildContext context) {

    return BaseCard(
      padding: const EdgeInsets.only(left: 15, right: 10, top: 10, bottom: 15),
      header: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: 30,
                  child: const Text(
                    'PROGRAM',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final hasVibrator = await Vibration.hasVibrator() ?? false;
                            if (hasVibrator) {
                              Vibration.vibrate();
                            }
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
                        GestureDetector(
                          onTap: (){},
                          child: const SizedBox(
                            height: 30,
                            width: 30,
                            child: Icon(
                              Icons.watch_later_rounded,
                              color: Colors.white70,
                              size: 22.0,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){},
                          child: const SizedBox(
                            height: 30,
                            width: 30,
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.white70,
                              size: 22.0,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){},
                          child: const SizedBox(
                            height: 30,
                            width: 30,
                            child: Icon(
                              Icons.wb_sunny_outlined,
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
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 30,
            child: const Text(
              'Fast training demo',
              style: TextStyle(
                  color: Colors.white54,
                  fontSize: 20
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SizedBox(
                  height: 10,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: TweenAnimationBuilder(
                      tween: Tween(begin: 0.0, end: 1.0),
                      duration: Duration(seconds: 10),
                      builder: (context, value, _) => const LinearProgressIndicator(
                        value: 0.7,
                        color: Colors.deepOrange,
                        backgroundColor: Colors.grey,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      footer:  Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: 40,
                  child: const Text(
                    '00:30:19',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 27
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                          },
                          child: const SizedBox(
                            height: 40,
                            width: 40,
                            child: Icon(
                              Icons.bar_chart,
                              color: Colors.white70,
                              size: 27.0,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                          },
                          child: const SizedBox(
                            height: 40,
                            width: 40,
                            child: Icon(
                              Icons.download,
                              color: Colors.white70,
                              size: 27.0,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                          },
                          child: const SizedBox(
                            height: 40,
                            width: 40,
                            child: Icon(
                              Icons.play_circle_fill,
                              color: Colors.white70,
                              size: 27.0,
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
    );
  }
}
