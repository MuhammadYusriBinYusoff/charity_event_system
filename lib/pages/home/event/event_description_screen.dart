import 'package:charity_event_system/common/resources/resources.dart';
import 'package:charity_event_system/models/models.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';



class EventDescriptionPage extends StatefulWidget {
  const EventDescriptionPage({Key? key}) : super(key: key);

  @override
  _EventDescriptionPageState createState() => _EventDescriptionPageState();
}

class _EventDescriptionPageState extends State<EventDescriptionPage> {
  final TextEditingController _charityEventTitleController = TextEditingController();
  final TextEditingController _charityEventDescriptionController = TextEditingController();

  TextStyle textStyle = const TextStyle(
    fontFamily: 'Roboto',
  );

  @override
  Widget build(BuildContext context) {
    OrganizerProvider organizationUser = Provider.of<OrganizerProvider>(context);
    EventDetailsProvider eventDetailsFile = Provider.of<EventDetailsProvider>(context);

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
        child: Container(
          padding: EdgeInsets.all(Dimens.space16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpacerV(value: Dimens.space64),
              Text(
                "Charity Event Title",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SpacerV(value: Dimens.space8,),
              buildTextField(
                controller: _charityEventTitleController,
                hintText: "Please write here",
              ),
              SpacerV(value: Dimens.space24),
              Text(
                "Description",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SpacerV(value: Dimens.space8,),
              buildTextField(
                controller: _charityEventDescriptionController,
                hintText: "Please write here",
                multiLine: true,
              ),
              SpacerV(value: Dimens.space24),
              SizedBox(
                width: double.infinity,
                height: Dimens.space40,
                child: ElevatedButton(
                  onPressed: () async {
                    final userUID = organizationUser.organizers.id;
                    final newEvent = EventDetailsModel(
                        id: userUID,
                        eventName: _charityEventTitleController.text,
                        eventDescription: _charityEventDescriptionController.text,
                      );

                      eventDetailsFile.createEventDetails(newEvent);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Palette.purpleMain,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Dimens.space8),
                    ),
                  ),
                  child: Text(
                    Translation.next.getString(context),
                    style: const TextStyle(
                        color: Palette.white, fontFamily: 'Roborto'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _charityEventTitleController.dispose();
    _charityEventDescriptionController.dispose();
    super.dispose();
  }
}
