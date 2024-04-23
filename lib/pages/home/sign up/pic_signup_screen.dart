import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/models/models.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

class PICSignUpPage extends StatefulWidget {
  final String? organizationName;
  final String? organizationContact;
  final String? organizationAddress;
  final String? organizationLink;
  final String? profileImageLink;

  const PICSignUpPage({
    Key? key,
    this.organizationName,
    this.organizationContact,
    this.organizationAddress,
    this.organizationLink,
    this.profileImageLink,
  }) : super(key: key);

  @override
  State<PICSignUpPage> createState() => _PICSignUpPageState();
}

class _PICSignUpPageState extends State<PICSignUpPage> {
  final TextEditingController _picNameController = TextEditingController();
  final TextEditingController _picContactController = TextEditingController();
  final TextEditingController _picIcController = TextEditingController();
  final TextEditingController _picAdressController = TextEditingController();
  final TextEditingController _picEmailController = TextEditingController();
  final TextEditingController _picPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    OrganizerProvider organizationUser =
        Provider.of<OrganizerProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(Translation.signupTitle.getString(context)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dimens.space16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                controller: _picNameController,
                labelText: Translation.picFullname.getString(context),
                compulsory: true,
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _picContactController,
                labelText: Translation.picContact.getString(context),
                compulsory: true,
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _picIcController,
                labelText: Translation.picIcNumber.getString(context),
                compulsory: true,
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _picAdressController,
                labelText: Translation.picAdress.getString(context),
                compulsory: true,
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _picEmailController,
                labelText: Translation.picEmail.getString(context),
                compulsory: true,
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _picPasswordController,
                labelText: Translation.picPassword.getString(context),
                compulsory: true,
                obscureText: true,
              ),
              SpacerV(value: Dimens.space16),
              SizedBox(
                width: double.infinity,
                height: Dimens.space40,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_picNameController.text.isNotEmpty &&
                        _picContactController.text.isNotEmpty &&
                        _picIcController.text.isNotEmpty &&
                        _picAdressController.text.isNotEmpty &&
                        _picEmailController.text.isNotEmpty &&
                        _picPasswordController.text.isNotEmpty) {
                      try {
                        final userCredential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: _picEmailController.text,
                          password: _picPasswordController.text,
                        );
                        final String? userUID = userCredential.user?.uid;

                        final newUser = OrganizerModel(
                          id: userUID,
                          picName: _picNameController.text,
                          picContact: _picContactController.text,
                          picIc: _picIcController.text,
                          picAdress: _picAdressController.text,
                          picEmail: _picEmailController.text,
                          picPassword: _picPasswordController.text,
                          organizationName: widget.organizationName,
                          organizationContact: widget.organizationContact,
                          organizationAdress: widget.organizationAddress,
                          organizationLink: widget.organizationLink,
                          profileImageLink: widget.profileImageLink,
                        );

                        organizationUser.createOrganizer(newUser);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
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
                    Translation.signupTitle.getString(context),
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
