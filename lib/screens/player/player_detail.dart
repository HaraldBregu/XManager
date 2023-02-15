import 'package:flutter/material.dart';
import 'package:xmanager/screens/shared/base_card.dart';
import 'package:xmanager/screens/shared/detail_card.dart';
import 'package:xmanager/models/models.dart';
import '../../main.dart';

class PlayerDetail extends StatefulWidget {
  const PlayerDetail({Key? key}) : super(key: key);

  @override
  State<PlayerDetail> createState() => _PlayerDetailState();
}

class _PlayerDetailState extends State<PlayerDetail> {
  Player? player;

  @override
  Widget build(BuildContext context) {

    player = ModalRoute.of(context)?.settings.arguments as Player?;
    player ??= Player();

    print(player);
    print(player?.name);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: const Text("Player profile"),
          backgroundColor: const Color.fromRGBO(29, 29, 29, 1.0),
          centerTitle: true,
          elevation: 0
      ),
      body: ListView(
          padding: const EdgeInsets.all(15),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Text(
                  player?.name ?? "-",
                  style: TextStyle(
                    //backgroundColor: Colors.red,
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "player_edit", arguments: player);
                    }, child: Row(
                  children: const [
                     Text('Modifica', style: TextStyle(fontSize: 12, color: Colors.black12),),
                  ],))
              ],
            ),
            const SizedBox(height: 20),
            DetailCard(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue.withAlpha(30),
                      child: const Icon(
                        Icons.train,
                        size: 25,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Ore totali di training",
                      style: TextStyle(
                        //backgroundColor: Colors.red,
                        color: Colors.white,
                        fontSize: 19,
                      ),
                    )
                  ],
                )
            ),
            const SizedBox(height: 10),
            DetailCard(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue.withAlpha(30),
                      child: const Icon(
                        Icons.train,
                        size: 25,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Ore totali di training",
                      style: TextStyle(
                        //backgroundColor: Colors.red,
                        color: Colors.white,
                        fontSize: 19,
                      ),
                    )
                  ],
                )
            ),
          ]),
    );
  }
}
