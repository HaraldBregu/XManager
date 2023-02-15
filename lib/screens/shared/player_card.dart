import 'package:flutter/material.dart';
import 'package:xmanager/screens/shared/base_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum PlayerCardOptionMenu { Delete, Edit, Detail }

class PlayerCard extends StatefulWidget {
  final String title, name;
  final Function(PlayerCardOptionMenu)? onOptionSelected;

  const PlayerCard({
    Key? key,
    this.title = "",
    this.name = "",
    this.onOptionSelected}) : super(key: key);

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
                        /*
                        GestureDetector(
                          onTap: () {
                          },
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: Icon(
                              Icons.bar_chart,
                              color: Colors.white70,
                              size: 22.0,
                            ),
                          ),
                        ),*/
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: PopupMenuButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.white70,
                              size: 22.0,
                            ),
                            onSelected: (item) {
                              var optFunc = widget.onOptionSelected as Function(PlayerCardOptionMenu);
                              optFunc(item);
                            },
                            itemBuilder: (BuildContext context) => <PopupMenuEntry<PlayerCardOptionMenu>>[
                              const PopupMenuItem<PlayerCardOptionMenu>(
                                value: PlayerCardOptionMenu.Detail,
                                child: Text('Show Data'),
                              ),
                              const PopupMenuItem<PlayerCardOptionMenu>(
                                value: PlayerCardOptionMenu.Edit,
                                child: Text('Edit'),
                              ),
                              const PopupMenuItem<PlayerCardOptionMenu>(
                                value: PlayerCardOptionMenu.Delete,
                                child: Text('Delete'),
                              ),
                            ],
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
