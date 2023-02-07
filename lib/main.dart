import 'package:flutter/material.dart';
import 'package:myapp_project1/screen1.dart';
import 'package:myapp_project1/screen2.dart';
import 'package:myapp_project1/splash.dart';

// ignore: constant_identifier_names
const SAVE_KEY_NAME = 'userLoggedin';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { 
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      routes: {
        'screen_1': (context) {
          return const ScreenLoginPage();
        },
        'screen_2': (context) {
          return const ScreenHomePage();
        }
      },
    );
  }
}
