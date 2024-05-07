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
      CategoryItem(
          Images.splashIcon, Translation.manageDesciption.getString(context)),
      CategoryItem(
          Images.splashIcon, Translation.manageItem.getString(context)),
      CategoryItem(
          Images.splashIcon, Translation.manageDonation.getString(context)),
      CategoryItem(
          Images.splashIcon, Translation.manageVolunteer.getString(context)),
      CategoryItem(
          Images.splashIcon, Translation.teamPlanning.getString(context)),
      CategoryItem(
          Images.splashIcon, Translation.manageGallery.getString(context)),
      CategoryItem(
          Images.splashIcon, Translation.feedbackCollection.getString(context)),
    ];

    final screenWidth = MediaQuery.of(context).size.width;
    const crossAxisSpacing = 16.0;
    const mainAxisSpacing = 20.0;
    const padding = 20.0;
    final cardWidth = (screenWidth - crossAxisSpacing - padding * 2) / 2;

    return Scaffold(
      appBar: CustomAppBar(title: Translation.myEventTitle.getString(context)),
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
              MaterialPageRoute(builder: (context) => EventItemAddPage()),
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
            await eventFeedback.fetchAllFeedbackDetails(userId);
            int totalScore = eventFeedback.getTotalCurrentScore();

            // ignore: use_build_context_synchronously
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>  EventManageFeedbackPage(totalScore: totalScore,)),
            );
          }
        },
        child: Container(
          width: cardWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimens.space6),
              topRight: Radius.circular(Dimens.space6),
            ),
            color: Palette.purpleMain.withOpacity(0.3),
          ),
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
