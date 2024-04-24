import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    EventDetailsProvider eventDetailsFile =
        Provider.of<EventDetailsProvider>(context);
    OrganizerProvider organizationUser =
        Provider.of<OrganizerProvider>(context);
    PersonnelProvider personnelUser = Provider.of<PersonnelProvider>(context);
    
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple, // Use your preferred color
            ),
            child: Text(
              'Options',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Palette.white,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0),
                  side: const BorderSide(color: Palette.black),
                ),
                title: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.error,
                        color: Palette.redButton),
                    SpacerH(value: Dimens.space10),
                    Text(
                      Translation.logOutTitle.getString(context),
                      style: const TextStyle(
                          color: Palette.black),
                    ),
                  ],
                ),
                content: Text(
                  Translation.logOutMsg.getString(context),
                  style: const TextStyle(
                      color: Palette.black),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      Translation.cancel.getString(context),
                      style: const TextStyle(
                          color: Palette.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      eventDetailsFile.resetEventDetails();
                      organizationUser.resetOrganizersDetails();
                      personnelUser.resetPersonnelsDetails();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Palette.redButton),
                    ),
                    child: Text(
                      Translation.logout.getString(context),
                      style: const TextStyle(
                          color: Palette.white),
                    ),
                  ),
                ],
              ),
            );
             // Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {
              // Handle profile
              Navigator.pop(context); // Close the drawer
            },
          ),
          // Add more ListTiles for additional options
        ],
      ),
    );
  }
}
