import 'package:flutter/material.dart';

class ProgramCreate extends StatelessWidget {
  const ProgramCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const _ProgramBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: ElevatedButton(
          onPressed: () {
            /*if (_formKey.currentState!.validate()) {
              final fullname = fullnameController.text;
              // BlocProvider.of<UserBloc>(context)
              //     .add(EnterUserEvent(fullname));
            }*/
          },
          child: const Center(
            child: Text('NEXT STEP'
                // context.read<UserBloc>().state is LoadingUserState
                //     ? "Loading..."
                //     : "UNLOCK",
                ),
          ),
        ),
      ),
    );
  }
}

class _ProgramBody extends StatelessWidget {
  const _ProgramBody({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final fullnameController = TextEditingController();

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text('Create program'),
          pinned: true,
          //snap: false,
          //floating: false,
          /*
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text("testo"),
          ),*/
          actions: [
            IconButton(
              icon: const Icon(Icons.usb),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.hardware),
              onPressed: () {},
            )
          ],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 8, 5, 0),
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
                ],
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 120,
          ),
        ),
      ],
    );
  }
}
