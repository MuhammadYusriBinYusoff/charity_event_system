
import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/models/models.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translation.signupTitle.getString(context)),
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimens.space16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                        personnelPassword: _personnelPasswordController.text 
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
    );
  }
}