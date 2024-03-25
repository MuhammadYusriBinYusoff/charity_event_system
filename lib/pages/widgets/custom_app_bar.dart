import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:charity_event_system/common/common.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String? title;

  CustomAppBar({Key? key, this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    EventDetailsProvider eventDetailsFile =
        Provider.of<EventDetailsProvider>(context);
        
    return AppBar(
      backgroundColor: Palette.purpleMain,
      title: Center(
        child: Text(
          title ?? '',
          style: const TextStyle(color: Palette.white, fontSize: 18),
        ),
      ),
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
                      Navigator.pop(context);
                    },
                    child: Text(Translation.cancel.getString(context)),
                  ),
                  TextButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      eventDetailsFile.resetEventDetails();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
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
    );
  }
}
