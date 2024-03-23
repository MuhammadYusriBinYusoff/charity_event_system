import 'package:charity_event_system/common/resources/resources.dart';
import 'package:charity_event_system/models/models.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
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
    EventItemsProvider eventItems = Provider.of<EventItemsProvider>(context);

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
                hintText: Translation.pleaseHintText.getString(context),
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
                hintText: Translation.pleaseHintText.getString(context),
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
                hintText: Translation.pleaseHintText.getString(context),
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
                hintText: Translation.pleaseHintText.getString(context),
                multiLine: true,
              ),
              SpacerV(value: Dimens.space24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ItemQueryPage()),
                    );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Palette.purpleMain,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Dimens.space8),
                        ),
                      ),
                      child: const Text(
                        'Table',
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
                        final userUID = organizationUser.organizers.id;
                        final newItem = EventItemsModel(
                          id: userUID,
                          itemName: _itemNameController.text,
                          itemQuantity: _itemQuantityController.text,
                          itemUnit: _itemUnitController.text,
                          itemDate: _itemDateController.text,
                        );

                        eventItems.createItemDetails(newItem);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const EventItemAddPage()),
                        );
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EventDonationManagementPage()),
                    );
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
