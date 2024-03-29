import 'package:charity_event_system/common/resources/resources.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    EventDetailsProvider eventDetailsFile =
        Provider.of<EventDetailsProvider>(context);
    EventDonationProvider eventDonationsFile =
        Provider.of<EventDonationProvider>(context);
    EventGalleryProvider eventGalleryFile =
        Provider.of<EventGalleryProvider>(context);
    EventVolunteerProvider eventVolunteerFile =
        Provider.of<EventVolunteerProvider>(context);

    return Scaffold(
      backgroundColor: Palette.purpleLow,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          children: <Widget>[
            Container(
              height: Dimens.space150,
              color: Palette.purpleMain,
              padding: EdgeInsets.all(Dimens.space8),
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
                        "Hello ${organizationUser.organizers.picName}",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Palette.white,
                        ),
                      ),
                      Text(
                        "${organizationUser.organizers.organizationName}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Palette.white,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrganizationProfilePage(
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
                    },
                    child: organizationUser.organizers.profileImageLink !=
                                null &&
                            organizationUser.organizers.profileImageLink != ''
                        ? CircleAvatar(
                            radius: Dimens.space32,
                            backgroundImage: NetworkImage(organizationUser
                                    .organizers.profileImageLink ??
                                'https://firebasestorage.googleapis.com/v0/b/charity-event-cems.appspot.com/o/images%2Fyusss.jpg?alt=media&token=fa38b153-50cc-474c-8774-6c5943fee4c2'),
                          )
                        : CircleAvatar(
                            radius: Dimens.space32,
                            backgroundImage: const NetworkImage(
                                'https://cdn-icons-png.flaticon.com/512/7915/7915522.png'),
                          ),
                  ),
                ],
              ),
            ),
            SpacerV(
              value: Dimens.space16,
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
                            i++)
                          ProductCard(
                            isEventListClicked: true,
                            indexCard: i,
                            imageUrl: eventDetailsFile
                                    .eventDetailsList[i].photoEventUrl ??
                                'https://www.caspianpolicy.org/no-image.png',
                            title: eventDetailsFile
                                    .eventDetailsList[i].eventName ??
                                '',
                            description:
                                'RM ${eventDonationsFile.donationDetailsList[i].targetMoney?.toStringAsFixed(2)}',
                            valueIndicatorProgress: double.parse(
                                ((eventDonationsFile.donationDetailsList[i]
                                                .currentCollected ??
                                            0) /
                                        (eventDonationsFile
                                                .donationDetails.targetMoney ??
                                            1))
                                    .toStringAsFixed(2)),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EventPostingDescriptionPage(
                                    index: i,
                                  ),
                                ),
                              );
                            },
                          ),
                      ],
                    ),
                  ),
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
                            builder: (context) => const EventDescriptionPage(),
                          ),
                        );
                      },
                    )
                  else
                    ProductCard(
                      imageUrl: eventDetailsFile.eventDetails.photoEventUrl ??
                          'https://images.contentstack.io/v3/assets/blt8f1303966e806bd4/bltcf5dadc6004e8499/63e5185213c67c1128b58bab/DURRAT_AL_EIMAN_2.jpg',
                      title: eventDetailsFile.eventDetails.eventName,
                      description:
                          'RM ${eventDonationsFile.donationDetails.targetMoney?.toStringAsFixed(2)}',
                      valueIndicatorProgress: double.parse(((eventDonationsFile
                                      .donationDetails.currentCollected ??
                                  0) /
                              (eventDonationsFile.donationDetails.targetMoney ??
                                  1))
                          .toStringAsFixed(2)),
                      type: eventDetailsFile.eventDetails.type,
                      onTap: () {
                        //@YUSRI: Save for later (this is used to edit event descreiptyion)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CategoryPage(),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
