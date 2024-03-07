import 'dart:io';

import 'package:charity_event_system/common/resources/resources.dart';
import 'package:charity_event_system/models/models.dart';
import 'package:charity_event_system/pages/home/event/event.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EventDescriptionPage extends StatefulWidget {
  const EventDescriptionPage({Key? key}) : super(key: key);

  @override
  _EventDescriptionPageState createState() => _EventDescriptionPageState();
}

class _EventDescriptionPageState extends State<EventDescriptionPage> {
  final TextEditingController _charityEventTitleController =
      TextEditingController();
  final TextEditingController _charityEventDescriptionController =
      TextEditingController();

  TextStyle textStyle = const TextStyle(
    fontFamily: 'Roboto',
  );

  String? bannerImageUrl;
  bool isLoading = false;

  Future<XFile?> pickImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    print('${file?.path}');
    return file;
  }

  // Function to upload image to Firebase Storage
  Future<void> uploadImage(XFile file, String? userId) async {
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages =
        referenceRoot.child('eventMainBanner').child(userId ?? '');
    Reference referenceImageToUpload = referenceDirImages.child(file.name);

    try {
      setState(() {
        isLoading = true; // Show loading indicator
      });
      await referenceImageToUpload.putFile(File(file.path));
      bannerImageUrl = await referenceImageToUpload.getDownloadURL();
      setState(() {
        bannerImageUrl = bannerImageUrl;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    OrganizerProvider organizationUser =
        Provider.of<OrganizerProvider>(context);
    EventDetailsProvider eventDetailsFile =
        Provider.of<EventDetailsProvider>(context);

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
                Translation.photoPosting.getString(context),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SpacerV(
                value: Dimens.space8,
              ),
              SinglePhotoAddingButton(
                width: double.infinity,
                height: Dimens.space160,
                bannerImageUrl: bannerImageUrl,
                onPressed: () async {
                  XFile? file = await pickImage(); 

                  if (file != null) {
                    await uploadImage(file,
                        organizationUser.organizers.id);
                  }
                },
              ),
              SpacerV(value: Dimens.space24),
              Text(
                Translation.eventTitle.getString(context),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SpacerV(
                value: Dimens.space8,
              ),
              buildTextField(
                controller: _charityEventTitleController,
                hintText: Translation.pleaseHintText.getString(context),
              ),
              SpacerV(value: Dimens.space24),
              Text(
                Translation.eventDescription.getString(context),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SpacerV(
                value: Dimens.space8,
              ),
              buildTextField(
                controller: _charityEventDescriptionController,
                hintText: Translation.pleaseHintText.getString(context),
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
                      type: "organizer",
                    );

                    eventDetailsFile.createEventDetails(newEvent);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EventItemAddPage(),
                      ),
                    );
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
