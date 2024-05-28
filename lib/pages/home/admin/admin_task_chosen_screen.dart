import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

class AdminChosen extends StatelessWidget {
  const AdminChosen({super.key});
  

  @override
  Widget build(BuildContext context) {
    OrganizerProvider organizationUser =
        Provider.of<OrganizerProvider>(context);

    return Scaffold(
      appBar: const CustomAppBar(
        showPreviousButton: false,
        appBarcolor: Colors.transparent,
        vertMoreColor: Palette.black,
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomChosenButton(
                  text: Translation.adminMonitorPerformance.getString(context),
                  onPressed: () async {
                    organizationUser.resetOrganizersDetails();
                    await organizationUser.fetchAllOrganizers();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MonitorOrganizer(),
                      ),
                    );
                  },
                ),
                SpacerV(value: Dimens.space32),
                CustomChosenButton(
                  text: Translation.adminValidateOrganizer.getString(context),
                  onPressed: () async {
                    await organizationUser.fetchAllOrganizers();
                    int notVerifiedCount = 0;

                    for (int i = 0;
                        i < organizationUser.organizerList.length;
                        i++) {
                      if (organizationUser.organizerList[i].verify ==
                          "Not Verified") {
                        notVerifiedCount++;
                      }
                    }
              
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ValidateOrganizer(),
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
                      Translation.adminChooseTaskTitle
                          .getString(context),
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      Translation.adminChooseTaskSubTitle
                          .getString(context),
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
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
