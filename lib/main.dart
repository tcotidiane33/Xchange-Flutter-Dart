import 'package:flutter/material.dart';
// import 'package:flutter_foodybite/screens/main_screen.dart';
import 'package:flutter_foodybite/screens/categories.dart';
import 'package:flutter_foodybite/screens/home.dart';
import 'package:flutter_foodybite/screens/label.dart';
import 'package:flutter_foodybite/screens/notifications.dart';
import 'package:flutter_foodybite/screens/profile.dart';
import 'package:flutter_foodybite/util/const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: Constants.lightTheme,
      darkTheme: Constants.darkTheme,
      home: Home(),
      routes: {
        '/categories': (context) => Categories(),
        // '/messages': (context) => Messages(),
        '/label': (context) => Label(),
        '/notifications': (context) => Notifications(),
        '/profile': (context) => Profile(),
      },
    );
  }
}
