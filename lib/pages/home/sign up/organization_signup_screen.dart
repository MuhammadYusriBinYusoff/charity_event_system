import 'dart:io';
import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _organizationNumberController =
      TextEditingController();
  final TextEditingController _organizationNameController =
      TextEditingController();
  final TextEditingController _organizationContactController =
      TextEditingController();
  final TextEditingController _organizationAdressController =
      TextEditingController();
  final TextEditingController _organizationLinkController =
      TextEditingController();

  String? imageUrl;
  bool isLoading = false;

  bool isChecked = false;

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translation.signupTitle.getString(context)),
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
                controller: _organizationNumberController,
                labelText: Translation.organizationNumber.getString(context),
                compulsory: true,
                maxWords: 30,
              ),
              SpacerV(
                value: Dimens.space16,
              ),
              CustomTextField(
                controller: _organizationNameController,
                labelText: Translation.organizationName.getString(context),
                compulsory: true,
                multiLine: true,
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _organizationContactController,
                labelText: Translation.organizationContact.getString(context),
                compulsory: true,
                maxWords: 12,
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _organizationAdressController,
                labelText: Translation.organizationAdress.getString(context),
                compulsory: true,
                multiLine: true,
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _organizationLinkController,
                labelText: Translation.organizationLink.getString(context),
                compulsory: true,
              ),
              SpacerV(value: Dimens.space16),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.green,
                checkColor: Colors.white,
                title: Text(
                    Translation.organizationRosCheck.getString(context),
                    style: TextStyle(fontSize: 12),),
                value: isChecked,
                selected: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              SpacerV(value: Dimens.space16),
              SizedBox(
                width: double.infinity,
                height: Dimens.space40,
                child: ElevatedButton(
                  onPressed: () {
                    if (_organizationNumberController.text.isNotEmpty &&
                        _organizationNameController.text.isNotEmpty &&
                        _organizationContactController.text.isNotEmpty &&
                        _organizationAdressController.text.isNotEmpty &&
                        _organizationLinkController.text.isNotEmpty &&
                        isChecked == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PICSignUpPage(
                                  organizationNumber:
                                      _organizationNumberController.text,
                                  organizationName:
                                      _organizationNameController.text,
                                  organizationContact:
                                      _organizationContactController.text,
                                  organizationAddress:
                                      _organizationAdressController.text,
                                  organizationLink:
                                      _organizationLinkController.text,
                                  profileImageLink: imageUrl,
                                )),
                      );
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
                    Translation.next.getString(context),
                    style: const TextStyle(color: Palette.white),
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
