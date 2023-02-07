import 'package:flutter/material.dart';

import 'package:myapp_project1/main.dart';
import 'package:myapp_project1/screen2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLoginPage extends StatefulWidget {
  const ScreenLoginPage({super.key});

  @override
  State<ScreenLoginPage> createState() => _ScreenLoginPage();
}

class _ScreenLoginPage extends State<ScreenLoginPage> {
  final String uname = "moon";
  final String pword = "9747";
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();
  bool _isDataMatched = true;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 61, 82, 109),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formkey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                          height: 100,
                          width: 1000,
                          // color: Colors.amber,
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Color.fromARGB(244, 211, 213, 235),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      const SizedBox(
                        height: 30.0,
                      ),

                      // Image.asset(
                      //   'lib/assets/images/dq.jpg',

                      // ),
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: _usernameController,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          label: const Text("username",
                              style: TextStyle(color: Colors.white)),
                        ),
                        validator: (value) {
                          // if (_isDataMatched) {
                          //   return null;
                          // } else {
                          //   return ' error';
                          // }
                          if (value == null || value.isEmpty) {
                            return 'value is empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: _passwordController,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          label: const Text("password",
                              style: TextStyle(color: Colors.white)),
                        ),
                        validator: (value) {
                          // if (_isDataMatched)  {
                          //   return null;
                          // } else {
                          //   return ' error';
                          // }
                          if (value == null || value.isEmpty) {
                            return 'value is empty';
                          } else {
                            return null;
                          }
                        },
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Visibility(
                            visible: !_isDataMatched,
                            child: const Text(
                              'username password doesnot match',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 176, 39, 39)),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  checkLogin(context);
                                } else {
                                  // ignore: avoid_print
                                  print('data empty');
                                }
                              },
                              child: const Text('login'),
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 5, 49, 85))),
                        ],
                      ),

                      // ignore: prefer_const_constructors
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  // ignore: dead_code
  void checkLogin(BuildContext context) async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username == uname && password == pword) {
      // ignore: avoid_print
      print('username and password match');
      //Goto home

      final sharedPrefs = await SharedPreferences.getInstance();
      await sharedPrefs.setBool(SAVE_KEY_NAME, true);

      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx1) => const ScreenHomePage()));
    } else {
      const errorMessage = 'username password doesnot match';

//snackbar
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //   behavior: SnackBarBehavior.floating,
      //   backgroundColor: Colors.red,
      //   margin: EdgeInsets.all(10),
      //   content: Text(errorMessage),
      //   duration: Duration(seconds: 10),
      // ));

//show text
      setState(() {
        _isDataMatched = false;
      });
      // ignore: avoid_print
      print('username and password not match');
    }
  }
}
