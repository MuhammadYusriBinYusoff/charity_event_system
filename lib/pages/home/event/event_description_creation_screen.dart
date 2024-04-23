import 'dart:io';
import 'package:charity_event_system/common/resources/resources.dart';
import 'package:charity_event_system/models/models.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EventDescriptionPage extends StatefulWidget {
  final String? imageUrl;
  final String? title;
  final String? description;
  final String? session;

  const EventDescriptionPage({
    Key? key,
    this.imageUrl,
    this.title,
    this.description,
    this.session,
  }) : super(key: key);

  @override
  _EventDescriptionPageState createState() => _EventDescriptionPageState();
}

class _EventDescriptionPageState extends State<EventDescriptionPage> {
  final TextEditingController _charityEventTitleController =
      TextEditingController();
  final TextEditingController _charityEventDescriptionController =
      TextEditingController();

  String? bannerImageUrl;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _charityEventTitleController.text = widget.title ?? "";
    _charityEventDescriptionController.text = widget.description ?? "";
    bannerImageUrl = widget.imageUrl ?? "";
  }

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
        isLoading = true;
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
      backgroundColor: Palette.lightGrey,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const QuoteCard(
              imagePath: Images.societyIcon,
              quote:
                  "All of you are shepherds and each of you is responsible for his flock.",
              author: "- Hadis Riwayat Al-Bukhari",
            ),
            Container(
              padding: EdgeInsets.all(Dimens.space16),
              color: Palette.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Translation.eventInfoTitle.getString(context),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    Translation.eventInfoSub.getString(context),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SpacerV(
                    value: Dimens.space20,
                  ),
                  SinglePhotoAddingButton(
                    width: double.infinity,
                    height: Dimens.space200,
                    bannerImageUrl: bannerImageUrl,
                    onPressed: () async {
                      XFile? file = await pickImage();

                      if (file != null) {
                        await uploadImage(file, organizationUser.organizers.id);
                      }
                    },
                  ),
                  SpacerV(value: Dimens.space24),
                  CustomTextField(
                    controller: _charityEventTitleController,
                    labelText: Translation.eventTitle.getString(context),
                    compulsory: true,
                  ),
                  SpacerV(value: Dimens.space24),
                  CustomTextField(
                    controller: _charityEventDescriptionController,
                    labelText: Translation.eventDescription.getString(context),
                    multiLine: true,
                    compulsory: true,
                  ),
                  SpacerV(value: Dimens.space24),
                  SizedBox(
                    width: double.infinity,
                    height: Dimens.space40,
                    child: widget.session == "update"
                        ? ElevatedButton(
                            onPressed: () async {
                              final userUID = organizationUser.organizers.id;
                              final newEvent = EventDetailsModel(
                                id: userUID,
                                eventName: _charityEventTitleController.text,
                                eventDescription:
                                    _charityEventDescriptionController.text,
                                type: "organizer",
                                photoEventUrl: bannerImageUrl,
                              );
                              eventDetailsFile.updateEventDetails(newEvent);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyHomePage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Palette.purpleMain,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimens.space8),
                              ),
                            ),
                            child: Text(
                              Translation.save.getString(context),
                              style: const TextStyle(color: Palette.white),
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () async {
                              if (_charityEventTitleController
                                      .text.isNotEmpty &&
                                  _charityEventDescriptionController
                                      .text.isNotEmpty) {
                                final userUID = organizationUser.organizers.id;
                                final newEvent = EventDetailsModel(
                                  id: userUID,
                                  eventName: _charityEventTitleController.text,
                                  eventDescription:
                                      _charityEventDescriptionController.text,
                                  type: "organizer",
                                  photoEventUrl: bannerImageUrl,
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EventGalleryPage(newEvent: newEvent,),
                                  ),
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) => ErrorAlertDialog(
                                    title: Translation.errorTitle
                                        .getString(context),
                                    content: Translation.errorFieldNotFilled
                                        .getString(context),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Palette.purpleMain,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimens.space8),
                              ),
                            ),
                            child: Text(
                              Translation.next.getString(context),
                              style: const TextStyle(color: Palette.white),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
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
