import 'package:charity_event_system/common/resources/resources.dart';
import 'package:charity_event_system/models/models.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class EventDonationManagementPage extends StatefulWidget {
  const EventDonationManagementPage({Key? key}) : super(key: key);

  @override
  _EventDonationManagementPageState createState() =>
      _EventDonationManagementPageState();
}

class _EventDonationManagementPageState
    extends State<EventDonationManagementPage> {
  final TextEditingController _targetMoneyController = TextEditingController();
  final TextEditingController _currentCollectedController =
      TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _bankAccountController = TextEditingController();

  TextStyle textStyle = const TextStyle(
    fontFamily: 'Roboto',
  );

  @override
  Widget build(BuildContext context) {
    OrganizerProvider organizationUser =
        Provider.of<OrganizerProvider>(context);
    EventDonationProvider eventDonation =
        Provider.of<EventDonationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.purpleMain,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Palette.white),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(Translation.logOutTitle.getString(context)),
                  content: Text(Translation.logOutMsg.getString(context)),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(Translation.cancel.getString(context)),
                    ),
                    TextButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      child: Text(Translation.logout.getString(context)),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(Dimens.space16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpacerV(value: Dimens.space16),
              Text(
                Translation.donationTarget.getString(context),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SpacerV(
                value: Dimens.space8,
              ),
              buildTextField(
                controller: _targetMoneyController,
                hintText: Translation.pleaseHintText.getString(context),
              ),
              SpacerV(value: Dimens.space24),
              Text(
                Translation.donationCurrent.getString(context),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SpacerV(
                value: Dimens.space8,
              ),
              buildTextField(
                controller: _currentCollectedController,
                hintText: Translation.pleaseHintText.getString(context),
              ),
              SpacerV(value: Dimens.space24),
              Text(
                Translation.donationStartDate.getString(context),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SpacerV(
                value: Dimens.space8,
              ),
              buildTextField(
                controller: _startDateController,
                hintText: Translation.pleaseHintText.getString(context),
              ),
              SpacerV(value: Dimens.space24),
              Text(
                Translation.donationEndDate.getString(context),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SpacerV(
                value: Dimens.space8,
              ),
              buildTextField(
                controller: _endDateController,
                hintText: Translation.pleaseHintText.getString(context),
              ),
              SpacerV(value: Dimens.space24),
              Text(
                Translation.donationBankAccount.getString(context),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SpacerV(
                value: Dimens.space8,
              ),
              buildTextField(
                controller: _bankAccountController,
                hintText: Translation.pleaseHintText.getString(context),
              ),
              SpacerV(value: Dimens.space24),
              SizedBox(
                width: double.infinity,
                height: Dimens.space40,
                child: ElevatedButton(
                  onPressed: () async {
                    final userUID = organizationUser.organizers.id;
                    final newDonation = EventDonationModel(
                      id: userUID,
                      targetMoney: _targetMoneyController.text,
                      currentCollected: _currentCollectedController.text,
                      startDate: _startDateController.text,
                      endDate: _endDateController.text,
                      bankAccount: _bankAccountController.text,
                    );

                    eventDonation.createDonationDetails(newDonation);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(
                          title:
                            Translation.splashTitle.getString(context),
                        )
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

  @override
  void dispose() {
    _targetMoneyController.dispose();
    _currentCollectedController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    _bankAccountController.dispose();
    super.dispose();
  }
}
