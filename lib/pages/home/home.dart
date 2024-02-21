import 'package:charity_event_system/common/resources/resources.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    OrganizerProvider organizationUser =
        Provider.of<OrganizerProvider>(context);

    return Scaffold(
      backgroundColor: Palette.purpleLow,
      appBar: AppBar(
        backgroundColor: Palette.purpleMain,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 100.0,
              color: Palette.purpleMain,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SpacerV(
                        value: Dimens.space16,
                      ),
                      Text(
                        "Hello ${organizationUser.organizers.picName}",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ), // Added space between the text and the avatar
                      const Text(
                        "Organizer",
                        style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle circle icon tap
                      print("Test Organization data at home.dart");
                      print(organizationUser.organizers.id);
                      print(organizationUser.organizers.organizationName);
                      print("============");
                    },
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundColor:
                          Palette.grey, // Change the color as needed
                      child: Icon(Icons.person, size: 40, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SpacerV(
              value: Dimens.space16,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
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
                  SvgPicture.asset(
                    'assets/images/spiral-logo.svg',
                    width: 100,
                    height: 100,
                  ),
                  SvgPicture.asset(
                    'assets/images/spiral-logo.svg',
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
          ],
        ),
      ),
    );
  }
}
