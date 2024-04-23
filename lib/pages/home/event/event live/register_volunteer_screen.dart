import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/models/event/event.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class RegisterVolunteerFormPage extends StatefulWidget {
  final String? id;
  final int? index;

  const RegisterVolunteerFormPage({
    Key? key,
    this.id,
    this.index,
  }) : super(key: key);

  @override
  State<RegisterVolunteerFormPage> createState() =>
      _RegisterVolunteerFormPageState();
}

class _RegisterVolunteerFormPageState extends State<RegisterVolunteerFormPage> {
  final TextEditingController _volunteerNameController =
      TextEditingController();
  final TextEditingController _volunteerContactController =
      TextEditingController();
  final TextEditingController _volunteerAdressController =
      TextEditingController();
  final TextEditingController _volunteerIcController = TextEditingController();
  final TextEditingController _volunteerEmailController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    EventVolunteerProvider eventVolunteer =
        Provider.of<EventVolunteerProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(
          title: Translation.volunteerRegisterTitle.getString(context)),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(Dimens.space16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpacerV(
                value: Dimens.space40,
              ),
              CustomTextField(
                controller: _volunteerNameController,
                labelText: Translation.personnelName.getString(context),
                compulsory: true,
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _volunteerAdressController,
                labelText: Translation.personnelAdress.getString(context),
                compulsory: true,
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _volunteerIcController,
                labelText: Translation.personnelIc.getString(context),
                compulsory: true,
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _volunteerContactController,
                labelText: Translation.personnelContact.getString(context),
                compulsory: true,
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _volunteerEmailController,
                labelText: Translation.personnelEmail.getString(context),
                compulsory: true,
              ),
              SpacerV(value: Dimens.space16),
              SizedBox(
                width: double.infinity,
                height: Dimens.space40,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_volunteerNameController.text.isNotEmpty &&
                        _volunteerAdressController.text.isNotEmpty &&
                        _volunteerIcController.text.isNotEmpty &&
                        _volunteerContactController.text.isNotEmpty &&
                        _volunteerEmailController.text.isNotEmpty) {
                      String newId = const Uuid().v4();
                      final newVolunteer = VolunteerModel(
                        id: newId,
                        volunteerName: _volunteerNameController.text,
                        volunteerContact: _volunteerContactController.text,
                        volunteerIc: _volunteerIcController.text,
                        volunteerAdress: _volunteerAdressController.text,
                        volunteerEmail: _volunteerEmailController.text,
                      );
                      eventVolunteer.createVolunteerDetails(
                          newVolunteer, widget.id);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EventPostingDescriptionPage(
                                  index: widget.index,
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
