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
    EventItemsProvider eventItem = Provider.of<EventItemsProvider>(context);
    EventCollaborationProvider eventCollaboration =
        Provider.of<EventCollaborationProvider>(context);

    return Scaffold(
      appBar: const CustomAppBar(showPreviousButton: false, showCustomPreviousButton: true, targetPage: MyHomePage(),),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                CachedNetworkImage(
                  imageUrl: eventDetailsFile
                          .eventDetailsList[widget.index ?? 0].photoEventUrl ??
                      'https://www.caspianpolicy.org/no-image.png',
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
                          "RM ${eventDonationsFile.donationDetailsList[widget.index ?? 0].currentCollected?.toStringAsFixed(2) ?? ''}",
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
                      CircleIcon(
                          icon: Icons.menu_book_outlined,
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
                                  content: Translation
                                      .errorOrganizerEnterOwnEvent
                                      .getString(context),
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserFeedbackPage(
                                          id: eventDetailsFile
                                              .eventDetailsList[
                                                  widget.index ?? 0]
                                              .id,
                                          index: widget.index,
                                        )),
                              );
                            }
                          }),
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
                      CircleIcon(
                          icon: Icons.food_bank_outlined,
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
                          }),
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
                      CircleIcon(
                          icon: Icons.emoji_people_outlined,
                          onTap: () {
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
                      CircleIcon(
                          icon: Icons.people,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CollabPassPage(
                                  index: widget.index,
                                  password: eventDetailsFile
                              .eventDetailsList[widget.index ?? 0].passwordCollaboration,
                                ),
                              ),
                            );
                          }),
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
                      CircleIcon(
                          icon: Icons.add_location,
                          onTap: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EventLiveBackgroundPage(
                                  index: widget.index,
                                ),
                              ),
                            );
                          }),
                      Text(
                        Translation.manageLiveProfile.getString(context),
                        style: TextStyle(
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
                      eventDetailsFile
                              .eventDetailsList[widget.index ?? 0].eventName ??
                          '',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SpacerV(value: Dimens.space8),
                    Text(
                      eventDetailsFile.eventDetailsList[widget.index ?? 0]
                              .eventDescription ??
                          '',
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SpacerV(value: Dimens.space16),
                    Text(
                      Translation.spiralCareDisclaimer.getString(context),
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Palette.greyDark),
                    ),
                    SpacerV(value: Dimens.space16),
                    Text(
                      'RM ${eventDonationsFile.donationDetailsList[widget.index ?? 0].targetMoney?.toStringAsFixed(2) ?? ''}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    SpacerV(value: Dimens.space4),
                    ProgressBarIndicator(
                      value: ((eventDonationsFile
                                  .donationDetailsList[widget.index ?? 0]
                                  .currentCollected ??
                              0) /
                          (eventDonationsFile
                                  .donationDetailsList[widget.index ?? 0]
                                  .targetMoney ??
                              1)),
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: 12,
                    ),
                    SpacerV(value: Dimens.space4),
                    Text(
                      "${Translation.donationBankAccount.getString(context)}: ${eventDonationsFile.donationDetailsList[widget.index ?? 0].bankAccount}",
                    ),
                    SpacerV(value: Dimens.space24),
                    CachedNetworkImage(
                      imageUrl: eventDonationsFile
                              .donationDetailsList[widget.index ?? 0]
                              .photoEventUrl ??
                          'https://www.caspianpolicy.org/no-image.png', // Replace with your image URL
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
