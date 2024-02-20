import 'package:charity_event_system/common/resources/resources.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Perform log out action
              // For example, you can show a confirmation dialog
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(Translation.logOutTitle.getString(context)),
                  content: Text(Translation.logOutMsg.getString(context)),
                  actions: [
                    TextButton(
                      onPressed: () {
                        // Close the dialog
                        Navigator.pop(context);
                      },
                      child: Text(Translation.cancel.getString(context)),
                    ),
                    TextButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                      },
                      child: Text(Translation.logout.getString(context)),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Image.asset(
              'assets/images/spiral-logo.png',
              fit: BoxFit.cover,
            ),
            SvgPicture.asset(
              'assets/images/sss.svg',
              width: 100,
              height: 100,
            ),
            SvgPicture.asset(
              'assets/images/spiral-logo.svg',
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}