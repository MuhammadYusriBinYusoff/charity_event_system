
import 'dart:io';

import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/models/models.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:image_picker/image_picker.dart';

class PersonnelSignUpPage extends StatefulWidget {
  const PersonnelSignUpPage({Key? key}) : super(key: key);

  @override
  State<PersonnelSignUpPage> createState() => _PersonnelSignUpPageState();
}

class _PersonnelSignUpPageState extends State<PersonnelSignUpPage> {
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
              SpacerV(value: Dimens.space32,),
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
                  value: Dimens.space32,
                ),
              buildTextField(
                controller: _personnelNameController,
                labelText: Translation.personnelName.getString(context),
              ),
              SpacerV(value: Dimens.space16),
              buildTextField(
                controller: _personnelContactController,
                labelText: Translation.personnelContact.getString(context),
              ),
              SpacerV(value: Dimens.space16),
              buildTextField(
                controller: _personnelAdressController,
                labelText: Translation.personnelAdress.getString(context),
              ),
              SpacerV(value: Dimens.space16),
              buildTextField(
                controller: _personnelEmailController,
                labelText: Translation.personnelEmail.getString(context),
              ),
              SpacerV(value: Dimens.space16),
              buildTextField(
                controller: _personnelPasswordController,
                labelText: Translation.personnelPassword.getString(context),
                obscureText: true,
              ),
              SpacerV(value: Dimens.space16),
              SizedBox(
                width: double.infinity,
                height: Dimens.space40,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                        final userCredential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: _personnelEmailController.text,
                          password: _personnelPasswordController.text,
                        );
                        final String? userUID = userCredential.user?.uid;
          
                        final newUser = PersonnelModel(
                          id: userUID,
                          personnelName: _personnelNameController.text,
                          personnelContact: _personnelContactController.text,
                          personnelAdress: _personnelAdressController.text,
                          personnelEmail: _personnelEmailController.text,
                          personnelPassword: _personnelPasswordController.text,
                          profileImageLink: imageUrl,
                        ).toJson();
          
                        await FirebaseFirestore.instance
                            .collection("personnelAccount")
                            .doc(userUID)
                            .set(newUser);
          
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
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