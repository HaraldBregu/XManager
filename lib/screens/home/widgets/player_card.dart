import 'package:flutter/material.dart';
import 'package:xmanager/screens/widget/base_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PlayerCard extends StatefulWidget {
  final String title, name;

  const PlayerCard({
    Key? key,
    this.title = "",
    this.name = ""}) : super(key: key);

  @override
  State<PlayerCard> createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {
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
                  child: Text(
                    widget.title,
                    style: const TextStyle(
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
      body:  Row(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24
              ),
            ),
          ),
        ],
      ),
      footer: const SizedBox(height: 0),
    );
  }
}
