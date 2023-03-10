import 'package:flutter/material.dart';
import 'package:xmanager/data/models/models.dart';
import 'package:xmanager/main.dart';

import '../../../core/constants/common.dart';


class ProgramCreate extends StatefulWidget {
  final SessionProgram? program;
  const ProgramCreate({Key? key, required this.program}) : super(key: key);

  @override
  State<ProgramCreate> createState() => _ProgramCreateState();
}

class _ProgramCreateState extends State<ProgramCreate> {
  final _formKey = GlobalKey<FormState>();
  final _programName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AppLocalizations? localize = AppLocalizations.of(context);
    SessionProgram program = widget.program ?? SessionProgram();
    _programName.text = program.title;

    /// Save data and pop back
    void saveSessionProgram() {
      if (_formKey.currentState!.validate()) {

        var deviceProgram = DeviceProgram();
        deviceProgram.title = "Test device";

        program.title = _programName.text;
        program.createdAt = DateTime.now();
        program.updatedAt = DateTime.now();
        program.programs = [deviceProgram, deviceProgram];
        objectBox.sessionProgramBox.put(program);
        Navigator.pop(context, program);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(localize?.create_program_title ?? "-"),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 80),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              ListTile(
               contentPadding: EdgeInsets.zero,
               title: Text(localize?.create_program_description ?? "-"),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _programName,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 18),
                  prefixIcon: const Icon(Icons.developer_board_outlined),
                  hintText: localize?.create_program_field_name ?? "-",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return localize?.create_program_field_name_error;
                  }
                  return null;
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        width: double.infinity,
        child: FloatingActionButton.extended(
          label: Text(localize?.save_program.toUpperCase() ?? ""),
          onPressed: () => saveSessionProgram(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
