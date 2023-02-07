import 'package:flutter/material.dart';

import 'package:myapp_project1/main.dart';
import 'package:myapp_project1/screen1.dart';
import 'package:myapp_project1/screen2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    CheckUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Text(
        'Welcome',
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
        textAlign: TextAlign.center,
      )),
    );
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return const ScreenLoginPage();
    }));
  }

  // ignore: non_constant_identifier_names
  Future<void> CheckUserLoggedIn() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    // _sharedPrefs.setBool(SAVE_KEY_NAME, true);
    sharedPrefs.getBool(SAVE_KEY_NAME);
    final userLoggedIn = sharedPrefs.getBool(SAVE_KEY_NAME);
    if (userLoggedIn == null || userLoggedIn == false) {
      gotoLogin();
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context1) => const ScreenHomePage()));
    }
  }
}
