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
  final EventDetailsModel? newEvent;

  const EventItemAddPage({
    Key? key,
    this.session = 'update',
    this.newEvent,
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

    DateTime? selectedDate;

    Future<void> selectRequestDate(BuildContext context) async {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
      if (pickedDate != null && pickedDate != selectedDate) {
        setState(() {
          selectedDate = pickedDate;
          _itemDateController.text =
              "${selectedDate?.year}-${selectedDate?.month.toString().padLeft(2, '0')}-${selectedDate?.day.toString().padLeft(2, '0')}";
        });
      }
    }

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
                    compulsory: true,
                    maxWords: 15,
                    controller: _itemNameController,
                    labelText: Translation.itemName.getString(context),
                  ),
                  SpacerV(value: Dimens.space24),
                  CustomTextField(
                    compulsory: true,
                    maxWords: 4,
                    controller: _itemQuantityController,
                    labelText: Translation.itemQuantity.getString(context),
                  ),
                  SpacerV(value: Dimens.space24),
                  CustomTextField(
                    compulsory: true,
                    maxWords: 10,
                    controller: _itemUnitController,
                    labelText: Translation.itemUnit.getString(context),
                  ),
                  SpacerV(value: Dimens.space24),
                  GestureDetector(
                    onTap: () => selectRequestDate(context),
                    child: AbsorbPointer(
                      child: CustomTextField(
                        controller: _itemDateController,
                        labelText: Translation.itemDate.getString(context),
                      ),
                    ),
                  ),
                  SpacerV(value: Dimens.space24),
                  SizedBox(
                    width: double.infinity,
                    height: Dimens.space40,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_itemNameController.text != "" &&
                            _itemQuantityController.text != "" &&
                            _itemDateController.text != "" &&
                            _itemUnitController.text != "") {
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
                                      newEvent: widget.newEvent,
                                    )),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => ErrorAlertDialog(
                              title: Translation.errorTitle.getString(context),
                              content: Translation.errorFieldNotFilled
                                  .getString(context),
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
                            color: Palette.greyDark,
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
                            color: Palette.greyDark,
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
                            color: Palette.greyDark,
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
                            color: Palette.greyDark,
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
                                    EventDonationManagementPage(newEvent: widget.newEvent)),
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
