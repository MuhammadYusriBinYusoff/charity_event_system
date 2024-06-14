import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

class CollabPassPage extends StatefulWidget {
  String? password;
  int? index;

  CollabPassPage({
    Key? key,
    this.password,
    this.index,
  }) : super(key: key);

  @override
  State<CollabPassPage> createState() => _CollabPassPageState();
}

class _CollabPassPageState extends State<CollabPassPage> {
  final TextEditingController _CollabPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    EventDetailsProvider eventDetailsFile =
        Provider.of<EventDetailsProvider>(context);
    EventCollaborationProvider eventCollaboration =
        Provider.of<EventCollaborationProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(
        appBarcolor: Palette.white,
        hideLogout: true,
        showPreviousButton: false,
        showCustomPreviousButton: true,
        colorCustomPreviousButton: Palette.black,
        targetPage: EventPostingDescriptionPage(
          index: widget.index,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpacerV(
              value: Dimens.space100,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(45),
              color: Colors.transparent,
              child: const Center(
                child: Column(
                  children: [
                    Text(
                      "Welcome to SpiraCollaboration",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "User need to enter the valid password to enter the organizer-volunteer platform",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(Dimens.space16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextField(
                    controller: _CollabPassController,
                    labelText: "Password",
                  ),
                  SpacerV(
                    value: Dimens.space16,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: Dimens.space40,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_CollabPassController.text == widget.password && widget.password != "" && widget.password != null) {
                          eventCollaboration.resetCollaborationDetails();
                          eventCollaboration.resetCollaborationDetailsList();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventCollaborationPage(
                                      selectedOrganizerId: eventDetailsFile
                                          .eventDetailsList[widget.index ?? 0]
                                          .id,
                                    )),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => ErrorAlertDialog(
                              title: Translation.errorTitle.getString(context),
                              content: "Wrong Password",
                            ),
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
                        Translation.next.getString(context),
                        style: const TextStyle(color: Palette.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SpacerV(value: Dimens.space32),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _CollabPassController.dispose();
    super.dispose();
  }
}
