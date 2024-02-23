import 'package:charity_event_system/common/resources/resources.dart';
import 'package:charity_event_system/models/models.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class EventItemAddPage extends StatefulWidget {
  const EventItemAddPage({Key? key}) : super(key: key);

  @override
  _EventItemAddPageState createState() => _EventItemAddPageState();
}

class _EventItemAddPageState extends State<EventItemAddPage> {
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _itemQuantityController = TextEditingController();
  final TextEditingController _itemUnitController = TextEditingController();
  final TextEditingController _itemDateController = TextEditingController();

  TextStyle textStyle = const TextStyle(
    fontFamily: 'Roboto',
  );

  @override
  Widget build(BuildContext context) {
    OrganizerProvider organizationUser =
        Provider.of<OrganizerProvider>(context);
    EventItemsProvider eventItems =
        Provider.of<EventItemsProvider>(context);

    return Scaffold(
      appBar: AppBar(
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
        child: Container(
          padding: EdgeInsets.all(Dimens.space16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpacerV(value: Dimens.space16),
              Text(
                Translation.itemName.getString(context),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SpacerV(
                value: Dimens.space8,
              ),
              buildTextField(
                controller: _itemNameController,
                hintText: "Please write here",
              ),
              SpacerV(value: Dimens.space24),
              Text(
                Translation.itemQuantity.getString(context),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SpacerV(
                value: Dimens.space8,
              ),
              buildTextField(
                controller: _itemQuantityController,
                hintText: "Please write here",
                multiLine: true,
              ),
              SpacerV(value: Dimens.space24),
              Text(
                Translation.itemUnit.getString(context),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SpacerV(
                value: Dimens.space8,
              ),
              buildTextField(
                controller: _itemUnitController,
                hintText: "Please write here",
                multiLine: true,
              ),
              SpacerV(value: Dimens.space24),
              Text(
                Translation.itemDate.getString(context),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SpacerV(
                value: Dimens.space8,
              ),
              buildTextField(
                controller: _itemDateController,
                hintText: "Please write here",
                multiLine: true,
              ),
              SpacerV(value: Dimens.space24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Add onPressed logic for the first button
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Palette.purpleMain,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Dimens.space8),
                        ),
                      ),
                      child: const Text(
                        'Update/Delete',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ),
                  SpacerH(
                    value: Dimens.space8,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Add onPressed logic for the second button
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Palette.purpleMain,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Dimens.space8),
                        ),
                      ),
                      child: const Text(
                        'Insert',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SpacerV(value: Dimens.space24),
              SizedBox(
                width: double.infinity,
                height: Dimens.space40,
                child: ElevatedButton(
                  onPressed: () async {
                    final userUID = organizationUser.organizers.id;
                    final newItem = EventItemsModel(
                        id: userUID,
                        itemName: _itemNameController.text,
                        itemQuantity: _itemQuantityController.text,
                        itemUnit: _itemUnitController.text,
                        itemDate: _itemDateController.text,
                      );

                      eventItems.createItemDetails(newItem);
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
                    style: const TextStyle(
                        color: Palette.white, fontFamily: 'Roborto'),
                  ),
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
    _itemNameController.dispose();
    _itemQuantityController.dispose();
    _itemUnitController.dispose();
    _itemDateController.dispose();
    super.dispose();
  }
}
