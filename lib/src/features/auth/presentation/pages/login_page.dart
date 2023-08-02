import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/presentation/bloc/user/bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final fullnameController = TextEditingController();

    String inputLogin;
    String inputPassword;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(80),
                child: Icon(
                  Icons.lock,
                  size: 120,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Insert full name to unlock the app",
                  textAlign: TextAlign.left,
                  style: textTheme.displaySmall
                      ?.copyWith(fontWeight: FontWeight.w900),
                  //.copyWith(color: Colors.black),
                ),
              ),
              Text(context.watch<UserBloc>().state is UserAuthorizedState
                  ? "Authenticated"
                  : "UnAuthenticated"),
              BlocBuilder<UserBloc, UserState>(
                buildWhen: (context, state) {
                  return state is UserAuthorizedState;
                },
                builder: (bloc, state) {
                  if (state is UserAuthorizedState) {
                    return const Text("authorized");
                  }
                  if (state is UserUnAuthorizedState) {
                    return const Text("Logged out");
                  }

                  return const Text("NO STATE");
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: fullnameController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: 'Enter full name',
                          labelText: 'Full name',
                        ),
                        onChanged: (value) {
                          inputLogin = value;
                        },
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
                            BlocProvider.of<UserBloc>(context)
                                .add(EnterUserEvent(fullname));
                          }
                        },
                        child: Text(
                          context.read<UserBloc>().state is LoadingUserState
                              ? "Loading..."
                              : "UNLOCK",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
