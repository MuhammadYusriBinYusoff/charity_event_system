import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/models/models.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

class MonitorOrganizer extends StatefulWidget {
  const MonitorOrganizer({super.key});

  @override
  State<MonitorOrganizer> createState() => _MonitorOrganizerState();
}

class _MonitorOrganizerState extends State<MonitorOrganizer> {
  final TextEditingController _picNameController = TextEditingController();
  final TextEditingController _picContactController = TextEditingController();
  final TextEditingController _picIcController = TextEditingController();
  final TextEditingController _picAdressController = TextEditingController();
  final TextEditingController _picEmailController = TextEditingController();
  final TextEditingController _picVerifiedController = TextEditingController();
  final TextEditingController _picCurrentScoreController =
      TextEditingController();
  final TextEditingController _organizationNameController =
      TextEditingController();
  String selectedOrganizerName = "";
  String selectedOrganizerId = "";
  List<String> organizerNames = [];

  @override
  void initState() {
    OrganizerProvider organizationUser =
        Provider.of<OrganizerProvider>(context, listen: false);
    organizerNames = organizationUser.organizerList
        .where((organizer) => organizer.verify == "Verified")
        .map((organizer) => organizer.organizationName ?? '')
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    OrganizerProvider organizationUser =
        Provider.of<OrganizerProvider>(context);
    // EventFeedbackProvider eventFeedback =
    //     Provider.of<EventFeedbackProvider>(context);
    EventHistoryProvider eventHistory =
        Provider.of<EventHistoryProvider>(context);

    final List<String> statusVerified = ['Verified', 'Not Verified'];

    void updateFieldsBasedOnSelectedOrganizer(String organizerName) async {
      final selectedOrganizer = organizationUser.organizerList.firstWhere(
        (organizer) => organizer.organizationName == organizerName,
        orElse: () => OrganizerModel(),
      );

      _picNameController.text = selectedOrganizer.picName ?? '';
      _picContactController.text = selectedOrganizer.picContact ?? '';
      _picIcController.text = selectedOrganizer.picIc ?? '';
      _picAdressController.text = selectedOrganizer.picAdress ?? '';
      _picEmailController.text = selectedOrganizer.picEmail ?? '';
      _organizationNameController.text =
          selectedOrganizer.organizationName ?? '';

      // Fetch feedback details and update the state afterwards
      // eventFeedback.resetEventFeedback();
      // await eventFeedback.fetchAllFeedbackDetails(selectedOrganizer.id);
      eventHistory.resetEventHistory();
      await eventHistory.fetchAllHistoryDetails(selectedOrganizer.id);

      _picCurrentScoreController.text =
          eventHistory.getTotalCurrentScore().toString();

      setState(() {
        _picVerifiedController.text = selectedOrganizer.verify ?? '';
        selectedOrganizerId = selectedOrganizer.id ?? "";
      });
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: Translation.adminMonitorPerformance.getString(context),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(Dimens.space16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpacerV(
                value: Dimens.space16,
              ),
              CustomDropdownFormField(
                hint: Translation.adminSearchOrganizer.getString(context),
                hintText: Translation.adminOrganizationNamelist.getString(context),
                items: organizerNames,
                onChanged: (value) {
                  selectedOrganizerName = value ?? '';
                  updateFieldsBasedOnSelectedOrganizer(selectedOrganizerName);
                },
                validator: (value) {
                  if (value == null) {
                    return Translation.feedbackCheck.getString(context);
                  }
                  return null;
                },
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _picNameController,
                labelText: Translation.picFullname.getString(context),
                readOnly: true,
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _picContactController,
                labelText: Translation.picContact.getString(context),
                readOnly: true,
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _picIcController,
                labelText: Translation.picIcNumber.getString(context),
                readOnly: true,
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _picAdressController,
                labelText: Translation.picAdress.getString(context),
                readOnly: true,
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _picEmailController,
                labelText: Translation.picEmail.getString(context),
                readOnly: true,
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _picCurrentScoreController,
                labelText: Translation.overallScore.getString(context),
                readOnly: true,
              ),
              SpacerV(value: Dimens.space16),
              CustomDropdownFormField(
                hint: Translation.adminBlockOrganizer.getString(context),
                hintText: _picVerifiedController.text,
                items: statusVerified,
                onChanged: (value) {
                  setState(() {
                    _picVerifiedController.text = value ?? "";
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return Translation.feedbackCheck.getString(context);
                  }
                  return null;
                },
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
                        _picVerifiedController.text.isNotEmpty) {
                      try {
                        Map<String, dynamic> dataToUpdate = {
                          'picName': _picNameController.text,
                          'picContact': _picContactController.text,
                          'picIc': _picIcController.text,
                          'picAdress': _picAdressController.text,
                          'picEmail': _picEmailController.text,
                          'verify': _picVerifiedController.text,
                        };

                        await organizationUser.updatePicMoniterData(
                            selectedOrganizerId, dataToUpdate);

                        //eventFeedback.resetEventFeedback();
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AdminChosen()),
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
                        color: Palette.white,),
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
