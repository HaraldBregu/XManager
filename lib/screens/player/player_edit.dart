import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:xmanager/common.dart';
import 'package:xmanager/models/models.dart';
import '../../main.dart';
import '../../objectbox.g.dart';


class PlayerEdit extends StatefulWidget {
  const PlayerEdit({Key? key}) : super(key: key);

  @override
  State<PlayerEdit> createState() => _PlayerEditState();
}

class _PlayerEditState extends State<PlayerEdit> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _roleController = TextEditingController();
  final _weightController = TextEditingController();
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();

  Player? player;

  @override
  Widget build(BuildContext context) {

    player = ModalRoute.of(context)?.settings.arguments as Player?;
    player ??= Player();

    print(player);
    print(player?.name);

    _nameController.text = player?.name ?? "";
    _roleController.text = player?.role ?? "";
    _weightController.text = player?.weight?.toString() ?? "";
    _ageController.text = player?.age?.toString() ?? "";
    _heightController.text = player?.height?.toString() ?? "";

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Player"),
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 80),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
                    hintText: 'Inserisci il nome completo',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
                  ),
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _roleController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Ruolo',
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
                    hintText: 'Inserisci il ruolo',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
                  ),
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Peso',
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
                    hintText: 'Inserisci il peso del giocatore',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
                  ),
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Età',
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
                    hintText: 'Inserisci il peso del giocatore',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
                  ),
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Altezza',
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
                    hintText: "Inserisci l'altezza",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
                  ),
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        //color: Colors.red,
        width: double.infinity,
        height: 50,
        child: FloatingActionButton.extended(
          backgroundColor: Colors.blue,
          label: const Text('SAVE'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          onPressed: () {

            if (_formKey.currentState!.validate() && player != null) {

              player?.name = _nameController.text;
              player?.age = int.tryParse(_ageController.text);
              player?.weight = double.tryParse(_weightController.text);
              player?.height = double.tryParse(_heightController.text);
              player?.role = _roleController.text;

              print(_formKey.currentState);
              print(player?.name);
              print(player?.role);

              objectBox.playerBox.put(player!);
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
