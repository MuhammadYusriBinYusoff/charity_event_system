import 'package:charity_event_system/common/resources/resources.dart';
import 'package:charity_event_system/pages/home/event/event.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
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
            icon: const Icon(Icons.logout, color: Palette.white),
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
          children: <Widget>[
            Container(
              height: Dimens.space150,
              color: Palette.purpleMain,
              padding: EdgeInsets.all(Dimens.space8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SpacerV(
                        value: Dimens.space24,
                      ),
                      Text(
                        "Hello ${organizationUser.organizers.picName}",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Palette.white,
                        ),
                      ), // Added space between the text and the avatar
                      Text(
                        "${organizationUser.organizers.organizationName}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Palette.white,
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
                      backgroundColor: Palette.white,
                      child: Icon(Icons.person,
                          size: 40, color: Palette.purpleMain),
                    ),
                  ),
                ],
              ),
            ),
            SpacerV(
              value: Dimens.space16,
            ),
            Container(
              padding: EdgeInsets.all(Dimens.space16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    Translation.charity2024Title.getString(context),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    Translation.charity2024Subtitle.getString(context),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SpacerV(
                    value: Dimens.space16,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const ProductCard(
                          imageUrl:
                              'https://images.contentstack.io/v3/assets/blt8f1303966e806bd4/bltcf5dadc6004e8499/63e5185213c67c1128b58bab/DURRAT_AL_EIMAN_2.jpg',
                          title: 'Product Name',
                          description: 'Product description goes here.',
                        ),
                        SpacerH(
                          value: Dimens.space8,
                        ),
                        const ProductCard(
                          imageUrl:
                              'https://images.contentstack.io/v3/assets/blt8f1303966e806bd4/bltcf5dadc6004e8499/63e5185213c67c1128b58bab/DURRAT_AL_EIMAN_2.jpg',
                          title: 'Product Name',
                          description: 'Product description goes here.',
                        ),
                        SpacerH(
                          value: Dimens.space8,
                        ),
                        const ProductCard(
                          imageUrl:
                              'https://images.contentstack.io/v3/assets/blt8f1303966e806bd4/bltcf5dadc6004e8499/63e5185213c67c1128b58bab/DURRAT_AL_EIMAN_2.jpg',
                          title: 'Product Name',
                          description: 'Product description goes here.',
                        ),
                      ],
                    ),
                  ),
                  SpacerV(
                    value: Dimens.space32,
                  ),
                  Text(
                    Translation.myEventTitle.getString(context),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    Translation.myEventSubtitle.getString(context),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SpacerV(
                    value: Dimens.space16,
                  ),
                  FileAddingCard(
                    title: 'Add New File',
                    description: 'Tap here to add a new file',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventDescriptionPage(),
                        ),
                      );
                    },
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
