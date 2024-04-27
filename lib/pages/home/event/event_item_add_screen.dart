import 'package:charity_event_system/common/resources/resources.dart';
import 'package:charity_event_system/models/models.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class EventItemAddPage extends StatefulWidget {
  final String? session;

  const EventItemAddPage({
    Key? key,
    this.session = 'update',
  }) : super(key: key);

  @override
  _EventItemAddPageState createState() => _EventItemAddPageState();
}

class _EventItemAddPageState extends State<EventItemAddPage> {
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _itemQuantityController = TextEditingController();
  final TextEditingController _itemUnitController = TextEditingController();
  final TextEditingController _itemDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    OrganizerProvider organizationUser =
        Provider.of<OrganizerProvider>(context);
    EventItemsProvider eventItems = Provider.of<EventItemsProvider>(context);

    return Scaffold(
      backgroundColor: Palette.lightGrey,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const QuoteCard(
              imagePath: Images.societyIcon,
              quote:
                  "All of you are shepherds and each of you is responsible for his flock.",
              author: "- Hadis Riwayat Al-Bukhari",
            ),
            Container(
              padding: EdgeInsets.all(Dimens.space16),
              color: Palette.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Translation.itemInfoTitle.getString(context),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    Translation.itemInfoSub.getString(context),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SpacerV(value: Dimens.space20),
                  CustomTextField(
                    controller: _itemNameController,
                    labelText: Translation.itemName.getString(context),
                  ),
                  SpacerV(value: Dimens.space24),
                  CustomTextField(
                    controller: _itemQuantityController,
                    labelText: Translation.itemQuantity.getString(context),
                  ),
                  SpacerV(value: Dimens.space24),
                  CustomTextField(
                    controller: _itemUnitController,
                    labelText: Translation.itemUnit.getString(context),
                  ),
                  SpacerV(value: Dimens.space24),
                  CustomTextField(
                    controller: _itemDateController,
                    labelText: Translation.itemDate.getString(context),
                  ),
                  SpacerV(value: Dimens.space24),
                  SizedBox(
                    width: double.infinity,
                    height: Dimens.space40,
                    child: ElevatedButton(
                      onPressed: () {
                        final userUID = organizationUser.organizers.id;
                        String newId = const Uuid().v4();
                        final newItem = EventItemsModel(
                          id: newId,
                          itemName: _itemNameController.text,
                          itemQuantity: _itemQuantityController.text,
                          itemUnit: _itemUnitController.text,
                          itemDate: _itemDateController.text,
                        );

                        eventItems.createItemDetails(newItem, userUID);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EventItemAddPage(
                                    session: widget.session,
                                  )),
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
                        Translation.insert.getString(context),
                        style: const TextStyle(color: Palette.white),
                      ),
                    ),
                  ),
                  if (widget.session == "update") ...[
                    SpacerV(value: Dimens.space24),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: Palette.grey,
                            thickness: 1.5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            Translation.itemListBorder.getString(context),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            color: Palette.grey,
                            thickness: 1.5,
                          ),
                        ),
                      ],
                    ),
                    SpacerV(value: Dimens.space12),
                    SizedBox(
                      width: double.infinity,
                      height: Dimens.space40,
                      child: ElevatedButton(
                        onPressed: () {
                          final userUID = organizationUser.organizers.id;
                          eventItems.fetchEventItemData();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ItemManagePage(id: userUID)),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Palette.black,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Dimens.space8),
                          ),
                        ),
                        child: Text(
                          Translation.itemTable.getString(context),
                          style: const TextStyle(color: Palette.white),
                        ),
                      ),
                    ),
                  ],
                  if (widget.session != "update") ...[
                    SpacerV(value: Dimens.space24),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: Palette.grey,
                            thickness: 1.5,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Dimens.space8),
                          child: Text(
                            '${Translation.done.getString(context)}?',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            color: Palette.grey,
                            thickness: 1.5,
                          ),
                        ),
                      ],
                    ),
                    SpacerV(value: Dimens.space12),
                    SizedBox(
                      width: double.infinity,
                      height: Dimens.space40,
                      child: ElevatedButton(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const EventDonationManagementPage()),
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
                          style: const TextStyle(color: Palette.white),
                        ),
                      ),
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

  @override
  void dispose() {
    _itemNameController.dispose();
    _itemQuantityController.dispose();
    _itemUnitController.dispose();
    _itemDateController.dispose();
    super.dispose();
  }
}
