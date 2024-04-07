import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

class EventCollaborationPage extends StatefulWidget {
  const EventCollaborationPage({Key? key}) : super(key: key);

  @override
  State<EventCollaborationPage> createState() => _EventCollaborationPageState();
}

class _EventCollaborationPageState extends State<EventCollaborationPage> {
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            children: [
              SpacerV(value: Dimens.space56,),
              Container(padding:EdgeInsets.all(Dimens.space16), color: Palette.lightGrey, child: const MultiBoardListExample()),
              SpacerV(value: Dimens.space32,),
            ],
          ),
        ),
        );
  }
}

