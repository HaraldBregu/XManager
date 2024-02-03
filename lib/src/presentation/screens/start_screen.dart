import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xmanager/src/core/theme_extension.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
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
                              fontSize:
                                  context.textTheme.headlineMedium?.fontSize,
                              //fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            "Start training your Team and track every part of the session",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              //color: Colors.white,
                              fontSize: context.textTheme.bodyLarge?.fontSize,
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
                              fontSize:
                                  context.textTheme.headlineMedium?.fontSize,
                              //fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            "Start training your Team and track every part of the session",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              //color: Colors.white,
                              fontSize: context.textTheme.bodyLarge?.fontSize,
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
                              fontSize:
                                  context.textTheme.headlineMedium?.fontSize,
                              //fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            "Start training your Team and track every part of the session",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              //color: Colors.white,
                              fontSize: context.textTheme.bodyLarge?.fontSize,
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
                              fontSize:
                                  context.textTheme.headlineMedium?.fontSize,
                              //fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            "Start training your Team and track every part of the session",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              //color: Colors.white,
                              fontSize: context.textTheme.bodyLarge?.fontSize,
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
                          activeColor: context.colorScheme.secondary,
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
                                minimumSize: const Size.fromHeight(55),
                              ),
                              onPressed: () {
                                context.goNamed("login screen");
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize:
                                      context.textTheme.bodyLarge?.fontSize,
                                  fontFamily:
                                      context.textTheme.bodyLarge?.fontFamily,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(left: 7.5),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(55),
                              ),
                              onPressed: () {
                                context.pushNamed("signup screen");
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize:
                                      context.textTheme.bodyLarge?.fontSize,
                                  fontFamily:
                                      context.textTheme.bodyLarge?.fontFamily,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(top: 15),
                        child: Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Continue as guest',
                                  style: TextStyle(
                                    color: context.colorScheme.primary,
                                    fontSize:
                                        context.textTheme.titleMedium?.fontSize,
                                    fontFamily: context
                                        .textTheme.titleMedium?.fontFamily,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap =
                                        () => context.goNamed("signup screen"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
