import 'package:flutter/material.dart';

import 'package:myapp_project1/screen1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHomePage extends StatefulWidget {
  const ScreenHomePage({super.key});

  @override
  State<ScreenHomePage> createState() => _ScreenHomePage();
}

class _ScreenHomePage extends State<ScreenHomePage> {
  signout(BuildContext context) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.clear();

    // ignore: use_build_context_synchronously
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const ScreenLoginPage()),
        (route) => false);
  }

  popoutfuction(BuildContext context) {
    return Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 61, 82, 109),
      appBar: AppBar(
        title: const Text("home page"),
        backgroundColor: const Color.fromARGB(231, 117, 137, 152),
        leading: const Icon(Icons.home),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        elevation: 20,
        actions: [
          IconButton(
              onPressed: (() {
                showDialog(
                    context: context,
                    builder: ((ctx1) {
                      return AlertDialog(
                        title: const Text('Warning!!!'),
                        content: const Text('do you want to really exit?'),
                        actions: [
                          TextButton(
                            onPressed: (() {
                              popoutfuction(context);
                              // Navigator.of(ctx1).pop();
                            }),
                            child: const Text(' cancel'),
                          ),
                          TextButton(
                            onPressed: (() {
                              signout(context);
                              // Navigator.of(ctx1).pop();
                            }),
                            child: const Text('ok'),
                          ),
                        ],
                      );
                    }));
              }),
              icon: const Icon(Icons.logout))
        ],
      ),
      body: SafeArea(
          child: ListView.separated(
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text(
                    'Person ${index + 1}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    '${index + 5} min ago',
                    style: const TextStyle(color: Colors.white),
                  ),
                  leading: (index % 3 != 0)
                      ? const CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage('lib/assets/images/first1.jpg'),
                        )
                      : ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: 54,
                            minHeight: 54,
                            maxWidth: 64,
                            maxHeight: 64,
                          ),
                          child: Image.asset('lib/assets/images/first2.jpg'),
                        ),
                  trailing: Text(
                    '${index + 5}:00 PM',
                    style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(221, 252, 248, 250)),
                  ),
                );
              },
              separatorBuilder: (ctx, index) {
                return const Divider();
              },
              itemCount: 6)),
    );
  }
}
