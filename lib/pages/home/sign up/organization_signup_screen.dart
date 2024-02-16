import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _organizationNameController =
      TextEditingController();
  final TextEditingController _organizationContactController =
      TextEditingController();
  final TextEditingController _organizationAdressController =
      TextEditingController();
  final TextEditingController _organizationLinkController =
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
              controller: _organizationNameController,
              labelText: Translation.organizationName.getString(context),
            ),
            SpacerV(value: Dimens.space16),
            buildTextField(
              controller: _organizationContactController,
              labelText: Translation.organizationContact.getString(context),
            ),
            SpacerV(value: Dimens.space16),
            buildTextField(
              controller: _organizationAdressController,
              labelText: Translation.organizationAdress.getString(context),
            ),
            SpacerV(value: Dimens.space16),
            buildTextField(
              controller: _organizationLinkController,
              labelText: Translation.organizationLink.getString(context),
            ),
            SpacerV(value: Dimens.space16),
            SizedBox(
              width: double.infinity,
              height: Dimens.space40,
              child: ElevatedButton(
                onPressed: () {
                  String orgaizationName = _organizationNameController.text;
                  String organizationContact =
                      _organizationContactController.text;
                  String organizationAdress =
                      _organizationAdressController.text;
                  String organizationLink = _organizationLinkController.text;
                  // You can add your login logic here
                  print(
                      'Name: $orgaizationName, Contact: $organizationContact, Adress: $organizationAdress, Link: $organizationLink');
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
