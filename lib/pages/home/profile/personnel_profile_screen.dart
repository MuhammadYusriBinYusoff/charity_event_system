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
class PersonnelProfilePage extends StatefulWidget {
  String? personnelName;
  String? personnelContact;
  String? personnelAdress;
  String? personnelEmail;
  String? personnelPassword;
  String? profileImageLink;

  PersonnelProfilePage({
    Key? key,
    this.personnelName,
    this.personnelContact,
    this.personnelAdress,
    this.personnelEmail,
    this.personnelPassword,
    this.profileImageLink,
  }) : super(key: key);

  @override
  State<PersonnelProfilePage> createState() => _PersonnelProfilePageState();
}

class _PersonnelProfilePageState extends State<PersonnelProfilePage> {
  final TextEditingController _personnelNameController =
      TextEditingController();
  final TextEditingController _personnelContactController =
      TextEditingController();
  final TextEditingController _personnelAdressController =
      TextEditingController();
  final TextEditingController _personnelEmailController =
      TextEditingController();
  final TextEditingController _personnelPasswordController =
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
  Future<void> uploadImage(XFile file, String? userId) async {
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages =
        referenceRoot.child('profileImage').child(userId ?? '');
    Reference referenceImageToUpload = referenceDirImages.child(file.name);

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
    _personnelNameController.text = widget.personnelName ?? "";
    _personnelContactController.text = widget.personnelContact ?? "";
    _personnelAdressController.text = widget.personnelAdress ?? "";
    _personnelEmailController.text = widget.personnelEmail ?? "";
    _personnelPasswordController.text = widget.personnelPassword ?? "";
    imageUrl = widget.profileImageLink;
  }

  @override
  Widget build(BuildContext context) {
    OrganizerProvider organizationUser =
        Provider.of<OrganizerProvider>(context);
    PersonnelProvider personnelUser = Provider.of<PersonnelProvider>(context);

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
                          await uploadImage(
                              file,
                              organizationUser
                                  .organizers.id); // Step 2: upload image
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
                controller: _personnelNameController,
                labelText: Translation.personnelName.getString(context),
                compulsory: true,
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _personnelContactController,
                labelText: Translation.personnelContact.getString(context),
                compulsory: true,
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _personnelAdressController,
                labelText: Translation.personnelAdress.getString(context),
                compulsory: true,
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _personnelEmailController,
                labelText: Translation.personnelEmail.getString(context),
                compulsory: true,
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _personnelPasswordController,
                labelText: Translation.personnelPassword.getString(context),
                compulsory: true,
              ),
              SpacerV(value: Dimens.space16),
              SizedBox(
                width: double.infinity,
                height: Dimens.space40,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_personnelEmailController.text.isNotEmpty &&
                        _personnelPasswordController.text.isNotEmpty &&
                        _personnelNameController.text.isNotEmpty &&
                        _personnelContactController.text.isNotEmpty &&
                        _personnelAdressController.text.isNotEmpty) {
                      try {
                        String? userId = personnelUser.personnels.id;

                        Map<String, dynamic> dataToUpdate = {
                          'personnelName': _personnelNameController.text,
                          'personnelContact': _personnelContactController.text,
                          'personnelAdress': _personnelAdressController.text,
                          'personnelEmail': _personnelEmailController.text,
                          'personnelPassword':
                              _personnelPasswordController.text,
                          'profileImageLink': imageUrl,
                        };

                        await personnelUser.updatePersonnelData(
                            userId, dataToUpdate);

                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomePage(
                                    title: '',
                                  )),
                        );
                      } catch (error) {
                        print("Error: $error");
                      }
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => ErrorAlertDialog(
                          title: Translation.errorTitle.getString(context),
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
                      borderRadius: BorderRadius.circular(Dimens.space8),
                    ),
                  ),
                  child: Text(
                    Translation.save.getString(context),
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
