import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/models/models.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

class AddBacklogItemScreen extends StatefulWidget {
  final EventCollaborationModel item;
  final String? selectedOrganizerId;

  const AddBacklogItemScreen({Key? key, required this.item, this.selectedOrganizerId}) : super(key: key);

  @override
  State<AddBacklogItemScreen> createState() => _AddBacklogItemScreenState();
}

class _AddBacklogItemScreenState extends State<AddBacklogItemScreen> {
  final TextEditingController _backLogTitleController = TextEditingController();
  final TextEditingController _backLogPriorityController =
      TextEditingController();
  final TextEditingController _backLogStatusController =
      TextEditingController();
  final TextEditingController _backLogDescriptionController =
      TextEditingController();
  final TextEditingController _dateStartController = TextEditingController();
  final TextEditingController _dateEndController = TextEditingController();

  final List<String> columnBelong = ['To Do', 'In Progress', 'Done'];
  final List<String> storyPointBelong= ['1', '2', '3','4'];

  String columnBelongData = '';
  String storyPointData = '';
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    _backLogTitleController.text = widget.item.title ?? "";
    _backLogPriorityController.text = widget.item.storyPoint ?? "";
    _backLogStatusController.text = widget.item.columnBelong ?? "";
    _backLogDescriptionController.text = widget.item.subTitle ?? "";
    columnBelongData = widget.item.columnBelong ?? "";
    storyPointData = widget.item.storyPoint ?? "";
    _dateStartController.text = widget.item.startDate ?? "";
    _dateEndController.text = widget.item.endDate ?? "";

  }

  

  @override
  Widget build(BuildContext context) {
    EventCollaborationProvider eventCollaboration =
        Provider.of<EventCollaborationProvider>(context);

    Future<void> selectStartDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        _dateStartController.text = "${selectedDate?.year}-${selectedDate?.month.toString().padLeft(2, '0')}-${selectedDate?.day.toString().padLeft(2, '0')}";
        eventCollaboration.updateStartDate((widget.item.id ?? ''), _dateStartController.text, widget.selectedOrganizerId);
      });
    }
  }

  Future<void> selectEndDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        _dateEndController.text = "${selectedDate?.year}-${selectedDate?.month.toString().padLeft(2, '0')}-${selectedDate?.day.toString().padLeft(2, '0')}";
        eventCollaboration.updateEndDate((widget.item.id ?? ''), _dateEndController.text, widget.selectedOrganizerId);
      });
    }
  }
        
    return Scaffold(
      appBar: const CustomAppBar(title: "Edit"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: _backLogTitleController,
              labelText: Translation.taskTitle.getString(context),
              onChanged: (value){
                eventCollaboration.updateTitle((widget.item.id ?? ''), value, widget.selectedOrganizerId);
              },
            ),
            SpacerV(value: Dimens.space16),
            CustomTextField(
              controller: _backLogDescriptionController,
              multiLine: true,
              labelText: Translation.taskDescription.getString(context),
              onChanged: (value){
                eventCollaboration.updateDescription((widget.item.id ?? ''), value, widget.selectedOrganizerId);
              },
            ),
            SpacerV(value: Dimens.space16),
            GestureDetector(
              onTap: () => selectStartDate(context),
              child: AbsorbPointer(
                child: CustomTextField(
                  controller: _dateStartController,
                  labelText: "Select Start Date",
                ),
              ),
            ),
            SpacerV(value: Dimens.space16),
            GestureDetector(
              onTap: () => selectEndDate(context),
              child: AbsorbPointer(
                child: CustomTextField(
                  controller: _dateEndController,
                  labelText: "Select End Date",
                ),
              ),
            ),
            CustomDropdownFormField(
              items: storyPointBelong,
              hintText: storyPointData,
              onChanged: (value) {
                storyPointData = (value ?? storyPointData);
                eventCollaboration.updateStoryPoint((widget.item.id ?? ''), storyPointData, widget.selectedOrganizerId);
              },
              validator: (value) {
                if (value == null) {
                  return Translation.feedbackCheck.getString(context);
                }
                return null;
              },
            ),
            CustomDropdownFormField(
              items: columnBelong,
              hintText: columnBelongData,
              onChanged: (value) {
                columnBelongData = (value ?? columnBelongData);
                eventCollaboration.updateColumnBelong((widget.item.id ?? ''), columnBelongData, widget.selectedOrganizerId);
              },
              validator: (value) {
                if (value == null) {
                  return Translation.feedbackCheck.getString(context);
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
