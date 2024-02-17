import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

class PICSignUpPage extends StatefulWidget {
  const PICSignUpPage({Key? key}) : super(key: key);

  @override
  State<PICSignUpPage> createState() => _PICSignUpPageState();
}

class _PICSignUpPageState extends State<PICSignUpPage> {
  final TextEditingController _picNameController =
      TextEditingController();
  final TextEditingController _picContactController =
      TextEditingController();
  final TextEditingController _picIcController =
      TextEditingController();
  final TextEditingController _picAdressController =
      TextEditingController();
  final TextEditingController _picEmailController =
      TextEditingController();
  final TextEditingController _picPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              buildTextField(
                controller: _picNameController,
                labelText: Translation.picFullname.getString(context),
              ),
              SpacerV(value: Dimens.space16),
              buildTextField(
                controller: _picContactController,
                labelText: Translation.picContact.getString(context),
              ),
              SpacerV(value: Dimens.space16),
              buildTextField(
                controller: _picIcController,
                labelText: Translation.picIcNumber.getString(context),
              ),
              SpacerV(value: Dimens.space16),
              buildTextField(
                controller: _picAdressController,
                labelText: Translation.picAdress.getString(context),
              ),
              SpacerV(value: Dimens.space16),
              buildTextField(
                controller: _picEmailController,
                labelText: Translation.picEmail.getString(context),
              ),
              SpacerV(value: Dimens.space16),
              buildTextField(
                controller: _picPasswordController,
                labelText: Translation.picPassword.getString(context),
                obscureText: true,
              ),
              SpacerV(value: Dimens.space16),
              SizedBox(
                width: double.infinity,
                height: Dimens.space40,
                child: ElevatedButton(
                  onPressed: () {
                    // String orgaizationName = _organizationNameController.text;
                    // String organizationContact =
                    //     _organizationContactController.text;
                    // String organizationAdress =
                    //     _organizationAdressController.text;
                    // String organizationLink = _organizationLinkController.text;
                    // // You can add your login logic here
                    // print(
                    //     'Name: $orgaizationName, Contact: $organizationContact, Adress: $organizationAdress, Link: $organizationLink');
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