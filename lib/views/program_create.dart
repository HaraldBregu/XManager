import 'package:flutter/material.dart';
import 'package:xmanager/common.dart';
import 'package:xmanager/shared/string_extension.dart';


class ProgramCreate extends StatefulWidget {
  const ProgramCreate({Key? key}) : super(key: key);

  @override
  State<ProgramCreate> createState() => _ProgramCreateState();
}

class _ProgramCreateState extends State<ProgramCreate> {
  final _formKey = GlobalKey<FormState>();
  final _programName = TextEditingController();


  @override
  Widget build(BuildContext context) {
    AppLocalizations? localize = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localize?.create_program.capitalize() ?? "-"),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 80),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
             const ListTile(
               contentPadding: EdgeInsets.zero,
                //title: Text("Crea un programma"),
               title: Text("Scegli il nome per il nuovo programma di allenamento, aggiungi delle sessioni, la durata e inizia ad usarla."),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _programName,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 18),
                  prefixIcon: Icon(Icons.person),
                  hintText: "Inserisci il nome del programma",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Errore nel inserimento nome el programma";
                  }
                  return null;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
