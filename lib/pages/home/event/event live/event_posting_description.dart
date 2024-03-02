import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/localization/locales.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

class EventPostingDescriptionPage extends StatefulWidget {
  const EventPostingDescriptionPage({Key? key}) : super(key: key);

  @override
  State<EventPostingDescriptionPage> createState() =>
      _EventPostingDescriptionPageState();
}

class _EventPostingDescriptionPageState
    extends State<EventPostingDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    OrganizerProvider organizationUser =
        Provider.of<OrganizerProvider>(context);
    EventDetailsProvider eventDetailsFile =
        Provider.of<EventDetailsProvider>(context);
    EventDonationProvider eventDonationsFile =
        Provider.of<EventDonationProvider>(context);

    return MaterialApp(
      home: Scaffold(
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
                            MaterialPageRoute(
                                builder: (context) => const EventPostingDescriptionPage()),
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
          child: Text(
            'Hello, World!',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
