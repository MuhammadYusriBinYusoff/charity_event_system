// ignore_for_file: use_build_context_synchronously

import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CategoryItem> categories = [
      CategoryItem(Images.fileOrganizer,
          Translation.manageDesciption.getString(context)),
      CategoryItem(
          Images.itemOrganizer, Translation.manageItem.getString(context)),
      CategoryItem(Images.donationOrganizer,
          Translation.manageDonation.getString(context)),
      CategoryItem(Images.volunteerOrganizer,
          Translation.manageVolunteer.getString(context)),
      CategoryItem(Images.colllaborationOrganizer,
          Translation.teamPlanning.getString(context)),
      CategoryItem(Images.galleryOrganizer,
          Translation.manageGallery.getString(context)),
      CategoryItem(Images.feedbackOrganizer,
          Translation.feedbackCollection.getString(context)),
      CategoryItem(Images.profileOrganizer,
          Translation.manageLiveProfile.getString(context)),
      CategoryItem(Images.transactionOrganizer, "Transaction History"),
      CategoryItem(
          Images.binOrganizer, Translation.deleteCollection.getString(context)),
    ];

    final screenWidth = MediaQuery.of(context).size.width;
    const crossAxisSpacing = 16.0;
    const mainAxisSpacing = 20.0;
    const padding = 20.0;
    final cardWidth = (screenWidth - crossAxisSpacing - padding * 2) / 2;

    return Scaffold(
      appBar: CustomAppBar(
        title: Translation.myEventTitle.getString(context),
        showPreviousButton: false,
        targetPage: const MyHomePage(),
        showCustomPreviousButton: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: Dimens.space16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          padding: const EdgeInsets.all(padding),
          childAspectRatio: 0.98,
          children: categories.map((category) {
            return FadeScaleAnimation(
              delay: Duration(milliseconds: categories.indexOf(category) * 100),
              child: CategoryCard(categoryItem: category, cardWidth: cardWidth),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class CategoryItem {
  final String imagePath;
  final String name;

  CategoryItem(this.imagePath, this.name);
}

class CategoryCard extends StatelessWidget {
  final CategoryItem categoryItem;
  final double cardWidth;

  const CategoryCard({
    Key? key,
    required this.categoryItem,
    required this.cardWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EventDetailsProvider eventDetailsFile =
        Provider.of<EventDetailsProvider>(context);
    EventDonationProvider eventDonationsFile =
        Provider.of<EventDonationProvider>(context);
    EventGalleryProvider eventGalleryFile =
        Provider.of<EventGalleryProvider>(context);
    EventVolunteerProvider eventVolunteerFile =
        Provider.of<EventVolunteerProvider>(context);
    EventFeedbackProvider eventFeedback =
        Provider.of<EventFeedbackProvider>(context);
    EventHistoryProvider eventHistory =
        Provider.of<EventHistoryProvider>(context);
    EventOrganizationBackgroundProvider eventOrganizationBackground =
        Provider.of<EventOrganizationBackgroundProvider>(context);
    EventTransactionProvider eventTransactionFile =
        Provider.of<EventTransactionProvider>(context);

    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: InkWell(
        onTap: () async {
          if (categoryItem.name ==
              Translation.manageGallery.getString(context)) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EventGalleryPage(
                    imageUrlList:
                        eventGalleryFile.eventGallery.imageGalleryUrls,
                    session: "update"),
              ),
            );
          } else if (categoryItem.name ==
              Translation.manageVolunteer.getString(context)) {
            eventVolunteerFile.fetchEventVolunteerData();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const VolunteerQueryPage()),
            );
          } else if (categoryItem.name ==
              Translation.manageDesciption.getString(context)) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EventDescriptionPage(
                    imageUrl: eventDetailsFile.eventDetails.photoEventUrl,
                    title: eventDetailsFile.eventDetails.eventName,
                    description: eventDetailsFile.eventDetails.eventDescription,
                    groupLink: eventDetailsFile.eventDetails.groupLinkUrl,
                    collabPass:
                        eventDetailsFile.eventDetails.passwordCollaboration,
                    session: "update"),
              ),
            );
          } else if (categoryItem.name ==
              Translation.manageDonation.getString(context)) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EventDonationManagementPage(
                  targetMoney: eventDonationsFile.donationDetails.targetMoney,
                  currentCollected:
                      eventDonationsFile.donationDetails.currentCollected,
                  startDate: eventDonationsFile.donationDetails.startDate,
                  endDate: eventDonationsFile.donationDetails.endDate,
                  bankAccount: eventDonationsFile.donationDetails.bankAccount,
                  photoEventUrl:
                      eventDonationsFile.donationDetails.photoEventUrl,
                  session: "update",
                ),
              ),
            );
          } else if (categoryItem.name ==
              Translation.manageItem.getString(context)) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EventItemAddPage()),
            );
          } else if (categoryItem.name ==
              Translation.teamPlanning.getString(context)) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const EventCollaborationPage()),
            );
          } else if (categoryItem.name ==
              Translation.feedbackCollection.getString(context)) {
            User? user = FirebaseAuth.instance.currentUser;
            String? userId = user?.uid;
            eventFeedback.resetEventFeedback();
            eventHistory.resetEventHistory();
            await eventFeedback.fetchAllFeedbackDetails(userId);
            int overalTotalScore = 0;
            if (await eventHistory.fetchAllHistoryDetails(userId)) {
              overalTotalScore = eventHistory.getTotalCurrentScore();
            }
            int totalScore = eventFeedback.getTotalCurrentScore();
            List<String?> comments = eventFeedback.getComments();

            // ignore: use_build_context_synchronously
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EventManageFeedbackPage(
                        totalScore: totalScore,
                        comments: comments,
                        overalTotalScore: overalTotalScore,
                      )),
            );
          } else if (categoryItem.name ==
              Translation.manageLiveProfile.getString(context)) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EventOrganizationBackgroundPage(
                    imageUrl: eventOrganizationBackground
                        .eventOrganizationBackground.photoEventUrl,
                    description: eventOrganizationBackground
                        .eventOrganizationBackground.backgroundDescription,
                    session: "update"),
              ),
            );
          } else if (categoryItem.name ==
              Translation.deleteCollection.getString(context)) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Delete Confirmation'),
                  content:
                      Text('Are you sure you want to delete this collection?'),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text('Delete'),
                      onPressed: () async {
                        User? user = FirebaseAuth.instance.currentUser;
                        String? userId = user?.uid;
                        await eventDonationsFile.deleteDonationDetails(userId);
                        await eventFeedback.deleteFeedbackDetails(userId);
                        await eventTransactionFile.deleteAllEventTransaction();
                        await eventGalleryFile.deleteEventGallery(userId);
                        await eventDetailsFile.deleteEventDetails(userId);
                        eventFeedback.resetEventFeedback();
                        await eventFeedback.resetScoreEventFeedback();

                        for (int i = 0;
                            i < eventDetailsFile.eventDetailsList.length;
                            i++) {
                          await eventFeedback.fetchAllFeedbackDetails(
                              eventDetailsFile.eventDetailsList[i].id);
                          await eventFeedback.fetchAndStoreScores(
                              eventFeedback.getTotalCurrentScore());
                        }
                        //ignore: use_build_context_synchronously
                        Future.delayed(Duration(milliseconds: 300), () {
                          // Ensure context is still mounted
                          //if (context.mounted) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyHomePage(),
                              ),
                              (Route<dynamic> route) => false,
                            );
                          //}
                        });
                      },
                    ),
                  ],
                );
              },
            );
          } else if (categoryItem.name == "Transaction History") {
            await eventTransactionFile.fetchEventTransactionData(null);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewTransactionPage()),
            );
          }
        },
        child: Container(
          width: cardWidth,
          decoration: BoxDecoration(
              border: Border.all(
            width: 2,
            color: Palette.purpleMain,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                categoryItem.imagePath,
                height: Dimens.space86,
                fit: BoxFit.cover,
              ),
              SpacerV(
                value: Dimens.space12,
              ),
              Text(
                categoryItem.name,
                style: const TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  color: Palette.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
