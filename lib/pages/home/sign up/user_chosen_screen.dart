import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

class UserChosen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomChosenButton(
                  text: Translation.askDonor.getString(context),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PersonnelSignUpPage(),
                      ),
                    );
                  },
                ),
                SpacerV(value: Dimens.space32),
                CustomChosenButton(
                  text: Translation.askOrganizer.getString(context),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimens.space100,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: Colors.transparent,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      Translation.askWho.getString(context), // Added HELLO text
                      style:
                          const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      Translation.askWhoSubtitle
                          .getString(context), // Added HELLO text
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
