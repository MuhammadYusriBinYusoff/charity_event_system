import 'package:charity_event_system/common/resources/resources.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.title});

  final String? title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    OrganizerProvider organizationUser =
        Provider.of<OrganizerProvider>(context);
    PersonnelProvider personnelUser = Provider.of<PersonnelProvider>(context);
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

    String getProfileImageLink(String? organizerLink, String? personnelLink) {
      if (organizerLink != null && organizerLink.isNotEmpty) {
        return organizerLink;
      } else if (personnelLink != null && personnelLink.isNotEmpty) {
        return personnelLink;
      } else {
        return 'https://cdn-icons-png.flaticon.com/512/7915/7915522.png';
      }
    }

    return Scaffold(
      backgroundColor: Palette.white,
      appBar: const CustomAppBar(
        showPreviousButton: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.26,
              child: Stack(
                children: [
                  Container(
                    height: Dimens.space150,
                    color: Palette.purpleMain,
                    padding: EdgeInsets.all(Dimens.space12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SpacerV(
                              value: Dimens.space24,
                            ),
                            Text(
                              "Hello ${organizationUser.organizers.picName ?? personnelUser.personnels.personnelName}",
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Palette.white,
                              ),
                            ),
                            Text(
                              organizationUser.organizers.organizationName ?? 'Donor/Volunteer',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Palette.white,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            if (organizationUser.organizers.id != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OrganizationProfilePage(
                                          organizationName: organizationUser
                                              .organizers.organizationName,
                                          organizationContact: organizationUser
                                              .organizers.organizationContact,
                                          organizationAdress: organizationUser
                                              .organizers.organizationAdress,
                                          organizationLink: organizationUser
                                              .organizers.organizationLink,
                                          profileImageLink: organizationUser
                                              .organizers.profileImageLink,
                                        )),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PersonnelProfilePage(
                                          personnelName: personnelUser
                                              .personnels.personnelName,
                                          personnelContact: personnelUser
                                              .personnels.personnelContact,
                                          personnelAdress: personnelUser
                                              .personnels.personnelAdress,
                                          personnelEmail: personnelUser
                                              .personnels.personnelEmail,
                                          personnelPassword: personnelUser
                                              .personnels.personnelPassword,
                                          profileImageLink: personnelUser
                                              .personnels.profileImageLink,
                                        )),
                              );
                            }
                          },
                          child: CircleAvatar(
                            radius: Dimens.space40,
                            backgroundImage: NetworkImage(
                              getProfileImageLink(
                                organizationUser.organizers.profileImageLink ??
                                    '',
                                personnelUser.personnels.profileImageLink ?? '',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (organizationUser.organizers.id != null) 
                  Positioned(
                    left: MediaQuery.of(context).size.width *
                        0.21, // Centers the container horizontally
                    top: (MediaQuery.of(context).size.height * 0.15 ), // Centers the container vertically based on a height of 100
                    child: Container(
                      padding: EdgeInsets.all(Dimens.space8),
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 72,
                      decoration: BoxDecoration(
                        color: Palette.lightGrey,
                        border: Border.all(
                          color: Palette.purpleMain,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            SpacerV(value: Dimens.space6,),
                            Text(Translation.currentCollect.getString(context), style: TextStyle(fontWeight: FontWeight.bold),),
                            Text("RM ${eventDonationsFile.donationDetails.currentCollected?.toStringAsFixed(2) ?? 0}", style: TextStyle(color: Palette.redButton, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(Dimens.space16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    Translation.charity2024Title.getString(context),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    Translation.charity2024Subtitle.getString(context),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SpacerV(
                    value: Dimens.space16,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0;
                            i < eventDetailsFile.eventDetailsList.length;
                            i++)...[
                          ProductCard(
                            isEventListClicked: true,
                            indexCard: i,
                            totalScore: eventFeedback.totalScoresList[i], //To DO: Yusri Need to check back later
                            imageUrl: eventDetailsFile
                                    .eventDetailsList[i].photoEventUrl ??
                                'https://www.caspianpolicy.org/no-image.png',
                            title: eventDetailsFile
                                    .eventDetailsList[i].eventName ??
                                '',
                            description:
                                'RM ${eventDonationsFile.donationDetailsList[i].targetMoney?.toStringAsFixed(2)}',
                            valueIndicatorProgress: ((eventDonationsFile
                                        .donationDetailsList[i]
                                        .currentCollected ??
                                    0) /
                                (eventDonationsFile
                                        .donationDetailsList[i].targetMoney ??
                                    1)),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EventPostingDescriptionPage(
                                    index: i,
                                    id: eventDetailsFile
                                    .eventDetailsList[i].id,
                                  ),
                                ),
                              );
                            },
                          ),
                          SpacerH(value:Dimens.space8),
                        ],
                      ],
                    ),
                  ),
                  if (organizationUser.organizers.id != null) ...[
                    SpacerV(
                      value: Dimens.space32,
                    ),
                    Text(
                      Translation.myEventTitle.getString(context),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      Translation.myEventSubtitle.getString(context),
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SpacerV(
                      value: Dimens.space16,
                    ),
                    if (eventDetailsFile.eventDetails.id == null)
                      FileAddingCard(
                        title: Translation.createEventTitle.getString(context),
                        description:
                            Translation.createEventSubtitle.getString(context),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const EventDescriptionPage(),
                            ),
                          );
                        },
                      )
                    else
                      ProductCard(
                        displayPercentageScore: false,
                        imageUrl: eventDetailsFile.eventDetails.photoEventUrl ??
                            'https://cdn-icons-png.flaticon.com/512/6598/6598519.png',
                        title: eventDetailsFile.eventDetails.eventName,
                        description:
                            'RM ${eventDonationsFile.donationDetails.targetMoney?.toStringAsFixed(2)}',
                        valueIndicatorProgress: ((eventDonationsFile
                                    .donationDetails.currentCollected ??
                                0) /
                            (eventDonationsFile.donationDetails.targetMoney ??
                                1)),
                        type: eventDetailsFile.eventDetails.type,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CategoryPage(),
                            ),
                          );
                        },
                      ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
