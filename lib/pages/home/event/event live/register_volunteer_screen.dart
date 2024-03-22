
import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/models/event/event.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

class RegisterVolunteerFormPage extends StatefulWidget {
  final String? id;
  final int? index;

  const RegisterVolunteerFormPage({
    Key? key,
    this.id,
    this.index,
    }) : super(key: key);

  @override
  State<RegisterVolunteerFormPage> createState() => _RegisterVolunteerFormPageState();
}

class _RegisterVolunteerFormPageState extends State<RegisterVolunteerFormPage> {
  final TextEditingController _volunteerNameController =
      TextEditingController();
  final TextEditingController _volunteerContactController =
      TextEditingController();
  final TextEditingController _volunteerAdressController =
      TextEditingController();
      final TextEditingController _volunteerIcController =
      TextEditingController();
  final TextEditingController _volunteerEmailController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
      EventVolunteerProvider eventVolunteer =
        Provider.of<EventVolunteerProvider>(context);
        
    return Scaffold(
      appBar: AppBar(
        title: Text(Translation.volunteerRegisterTitle.getString(context)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(Dimens.space16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpacerV(value: Dimens.space40,),
              buildTextField(
                controller: _volunteerNameController,
                labelText: Translation.personnelName.getString(context),
              ),
              SpacerV(value: Dimens.space16),
              buildTextField(
                controller: _volunteerAdressController,
                labelText: Translation.personnelAdress.getString(context),
              ),
              SpacerV(value: Dimens.space16),
              buildTextField(
                controller: _volunteerIcController,
                labelText: Translation.personnelIc.getString(context),
              ),
              SpacerV(value: Dimens.space16),
              buildTextField(
                controller: _volunteerContactController,
                labelText: Translation.personnelContact.getString(context),
              ),
              SpacerV(value: Dimens.space16),
              buildTextField(
                controller: _volunteerEmailController,
                labelText: Translation.personnelEmail.getString(context),
              ),
              SpacerV(value: Dimens.space16),
              SizedBox(
                width: double.infinity,
                height: Dimens.space40,
                child: ElevatedButton(
                  onPressed: () async {
                    final newVolunteer = VolunteerModel(
                      id: widget.id,
                      volunteerName: _volunteerNameController.text ,
                      volunteerContact: _volunteerContactController.text,
                      volunteerIc: _volunteerIcController.text,
                      volunteerAdress: _volunteerAdressController.text,
                      volunteerEmail: _volunteerEmailController.text,
                    );

                    eventVolunteer.createVolunteerDetails(newVolunteer);

                    //[@TODO YUSRI] Later for display all volunteer name
                    //await eventVolunteer.fetchAllVolunteerDetails(widget.id);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventPostingDescriptionPage(index: widget.index,)
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
                    Translation.submit.getString(context),
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