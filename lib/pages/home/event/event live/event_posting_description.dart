// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/models/models.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

class EventPostingDescriptionPage extends StatefulWidget {
  final int? index;
  final String? id;

  const EventPostingDescriptionPage({
    Key? key,
    this.index,
    this.id,
  }) : super(key: key);

  @override
  State<EventPostingDescriptionPage> createState() =>
      _EventPostingDescriptionPageState();
}

class _EventPostingDescriptionPageState
    extends State<EventPostingDescriptionPage> {
  String? pdfUrl;
  String? pdfName;
  bool isLoading = false;
  bool isUploaded = false;
  bool displaySnackbar = true;

  Future<FilePickerResult?> pickPDF() async {
    return await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
  }

  Future<void> uploadPDF(PlatformFile file, String? userId) async {
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirPDFs =
        referenceRoot.child('receiptPayment').child(userId ?? '');
    Reference referencePDFToUpload = referenceDirPDFs.child(file.name);

    try {
      setState(() {
        isLoading = true;
      });
      File fileToUpload = File(file.path!);
      await referencePDFToUpload.putFile(fileToUpload);
      String url = await referencePDFToUpload.getDownloadURL();
      setState(() {
        pdfUrl = url;
        pdfName = file.name;
        isLoading = false;
        isUploaded = true;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
        isUploaded = false;
      });
      print(error);
    }
  }

  Future<void> _openLink(String? qrCodeLink) async {
    const defaultUrl =
        "https://www.youtube.com/watch?v=wI1IroOdVvE&list=PLpeOWJ81yOvbxtJWU4z8jzhl_DRjuG1Jv&index=26";
    final qrUrl = Uri.parse(qrCodeLink ?? defaultUrl);

    try {
      if (await canLaunchUrl(qrUrl)) {
        await launchUrl(qrUrl);
      } else {
        print('Could not launch $qrUrl');
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      EventTransactionProvider eventTransactionFile =
          Provider.of<EventTransactionProvider>(context, listen: false);
      await eventTransactionFile.fetchEventTransactionData(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    EventDetailsProvider eventDetailsFile =
        Provider.of<EventDetailsProvider>(context);
    EventDonationProvider eventDonationsFile =
        Provider.of<EventDonationProvider>(context);
    EventItemsProvider eventItem = Provider.of<EventItemsProvider>(context);
    EventCollaborationProvider eventCollaboration =
        Provider.of<EventCollaborationProvider>(context);
    OrganizerProvider organizationUser =
        Provider.of<OrganizerProvider>(context);
    EventTransactionProvider eventTransactionFile =
        Provider.of<EventTransactionProvider>(context);
    PersonnelProvider personnelUser = Provider.of<PersonnelProvider>(context);

    return Scaffold(
      appBar: const CustomAppBar(
        showPreviousButton: false,
        showCustomPreviousButton: true,
        targetPage: MyHomePage(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                CachedNetworkImage(
                  imageUrl: (widget.index != null &&
                          widget.index! <
                              eventDetailsFile.eventDetailsList.length)
                      ? eventDetailsFile
                              .eventDetailsList[widget.index!].photoEventUrl ??
                          'https://www.caspianpolicy.org/no-image.png'
                      : 'https://www.caspianpolicy.org/no-image.png',
                  width: double.infinity,
                  height: Dimens.space200,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            Container(
                height: Dimens.space80,
                decoration: BoxDecoration(
                  color: Palette.purpleLow,
                  border: Border.all(
                    color: Palette.black,
                    width: 0.5,
                  ),
                ),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(Dimens.space8),
                    width: MediaQuery.of(context).size.width * 0.55,
                    decoration: const BoxDecoration(
                      color: Colors.yellow,
                      border: Border(
                        left: BorderSide(
                          color: Palette.black,
                          width: 0.5,
                        ),
                        right: BorderSide(
                          color: Palette.black,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        SpacerV(
                          value: Dimens.space8,
                        ),
                        Text(
                          Translation.currentCollect.getString(context),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "RM ${widget.index != null && widget.index! < eventDonationsFile.donationDetailsList.length ? eventDonationsFile.donationDetailsList[widget.index!].currentCollected?.toStringAsFixed(2) ?? '' : ''}",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Palette.redWarning,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            SpacerV(
              value: Dimens.space16,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpacerH(
                    value: Dimens.space8,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          User? user = FirebaseAuth.instance.currentUser;
                          String? userId = user?.uid;
                          if (eventDetailsFile
                                  .eventDetailsList[widget.index ?? 0].id ==
                              userId) {
                            showDialog(
                              context: context,
                              builder: (context) => ErrorAlertDialog(
                                title:
                                    Translation.errorTitle.getString(context),
                                content: Translation.errorOrganizerEnterOwnEvent
                                    .getString(context),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserFeedbackPage(
                                        id: eventDetailsFile
                                            .eventDetailsList[widget.index ?? 0]
                                            .id,
                                        index: widget.index,
                                      )),
                            );
                          }
                        },
                        child: SvgPicture.asset(
                          Images.feedback,
                          width: 55,
                          height: 55,
                        ),
                      ),
                      SpacerV(
                        value: Dimens.space8,
                      ),
                      Text(
                        Translation.feedbackCollection.getString(context),
                        style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Palette.black),
                      ),
                    ],
                  ),
                  SpacerH(
                    value: Dimens.space5,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await eventItem.fetchAllItemDetails(
                            eventDetailsFile
                                .eventDetailsList[widget.index ?? 0].id,
                          );
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ItemQueryPage(
                                      id: eventDetailsFile
                                          .eventDetailsList[widget.index ?? 0]
                                          .id,
                                    )),
                          );
                        },
                        child: SvgPicture.asset(
                          Images.item,
                          width: 55,
                          height: 55,
                        ),
                      ),
                      SpacerV(
                        value: Dimens.space8,
                      ),
                      Text(
                        Translation.items.getString(context),
                        style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Palette.black),
                      ),
                    ],
                  ),
                  SpacerH(
                    value: Dimens.space5,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterVolunteerFormPage(
                                      id: eventDetailsFile
                                          .eventDetailsList[widget.index ?? 0]
                                          .id,
                                      index: widget.index,
                                    )),
                          );
                        },
                        child: SvgPicture.asset(
                          Images.volunteer,
                          width: 55,
                          height: 55,
                        ),
                      ),
                      SpacerV(
                        value: Dimens.space8,
                      ),
                      Text(
                        Translation.manageVolunteer.getString(context),
                        style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Palette.black),
                      ),
                    ],
                  ),
                  SpacerH(
                    value: Dimens.space5,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GalleryPage(
                                      index: widget.index,
                                    )),
                          );
                        },
                        child: SvgPicture.asset(
                          Images.gallery,
                          width: 55,
                          height: 55,
                        ),
                      ),
                      SpacerV(
                        value: Dimens.space8,
                      ),
                      Text(
                        Translation.manageGallery.getString(context),
                        style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Palette.black),
                      ),
                    ],
                  ),
                  SpacerH(
                    value: Dimens.space5,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CollabPassPage(
                                index: widget.index,
                                password: eventDetailsFile
                                    .eventDetailsList[widget.index ?? 0]
                                    .passwordCollaboration,
                              ),
                            ),
                          );
                        },
                        child: SvgPicture.asset(
                          Images.team,
                          width: 55,
                          height: 55,
                        ),
                      ),
                      SpacerV(
                        value: Dimens.space8,
                      ),
                      Text(
                        Translation.teamPlanning.getString(context),
                        style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Palette.black),
                      ),
                    ],
                  ),
                  SpacerH(
                    value: Dimens.space5,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EventLiveBackgroundPage(
                                index: widget.index,
                              ),
                            ),
                          );
                        },
                        child: SvgPicture.asset(
                          Images.profile,
                          width: 50,
                          height: 50,
                        ),
                      ),
                      SpacerV(
                        value: Dimens.space8,
                      ),
                      Text(
                        Translation.manageLiveProfile.getString(context),
                        style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Palette.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SpacerV(
              value: Dimens.space8,
            ),
            Container(
                padding: EdgeInsets.all(Dimens.space16),
                color: Palette.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (widget.index != null &&
                              widget.index! <
                                  eventDetailsFile.eventDetailsList.length)
                          ? eventDetailsFile
                                  .eventDetailsList[widget.index!].eventName ??
                              ''
                          : '',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SpacerV(value: Dimens.space8),
                    Text(
                      (widget.index != null &&
                              widget.index! <
                                  eventDetailsFile.eventDetailsList.length)
                          ? eventDetailsFile.eventDetailsList[widget.index!]
                                  .eventDescription ??
                              ''
                          : '',
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SpacerV(value: Dimens.space16),
                    Text(
                      Translation.spiralCareDisclaimer.getString(context),
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Palette.greyDark),
                      textAlign: TextAlign.justify,
                    ),
                    SpacerV(value: Dimens.space32),
                    Text(
                      Translation.stepDonate.getString(context),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SpacerV(value: Dimens.space16),
                    Text(
                      Translation.donateInstruction.getString(context),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SpacerV(value: Dimens.space16),
                    Text(
                      'RM ${widget.index != null && widget.index! < eventDonationsFile.donationDetailsList.length ? eventDonationsFile.donationDetailsList[widget.index!].targetMoney?.toStringAsFixed(2) ?? '' : ''}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    SpacerV(value: Dimens.space4),
                    ProgressBarIndicator(
                      value: (widget.index != null &&
                              widget.index! <
                                  eventDonationsFile.donationDetailsList.length)
                          ? ((eventDonationsFile
                                      .donationDetailsList[widget.index!]
                                      .currentCollected ??
                                  0) /
                              (eventDonationsFile
                                      .donationDetailsList[widget.index!]
                                      .targetMoney ??
                                  1))
                          : 0, // Default to 0 if index is null or out of range
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: 12,
                    ),
                    SpacerV(value: Dimens.space4),
                    Text(
                      "${Translation.donationBankAccount.getString(context)}: ${widget.index != null && widget.index! < eventDonationsFile.donationDetailsList.length ? eventDonationsFile.donationDetailsList[widget.index!].bankAccount ?? '' : ''}",
                    ),
                    SpacerV(value: Dimens.space24),
                    Text(
                      Translation.donateInst1.getString(context),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SpacerV(
                      value: Dimens.space16,
                    ),
                    GestureDetector(
                      onLongPress: () async {
                        await _openLink(eventDonationsFile
                            .donationDetailsList[widget.index ?? 0]
                            .photoEventUrl);
                      },
                      child: CachedNetworkImage(
                        imageUrl: (widget.index != null &&
                                widget.index! <
                                    eventDonationsFile
                                        .donationDetailsList.length)
                            ? eventDonationsFile
                                    .donationDetailsList[widget.index!]
                                    .photoEventUrl ??
                                'https://www.caspianpolicy.org/no-image.png'
                            : 'https://www.caspianpolicy.org/no-image.png',
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SpacerV(
                      value: Dimens.space24,
                    ),
                    Text(
                      Translation.donateInst2.getString(context),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SpacerV(
                      value: Dimens.space16,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (isUploaded) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(Translation.uploadSucessfully
                                  .getString(context)),
                              backgroundColor: Colors.green,
                              duration: const Duration(seconds: 3),
                            ),
                          );
                        } else {
                          FilePickerResult? result = await pickPDF();
                          if (result != null) {
                            setState(() {
                              displaySnackbar = true;
                            });
                            PlatformFile file = result.files.first;
                            await uploadPDF(
                              file,
                              eventDetailsFile
                                  .eventDetailsList[widget.index ?? 0].id,
                            );

                            String newId = const Uuid().v4();
                            String? currentUserName;
                            if (organizationUser.organizers.id != null) {
                              currentUserName =
                                  organizationUser.organizers.picName;
                            } else {
                              currentUserName =
                                  personnelUser.personnels.personnelName;
                            }

                            final newItem = EventTransactionModel(
                              id: newId,
                              pdfUrls: pdfUrl,
                              pdfName: pdfName,
                              donatorName: currentUserName,
                            );

                            await eventTransactionFile.createTransactionDetails(
                              newItem,
                              eventDetailsFile
                                  .eventDetailsList[widget.index ?? 0].id,
                            );

                            setState(() {
                              isUploaded = true;
                            });

                            // Show Snackbar for successful upload
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(Translation.uploadSucessfully
                                    .getString(context)),
                                backgroundColor: Palette.greenIndicator,
                                duration: const Duration(seconds: 3),
                              ),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isUploaded
                            ? Palette.greenIndicator
                            : Palette.purpleMain,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Dimens.space8),
                        ),
                      ),
                      child: Text(
                        isUploaded ? "Successful" : "Upload PDF",
                        style: const TextStyle(color: Palette.white),
                      ),
                    ),
                    SpacerV(
                      value: Dimens.space24,
                    ),
                    Text(
                      Translation.donatorList.getString(context),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SpacerV(
                      value: Dimens.space8,
                    ),
                    StreamBuilder<List<EventTransactionModel>>(
                      stream: eventTransactionFile.transactionDataStream,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                                ConnectionState.active &&
                            snapshot.hasData) {
                          final donatorNames = snapshot.data!
                              .map((transaction) =>
                                  transaction.donatorName ?? 'Unknown')
                              .toList();

                          if (donatorNames.isEmpty) {
                            return Center(
                              child: Text(
                                Translation.noTransaction.getString(context),
                                style: const TextStyle(fontSize: 12),
                              ),
                            );
                          }

                          return SizedBox(
                            height: Dimens.space200,
                            child: Scrollbar(
                              trackVisibility: true,
                              thickness: 6,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount: donatorNames.length,
                                itemBuilder: (context, index) {
                                  final donatorName = donatorNames[index];
                                  return Container(
                                    margin:
                                        EdgeInsets.only(bottom: Dimens.space1),
                                    padding: EdgeInsets.all(Dimens.space4),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Palette.purpleMain,
                                          width: Dimens.space2),
                                    ),
                                    child: Text(
                                      '${index + 1}) $donatorName',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        return Center(
                          child: Text(
                            Translation.noTransaction.getString(context),
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                    ),
                    SpacerV(
                      value: Dimens.space24,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
