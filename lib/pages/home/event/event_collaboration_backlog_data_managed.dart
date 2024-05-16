import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/models/models.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

class AddBacklogItemScreen extends StatefulWidget {
  final EventCollaborationModel item;

  const AddBacklogItemScreen({Key? key, required this.item}) : super(key: key);

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

  final List<String> columnBelong = ['To Do', 'In Progress', 'Done'];

  String columnBelongData = '';

  @override
  void initState() {
    super.initState();
    _backLogTitleController.text = widget.item.title ?? "";
    _backLogPriorityController.text = widget.item.title ?? "";
    _backLogStatusController.text = widget.item.columnBelong ?? "";
    _backLogDescriptionController.text = widget.item.subTitle ?? "";
    columnBelongData = widget.item.columnBelong ?? "";
  }

  @override
  Widget build(BuildContext context) {
    EventCollaborationProvider eventCollaboration =
        Provider.of<EventCollaborationProvider>(context);
        
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: _backLogTitleController,
              labelText: 'Title',
              onChanged: (value){
                eventCollaboration.updateTitle((widget.item.id ?? ''), value);
              },
            ),
            SpacerV(value: Dimens.space16),
            CustomTextField(
              controller: _backLogDescriptionController,
              labelText: 'Description',
              onChanged: (value){
                eventCollaboration.updateDescription((widget.item.id ?? ''), value);
              },
            ),
            SpacerV(value: Dimens.space16),
            CustomTextField(
              controller: _backLogPriorityController,
              labelText: 'Priority',
            ),
            CustomDropdownFormField(
              items: columnBelong,
              hintText: columnBelongData,
              onChanged: (value) {
                columnBelongData = (value ?? columnBelongData);
                eventCollaboration.updateColumnBelong((widget.item.id ?? ''), columnBelongData);
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
