import 'package:flutter/material.dart';

class ProgramCreate extends StatelessWidget {
  const ProgramCreate({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final fullnameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Create program")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: fullnameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'Program name',
                  labelText: 'Program name',
                ),
                onChanged: (value) {},
                onSaved: (value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (value) {
                  return value == null || value.isEmpty
                      ? 'Fullname is mandatory'
                      : null;
                },
              ),
              TextFormField(
                controller: fullnameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'Enter full name',
                  labelText: 'Full name',
                ),
                onChanged: (value) {},
                onSaved: (value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (value) {
                  return value == null || value.isEmpty
                      ? 'Fullname is mandatory'
                      : null;
                },
              ),
              TextFormField(
                controller: fullnameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'Enter full name',
                  labelText: 'Full name',
                ),
                onChanged: (value) {},
                onSaved: (value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (value) {
                  return value == null || value.isEmpty
                      ? 'Fullname is mandatory'
                      : null;
                },
              ),
              TextFormField(
                controller: fullnameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'Enter full name',
                  labelText: 'Full name',
                ),
                onChanged: (value) {},
                onSaved: (value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (value) {
                  return value == null || value.isEmpty
                      ? 'Fullname is mandatory'
                      : null;
                },
              ),
              const SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  //minimumSize: const Size(300, 50),
                  minimumSize: const Size.fromHeight(60),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.elliptical(9, 9),
                    ),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final fullname = fullnameController.text;
                    // BlocProvider.of<UserBloc>(context)
                    //     .add(EnterUserEvent(fullname));
                  }
                },
                child: Text("NEXT STEP"
                    // context.read<UserBloc>().state is LoadingUserState
                    //     ? "Loading..."
                    //     : "UNLOCK",
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
