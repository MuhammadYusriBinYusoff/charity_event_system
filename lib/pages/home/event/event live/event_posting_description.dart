import 'package:cached_network_image/cached_network_image.dart';
import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

class EventPostingDescriptionPage extends StatefulWidget {
  final int? index;

  const EventPostingDescriptionPage({
    Key? key,
    this.index,
  }) : super(key: key);

  @override
  State<EventPostingDescriptionPage> createState() =>
      _EventPostingDescriptionPageState();
}

class _EventPostingDescriptionPageState
    extends State<EventPostingDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    EventDetailsProvider eventDetailsFile =
        Provider.of<EventDetailsProvider>(context);
    EventDonationProvider eventDonationsFile =
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
                        eventDetailsFile.resetEventDetails();
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Palette.purpleMain,
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: eventDetailsFile
                            .eventDetailsList[widget.index ?? 0]
                            .photoEventUrl ??
                        'https://www.caspianpolicy.org/no-image.png', // Replace with your image URL
                    width: double.infinity,
                    height: Dimens.space200,
                    fit: BoxFit.fill,
                  ),
                  SpacerV(value: Dimens.space16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleIcon(
                          icon: Icons.menu_book_outlined,
                          onTap: () {
                            print("menu icon");
                          }),
                      CircleIcon(
                          icon: Icons.food_bank_outlined,
                          onTap: () {
                            print("food icon");
                          }),
                      CircleIcon(
                          icon: Icons.emoji_people_outlined,
                          onTap: () {
                            print("people icon");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RegisterVolunteerFormPage(
                                        id: eventDetailsFile
                                            .eventDetailsList[widget.index ?? 0]
                                            .id,
                                        index: widget.index,
                                      )),
                            );
                          }),
                      CircleIcon(
                          icon: Icons.photo_outlined,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GalleryPage(
                                        index: widget.index,
                                      )),
                            );
                          }),
                      CircleIcon(
                          icon: Icons.question_mark_outlined,
                          onTap: () {
                            print("question icon");
                          }),
                    ],
                  ),
                  SpacerV(
                    value: Dimens.space16,
                  ),
                ],
              ),
            ),
            Container(
                height: Dimens.space80,
                color: Palette.purpleLow,
                child: Center(
                  child: Column(
                    children: [
                      SpacerV(
                        value: Dimens.space16,
                      ),
                      Text(
                        Translation.donationCurrent.getString(context),
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roberto'),
                      ),
                      Text(
                        "RM ${eventDonationsFile.donationDetailsList[widget.index ?? 0].currentCollected?.toStringAsFixed(2) ?? ''}",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roberto'),
                      ),
                    ],
                  ),
                )),
            Container(
                padding: EdgeInsets.all(Dimens.space16),
                color: Palette.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpacerV(value: Dimens.space16),
                    Text(
                      eventDetailsFile
                              .eventDetailsList[widget.index ?? 0].eventName ??
                          '',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roberto'),
                    ),
                    SpacerV(value: Dimens.space16),
                    Text(
                      eventDetailsFile.eventDetailsList[widget.index ?? 0]
                              .eventDescription ??
                          '',
                      style:
                          const TextStyle(fontSize: 14, fontFamily: 'Roberto'),
                    ),
                    SpacerV(value: Dimens.space16),
                    Text(
                      Translation.spiralCareDisclaimer.getString(context),
                      style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Roberto',
                          fontWeight: FontWeight.bold,
                          color: Palette.grey),
                    ),
                    SpacerV(value: Dimens.space16),
                    Text(
                      'RM ${eventDonationsFile.donationDetailsList[widget.index ?? 0].targetMoney?.toStringAsFixed(2) ?? ''}',
                      style:
                          const TextStyle(fontSize: 14, fontFamily: 'Roberto'),
                    ),
                    SpacerV(value: Dimens.space4),
                    ProgressBarIndicator(
                      value: double.parse(((eventDonationsFile
                                      .donationDetailsList[widget.index ?? 0]
                                      .currentCollected ??
                                  0) /
                              (eventDonationsFile.donationDetails.targetMoney ??
                                  1))
                          .toStringAsFixed(2)),
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: 12,
                    ),
                    SpacerV(value: Dimens.space4),
                    Text(
                      "${Translation.donationBankAccount.getString(context)}: ${eventDonationsFile.donationDetailsList[widget.index ?? 0].bankAccount}",
                      style:
                          const TextStyle(fontSize: 14, fontFamily: 'Roberto'),
                    ),
                    SpacerV(value: Dimens.space24),
                    Image.network('https://www.caspianpolicy.org/no-image.png'),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
