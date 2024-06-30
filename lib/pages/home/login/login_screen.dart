// ignore_for_file: use_build_context_synchronously

import 'package:charity_event_system/common/resources/resources.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
    EventItemsProvider eventItems = Provider.of<EventItemsProvider>(context);
    EventCollaborationProvider eventCollaboration =
        Provider.of<EventCollaborationProvider>(context);
    EventFeedbackProvider eventFeedback =
        Provider.of<EventFeedbackProvider>(context);
    EventOrganizationBackgroundProvider eventOrganizationBackground =
        Provider.of<EventOrganizationBackgroundProvider>(context);
    EventTransactionProvider eventTransactionFile =
        Provider.of<EventTransactionProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(Dimens.space16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SpacerV(value: Dimens.space24),
              Text(Translation.loginTitle.getString(context),
                  style: const TextStyle(
                    fontSize: 24,
                  )),
              SpacerV(value: Dimens.space40),
              SvgPicture.asset(
                Images.splashIcon,
                width: 200,
                height: 200,
              ),
              SpacerV(value: Dimens.space64),
              CustomTextField(
                controller: _usernameController,
                labelText: Translation.loginEmail.getString(context),
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _passwordController,
                labelText: Translation.loginPassword.getString(context),
                obscureText: true,
              ),
              SpacerV(value: Dimens.space8),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgotPasswordForm()),
                  );
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    Translation.loginForgotPassword.getString(context),
                    style: const TextStyle(
                      color: Palette.blueLink,
                    ),
                  ),
                ),
              ),
              SpacerV(value: Dimens.space32),
              SizedBox(
                width: double.infinity,
                height: Dimens.space40,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _usernameController.text,
                        password: _passwordController.text,
                      );

                      User? user = FirebaseAuth.instance.currentUser;
                      if (user != null) {
                        String? role = await getUserCategory(user.uid);

                        print("User Email: ${_usernameController.text}");
                        print("User Password: ${_passwordController.text}");
                        print("Id tracker: ${user.uid}");
                        print("role: $role");

                        if (role == "Admin") {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AdminChosen(),
                            ),
                          );
                        } else {
                          eventDetailsFile.resetEventDetails();
                          eventOrganizationBackground.resetEventOrganizationBackground();
                          organizationUser.resetOrganizersDetails();
                          personnelUser.resetPersonnelsDetails();                          
                          await organizationUser.fetchOrganizerData();

                          if (organizationUser.organizers.verify ==
                                  'Verified' ||
                              organizationUser.organizers.verify == null) {
                            eventVolunteerFile.resetEventVolunteer();
                            eventItems.resetEventItem();
                            eventTransactionFile.resetEventTransaction();
                            eventDonationsFile.resetEventDonation();
                            eventGalleryFile.resetEventGallery();
                            await organizationUser.fetchAllOrganizers();
                            await personnelUser.fetchPersonnelData();
                            await eventDetailsFile.fetchEventDetailsData();
                            await eventOrganizationBackground.fetchEventOrganizationBackgroundData();
                            await eventDonationsFile.fetchEventDonationData();
                            await eventGalleryFile.fetchEventGalleryData();
                            await eventVolunteerFile.fetchEventVolunteerData();
                            await eventItems.fetchEventItemData();
                            await eventTransactionFile.fetchEventTransactionData(null);
                            await eventCollaboration
                                .fetchEventCollaborationData(null);
                            await eventDetailsFile.fetchAllEventDetails();
                            await eventOrganizationBackground.fetchAllEventOrganizationBackground();
                            await eventDonationsFile.fetchAllDonationDetails();
                            await eventGalleryFile.fetchAllEventGallery();

                            //TO DO: Yusri Later need to check back
                            for (int i = 0;
                                i < eventDetailsFile.eventDetailsList.length;
                                i++) {
                              await eventFeedback.fetchAllFeedbackDetails(
                                  eventDetailsFile.eventDetailsList[i].id);
                              await eventFeedback.fetchAndStoreScores(eventFeedback.getTotalCurrentScore());
                            }
                            if (organizationUser.organizers.id != null) {
                              print("Organization ID check: True");
                            } else if(personnelUser.personnels.id != null){
                              print("Personnel user ID check: True");
                            }else{
                              print("No user");
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyHomePage(
                                  title: Translation.splashTitle
                                      .getString(context),
                                ),
                              ),
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => ErrorAlertDialog(
                                title:
                                    Translation.errorTitle.getString(context),
                                content: Translation.errorOrganizerNotVerfied
                                    .getString(context),
                              ),
                            );
                          }
                        }
                      }
                    } catch (error) {
                      String errorMessage =
                          Translation.generalErrorMsg.getString(context);
                      if (error is FirebaseAuthException) {
                        switch (error.code) {
                          case 'invalid-credential':
                            errorMessage = Translation.credentialErrorMsg
                                .getString(context);
                            break;
                          default:
                            errorMessage = Translation.authenticationErrorMsg
                                .getString(context);
                            break;
                        }
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Palette.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: const BorderSide(color: Palette.black),
                            ),
                            title: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(Icons.error,
                                    color: Palette.redButton),
                                SpacerH(value: Dimens.space10),
                                Text(
                                  Translation.errorTitle.getString(context),
                                  style: const TextStyle(color: Palette.black),
                                ),
                              ],
                            ),
                            content: Text(
                              errorMessage,
                              style: const TextStyle(color: Palette.black),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  Translation.ok.getString(context),
                                  style: const TextStyle(color: Palette.black),
                                ),
                              ),
                            ],
                          );
                        },
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
                    Translation.loginTitle.getString(context),
                    style: const TextStyle(color: Palette.white),
                  ),
                ),
              ),
              SpacerV(value: Dimens.space16),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserChosen()),
                  );
                },
                child: Text(
                  Translation.loginQuestion.getString(context),
                  style: const TextStyle(color: Palette.blueLink),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> getUserCategory(String userId) async {
    try {
      CollectionReference admin =
          FirebaseFirestore.instance.collection('admin');

      DocumentSnapshot documentSnapshot = await admin.doc(userId).get();

      if (documentSnapshot.exists && documentSnapshot.data() != null) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        return data['category'] as String?;
      } else {
        return null;
      }
    } catch (error) {
      print('Error fetching admin role: $error');
      return null;
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
