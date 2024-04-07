import 'package:charity_event_system/common/resources/resources.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
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

                      await organizationUser.fetchOrganizerData();
                      await eventDetailsFile.fetchEventDetailsData();
                      await eventDonationsFile.fetchEventDonationData();
                      await eventGalleryFile.fetchEventGalleryData();
                      await eventVolunteerFile.fetchEventVolunteerData();
                      await eventItems.fetchEventItemData();
                      await eventCollaboration.fetchEventCollaborationData();
                      await organizationUser.fetchAllOrganizers();
                      await eventDetailsFile.fetchAllEventDetails();
                      await eventDonationsFile.fetchAllDonationDetails();
                      await eventGalleryFile.fetchAllEventGallery();
                      // If sign-in is successful, navigate to the next screen
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(
                            title: Translation.splashTitle.getString(context),
                          ),
                        ),
                      );
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
                      // ignore: use_build_context_synchronously
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              Translation.errorTitle.getString(context),
                            ),
                            content: Text(errorMessage),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop();
                                },
                                child: Text(
                                  Translation.ok.getString(context),
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

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
