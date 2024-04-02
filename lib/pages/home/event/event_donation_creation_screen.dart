import 'dart:io';
import 'package:charity_event_system/common/resources/resources.dart';
import 'package:charity_event_system/models/models.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EventDonationManagementPage extends StatefulWidget {
  final double? targetMoney;
  final double? currentCollected;
  final String? startDate;
  final String? endDate;
  final String? bankAccount;
  final String? photoEventUrl;
  final String? session;

  const EventDonationManagementPage({
    Key? key,
    this.targetMoney = 0,
    this.currentCollected = 0,
    this.startDate,
    this.endDate,
    this.bankAccount,
    this.photoEventUrl,
    this.session,
    }) : super(key: key);

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

  String? qrImageUrl;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _targetMoneyController.text = widget.targetMoney.toString();
    _currentCollectedController.text = widget.currentCollected.toString();
    _startDateController.text = widget.startDate ?? "";
    _endDateController.text = widget.endDate ?? "";
    _bankAccountController.text = widget.bankAccount ?? "";
    qrImageUrl = widget.photoEventUrl ?? "";
  }

  Future<XFile?> pickImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    print('${file?.path}');
    return file;
  }

  // Function to upload image to Firebase Storage
  Future<void> uploadImage(XFile file, String? userId) async {
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages =
        referenceRoot.child('eventQRCode').child(userId ?? '');
    Reference referenceImageToUpload = referenceDirImages.child(file.name);

    try {
      setState(() {
        isLoading = true;
      });
      await referenceImageToUpload.putFile(File(file.path));
      qrImageUrl = await referenceImageToUpload.getDownloadURL();
      setState(() {
        qrImageUrl = qrImageUrl;
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
    OrganizerProvider organizationUser =
        Provider.of<OrganizerProvider>(context);
    EventDonationProvider eventDonation =
        Provider.of<EventDonationProvider>(context);

    return Scaffold(
      backgroundColor: Palette.lightGrey,
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
        child: Column(
          children: [
            const QuoteCard(
              imagePath: Images.societyIcon,
              quote:
                  "All of you are shepherds and each of you is responsible for his flock.",
              author: "- Hadis Riwayat Al-Bukhari",
            ),
            Container(
              padding: EdgeInsets.all(Dimens.space16),
              color: Palette.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Translation.donationInfoTitle.getString(context),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    Translation.donationInfoSub.getString(context),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SpacerV(value: Dimens.space20),
                  CustomTextField(
                    controller: _targetMoneyController,
                    labelText: Translation.donationTarget.getString(context),
                  ),
                  SpacerV(value: Dimens.space24),
                  CustomTextField(
                    controller: _currentCollectedController,
                    labelText: Translation.donationCurrent.getString(context),
                  ),
                  SpacerV(value: Dimens.space24),
                  CustomTextField(
                    controller: _startDateController,
                    labelText: Translation.donationStartDate.getString(context),
                  ),
                  SpacerV(value: Dimens.space24),
                  CustomTextField(
                    controller: _endDateController,
                    labelText: Translation.donationEndDate.getString(context),
                  ),
                  SpacerV(value: Dimens.space24),
                  CustomTextField(
                    controller: _bankAccountController,
                    labelText: Translation.donationBankAccount.getString(context),
                  ),
                  SpacerV(value: Dimens.space24),
                  Text(
                    Translation.donationQrcode.getString(context),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SpacerV(
                    value: Dimens.space8,
                  ),
                  SinglePhotoAddingButton(
                    width: double.infinity,
                    height: Dimens.space200,
                    bannerImageUrl: qrImageUrl,
                    onPressed: () async {
                      XFile? file = await pickImage();
            
                      if (file != null) {
                        await uploadImage(file, organizationUser.organizers.id);
                      }
                    },
                  ),
                  SpacerV(value: Dimens.space24),
                  SizedBox(
                    width: double.infinity,
                    height: Dimens.space40,
                    child: widget.session == "update" 
                    ?ElevatedButton(
                      onPressed: () async {
                        final userUID = organizationUser.organizers.id;
                        final newDonation = EventDonationModel(
                          id: userUID,
                          targetMoney: double.parse(_targetMoneyController.text),
                          currentCollected: double.parse(_currentCollectedController.text),
                          startDate: _startDateController.text,
                          endDate: _endDateController.text,
                          bankAccount: _bankAccountController.text,
                          photoEventUrl: qrImageUrl,
                        );
            
                        eventDonation.updateDonationDetails(newDonation);
            
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
                        Translation.save.getString(context),
                        style: const TextStyle(
                            color: Palette.white),
                      ),
                    )
                    :ElevatedButton(
                      onPressed: () async {
                        final userUID = organizationUser.organizers.id;
                        final newDonation = EventDonationModel(
                          id: userUID,
                          targetMoney: double.parse(_targetMoneyController.text),
                          currentCollected: double.parse(_currentCollectedController.text),
                          startDate: _startDateController.text,
                          endDate: _endDateController.text,
                          bankAccount: _bankAccountController.text,
                          photoEventUrl: qrImageUrl,
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
                            color: Palette.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
