import 'package:flutter/material.dart';
import 'screens/home/home.dart';
import 'screens/auth/login.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    brightness: Brightness.light
  ),
  darkTheme: ThemeData(
      brightness: Brightness.dark
  ),
  initialRoute: '/home',
  routes: {
    '/home': (context) => Home(),
    '/login': (context) => Login(value: ""),
  },
));