import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:xmanager/src/presentation/bloc/bloc.dart';
import 'package:xmanager/src/presentation/screens/login/bloc/login_bloc.dart';
import 'package:xmanager/src/presentation/screens/login/bloc/login_event.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /*  Future<void> _showErrorDialog() async {
      return showDialog<void>(
        context: context,
        //barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error login'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('This is a demo alert dialog.'),
                  Text('Would you like to approve of this message?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Password recovery'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
*/
    //List<int> nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;
    //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    //final fullnameController = TextEditingController();

    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          /*Positioned(
            top: 0, //display after the height of top widtet
            bottom: 150, //display untill the height of bottom widget
            left: 0,
            right: 0,
            //mention top, bottom, left, right, for full size widget
            child: SingleChildScrollView(
              //content widget tree
              child: Column(
                children: nums.map((num) {
                  return Container(
                    width: double.infinity, //width 100%;
                    height: 80,
                    padding: EdgeInsets.all(20),
                    color: num % 2 == 0 ? Colors.black87 : Colors.grey,
                    child: Text("Box $num"),
                  );
                }).toList(),
              ),
            ),
          ),*/
/*
          //set top/bottom widget after content,
          //other wise it wil go below content
          Positioned(
            //position at top
            top: 0,
            left: 0,
            right: 0, //set left right to 0 for 100% width
            child: Container(
              //your top widget tree
              height: 80,
              color: Colors.blueAccent,
            ),
          ),*/

          Positioned(
            top: 0, //display after the height of top widtet
            bottom: 250, //display untill the height of bottom widget
            left: 0,
            right: 0,
            child: PageView(
              onPageChanged: (index) {},
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Boost your Training!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            //color: Colors.white,
                            fontSize: textTheme.headlineMedium?.fontSize,
                            //fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          "Start training your Team and track every part of the session",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            //color: Colors.white,
                            fontSize: textTheme.bodyLarge?.fontSize,
                            //fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Track your data!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            //color: Colors.white,
                            fontSize: textTheme.headlineMedium?.fontSize,
                            //fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          "Start training your Team and track every part of the session",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            //color: Colors.white,
                            fontSize: textTheme.bodyLarge?.fontSize,
                            //fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Learn and improve",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            //color: Colors.white,
                            fontSize: textTheme.headlineMedium?.fontSize,
                            //fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          "Start training your Team and track every part of the session",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            //color: Colors.white,
                            fontSize: textTheme.bodyLarge?.fontSize,
                            //fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Train and Track",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            //color: Colors.white,
                            fontSize: textTheme.headlineMedium?.fontSize,
                            //fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          "Start training your Team and track every part of the session",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            //color: Colors.white,
                            fontSize: textTheme.bodyLarge?.fontSize,
                            //fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 150,
            height: 100,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DotsIndicator(
                      dotsCount: 5,
                      position: 2,
                      decorator: DotsDecorator(
                        //color: colorScheme.onPrimary,
                        activeColor: colorScheme.secondary,
                        //size: const Size(9, 9),
                        //activeSize: const Size(9.0, 9.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 150,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(right: 7.5),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              //minimumSize: const Size(300, 50),
                              minimumSize: const Size.fromHeight(50),
                              /*shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.elliptical(9, 9),
                                ),
                              ),*/
                            ),
                            onPressed: () {
                              //_showErrorDialog();

                              /*
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  content: Container(
                                    padding: EdgeInsets.all(15),
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: context.colorScheme.errorContainer,
                                    ),
                                    child: const Text(
                                      "Login error, please do something else",
                                    ),
                                  ),
                                ),
                              );
                            */

                              //context.read<UserBloc>().add(StartUserEvent());
                              context.read<LoginBloc>().add(StartLoginEvent());
                              context.goNamed("login screen");

                              //Navigator.of(context).pop();
                            },
                            child: const Text("Log In"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 7.5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // backgroundColor: colorScheme.tertiary,
                              minimumSize: const Size.fromHeight(50),
                              //  shape: const RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.all(
                              //     Radius.elliptical(9, 9),
                              //   ),
                              // ),
                            ),
                            onPressed: null,
                            //onPressed: () => context.goNamed("signup"),
                            child: const Text("Join Now"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: const Size.fromHeight(30),
                          // shape: const RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.all(
                          //     Radius.elliptical(9, 9),
                          //   ),
                          // ),
                        ),
                        onPressed: () {
                          //context.goNamed("dashboard");
                        },
                        child: const Text("Continue as Guest"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
    ;
  }
}

// ignore: unused_element
class _StartPageBody extends StatelessWidget {
  const _StartPageBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            //minimumSize: const Size(300, 50),
                            minimumSize: const Size.fromHeight(60),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.elliptical(9, 9),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text("Log In"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            //minimumSize: const Size(300, 50),
                            minimumSize: const Size.fromHeight(60),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.elliptical(9, 9),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text("Join Now"),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),

        /*
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                //minimumSize: const Size(300, 50),
                minimumSize: const Size.fromHeight(60),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(9, 9),
                  ),
                ),
              ),
              onPressed: () {},
              child: Text("fdkvjnd"),
            ),
          ),
        ),
     */
      ],
    );
  }
}

/*
class _LoginHeader extends StatelessWidget {
  const _LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      title: Text("Login"),
      centerTitle: true,
    );
  }
}

class _LoginContainer extends StatelessWidget {
  const _LoginContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final fullnameController = TextEditingController();

    return SliverToBoxAdapter(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Icon(
              Icons.lock,
              size: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Insert full name to unlock the app, full name to unlock the app.",
              textAlign: TextAlign.left,
              style:
                  textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
              //.copyWith(color: Colors.black),
            ),
          ),
          Padding(
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
                  const SizedBox(height: 20.0),
                  TextFormField(
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    obscuringCharacter: "*",
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
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
                  const SizedBox(height: 20.0),
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
                          : "LOGIN",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
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
                      : "LOGIN",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
*/
