import 'dart:io';
import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class OrganizationProfilePage extends StatefulWidget {
  String? organizationName;
  String? organizationContact;
  String? organizationAdress;
  String? organizationLink;
  String? profileImageLink;

  OrganizationProfilePage({
    Key? key,
    this.organizationName,
    this.organizationContact,
    this.organizationAdress,
    this.organizationLink,
    this.profileImageLink,
  }) : super(key: key);

  @override
  State<OrganizationProfilePage> createState() =>
      _OrganizationProfilePageState();
}

class _OrganizationProfilePageState extends State<OrganizationProfilePage> {
  TextEditingController _organizationNameController =
      TextEditingController();
  TextEditingController _organizationContactController =
      TextEditingController();
  TextEditingController _organizationAdressController =
      TextEditingController();
  TextEditingController _organizationLinkController =
      TextEditingController();

  String? imageUrl;
  bool isLoading = false;

  Future<XFile?> pickImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    print('${file?.path}');
    return file;
  }

  // Function to upload image to Firebase Storage
  Future<void> uploadImage(XFile file) async {
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('profileImage');
    Reference referenceImageToUpload = referenceDirImages.child('${file.name}');

    try {
      setState(() {
        isLoading = true; // Show loading indicator
      });
      await referenceImageToUpload.putFile(File(file.path));
      imageUrl = await referenceImageToUpload.getDownloadURL();
      setState(() {
        imageUrl = imageUrl;
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
  void initState() {
    super.initState();
    _organizationNameController.text = widget.organizationName ?? "";
    _organizationContactController.text = widget.organizationContact ?? "";
    _organizationAdressController.text = widget.organizationAdress ?? "";
    _organizationLinkController.text = widget.organizationLink ?? "";
    imageUrl = widget.profileImageLink;
  }

  @override
  Widget build(BuildContext context) {
    OrganizerProvider organizationUser =
        Provider.of<OrganizerProvider>(context);
    EventDetailsProvider eventDetailsFile =
        Provider.of<EventDetailsProvider>(context);
    EventDonationProvider eventDonationsFile =
        Provider.of<EventDonationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(Dimens.space16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpacerV(
                value: Dimens.space32,
              ),
              Stack(
                children: [
                  Center(
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : imageUrl != null
                            ? CircleAvatar(
                                radius: Dimens.space64,
                                backgroundImage: NetworkImage(imageUrl ??
                                    'https://firebasestorage.googleapis.com/v0/b/charity-event-cems.appspot.com/o/images%2Fyusss.jpg?alt=media&token=fa38b153-50cc-474c-8774-6c5943fee4c2'),
                              )
                            : CircleAvatar(
                                radius: Dimens.space64,
                                backgroundImage: const NetworkImage(
                                    'https://cdn-icons-png.flaticon.com/512/7915/7915522.png'),
                              ),
                  ),
                  Positioned(
                    bottom: -10,
                    right: Dimens.space100,
                    child: IconButton(
                      onPressed: () async {
                        XFile? file = await pickImage(); // Step 1: pick image

                        if (file != null) {
                          await uploadImage(file); // Step 2: upload image
                        }
                      },
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  ),
                ],
              ),
              SpacerV(
                value: Dimens.space64,
              ),
              CustomTextField(
                controller: _organizationNameController,
                labelText: Translation.organizationName.getString(context),
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _organizationContactController,
                labelText: Translation.organizationContact.getString(context),
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _organizationAdressController,
                labelText: Translation.organizationAdress.getString(context),
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _organizationLinkController,
                labelText: Translation.organizationLink.getString(context),
              ),
              SpacerV(value: Dimens.space16),
              SizedBox(
                width: double.infinity,
                height: Dimens.space40,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      String? userId = organizationUser.organizers.id;

                      Map<String, dynamic> dataToUpdate = {
                        'organizationName': _organizationNameController.text,
                        'organizationContact':
                            _organizationContactController.text,
                        'organizationAdress': _organizationAdressController.text,
                        'organizationLink': _organizationLinkController.text,
                        'profileImageLink': imageUrl,
                      };

                      await organizationUser.updateOrganizerData(
                          userId, dataToUpdate);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyHomePage(
                                  title: '',
                                )),
                      );
                    } catch (error) {
                      print("Error: $error");
                    }
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
}
