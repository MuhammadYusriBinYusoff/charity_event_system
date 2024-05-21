import 'package:appflowy_board/appflowy_board.dart';
import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/models/models.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class MultiBoardListExample extends StatefulWidget {
  const MultiBoardListExample({Key? key}) : super(key: key);

  @override
  State<MultiBoardListExample> createState() => _MultiBoardListExampleState();
}

class _MultiBoardListExampleState extends State<MultiBoardListExample> {
  late final AppFlowyBoardController controller;

  late AppFlowyBoardScrollController boardController;
  int _currentId = 0;
  late List<AppFlowyGroupItem> group1Items = [];
  late List<AppFlowyGroupItem> group2Items = [];
  late List<AppFlowyGroupItem> group3Items = [];
  bool isFirstIteration = true;

  int _generateId() {
    return ++_currentId;
  }

  @override
  void initState() {
    boardController = AppFlowyBoardScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      EventCollaborationProvider eventCollaboration =
          Provider.of<EventCollaborationProvider>(context, listen: false);
      await eventCollaboration.fetchEventCollaborationData();
    });
    EventCollaborationProvider eventCollaboration =
        Provider.of<EventCollaborationProvider>(context, listen: false);
    controller = AppFlowyBoardController(
      onMoveGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
        debugPrint('Moves item from $fromIndex to $toIndex');
      },
      onMoveGroupItem: (groupId, fromIndex, toIndex) {
        debugPrint('Movess $groupId:$fromIndex to $groupId:$toIndex');
      },
      onMoveGroupItemToGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
        debugPrint('Movessssa $fromGroupId:$fromIndex to $toGroupId:$toIndex');
        final AppFlowyGroupController fromGroupController =
            controller.getGroupController(fromGroupId)!;
        fromGroupController.removeAt(fromIndex);

        final AppFlowyGroupController toGroupController =
            controller.getGroupController(toGroupId)!;
        final movedItem = toGroupController.items[toIndex] as RichTextItem;
        final newColumnBelong = toGroupId;
        eventCollaboration.updateColumnBelong(movedItem.uid, newColumnBelong);
      },
    );
    final group1 = AppFlowyGroupData(id: "To Do", name: "To Do", items: [
      RichTextItem(
          uid: "",
          ids: 0,
          title: "",
          description: '',
          timeCreated:
              "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}:${DateTime.now().second.toString().padLeft(2, '0')}"),
    ]);

    final group2 = AppFlowyGroupData(
      id: "In Progress",
      name: "In Progress",
      items: <AppFlowyGroupItem>[
        RichTextItem(
            uid: "",
            ids: 0,
            title: "",
            description: '',
            timeCreated:
                "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}:${DateTime.now().second.toString().padLeft(2, '0')}"),
      ],
    );

    final group3 =
        AppFlowyGroupData(id: "Done", name: "Done", items: <AppFlowyGroupItem>[
      RichTextItem(
          uid: "",
          ids: 0,
          title: "",
          description: '',
          timeCreated:
              "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}:${DateTime.now().second.toString().padLeft(2, '0')}"),
    ]);

    controller.addGroup(group1);
    controller.addGroup(group2);
    controller.addGroup(group3);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    EventCollaborationProvider eventCollaboration =
        Provider.of<EventCollaborationProvider>(context);
    OrganizerProvider organizationUser =
        Provider.of<OrganizerProvider>(context);

    const config = AppFlowyBoardConfig(
      groupBackgroundColor: Palette.purpleLow,
      stretchGroupHeight: false,
    );
    return StreamBuilder<List<EventCollaborationModel>>(
      stream: eventCollaboration.collaborationDataStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        // Clear existing group items
        group1Items.clear();
        group2Items.clear();
        group3Items.clear();

        for (var collaborationDetail in snapshot.data ?? []) {
          final richTextItem = RichTextItem(
            uid: collaborationDetail.id,
            ids: int.parse(collaborationDetail.cardId ?? ""),
            title: collaborationDetail.title ?? "",
            description: collaborationDetail.subTitle ?? "",
            timeCreated: collaborationDetail.lastEditDate ?? "",
          );

          if (collaborationDetail.columnBelong == "To Do") {
            group1Items.add(richTextItem);
          } else if (collaborationDetail.columnBelong == "In Progress") {
            group2Items.add(richTextItem);
          } else if (collaborationDetail.columnBelong == "Done") {
            group3Items.add(richTextItem);
          }

          final int parsedCardId = int.parse(collaborationDetail.cardId ?? "");

          if (parsedCardId > _currentId) {
            _currentId = parsedCardId;
          }
        }

        controller.clear();
        controller.addGroup(
            AppFlowyGroupData(id: "To Do", name: "To Do", items: group1Items));
        controller.addGroup(AppFlowyGroupData(
            id: "In Progress", name: "In Progress", items: group2Items));
        controller.addGroup(
            AppFlowyGroupData(id: "Done", name: "Done", items: group3Items));

        return AppFlowyBoard(
          controller: controller,
          cardBuilder: (context, group, groupItem) {
            return AppFlowyGroupCard(
              key: ValueKey(groupItem.id),
              child: _buildCard(groupItem),
            );
          },
          boardScrollController: boardController,
          footerBuilder: (context, columnData) {
            return AppFlowyGroupFooter(
              icon: const Icon(Icons.add, size: 20),
              title: const Text('New'),
              height: 50,
              onAddButtonClick: () {
                final groupController = controller
                    .getGroupController(columnData.headerData.groupId)!;
                int newId = _generateId();
                String diffId = const Uuid().v4();
                String title = 'New Title';
                String subscription = 'Subscription';
                final userUID = organizationUser.organizers.id;
                final newCollaboration = EventCollaborationModel(
                  id: diffId,
                  cardId: newId.toString(),
                  columnBelong: columnData.headerData.groupId,
                  title: title,
                  subTitle: subscription,
                  lastEditDate:
                      "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}:${DateTime.now().second.toString().padLeft(2, '0')}",
                       startDate: "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}",
                  endDate: "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}",
                  storyPoint: "1",
                );
                eventCollaboration.createCollaborationDetails(
                    newCollaboration, userUID);
                final newCard = RichTextItem(
                    uid: diffId,
                    ids: newId,
                    title: title,
                    description: subscription,
                    timeCreated:
                        "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}:${DateTime.now().second.toString().padLeft(2, '0')}");
                groupController.add(newCard);
                boardController.scrollToBottom(columnData.id);
              },
            );
          },
          headerBuilder: (context, columnData) {
            return AppFlowyGroupHeader(
              icon: const Icon(Icons.lightbulb_circle),
              title: SizedBox(
                width: 60,
                child: Text(
                  columnData.headerData.groupName,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              addIcon: const Icon(Icons.add, size: 20),
              moreIcon: const Icon(Icons.more_horiz, size: 20),
              height: 50,
              onAddButtonClick: () {
                // Handle add button click
                final groupController = controller
                    .getGroupController(columnData.headerData.groupId)!;
                int newId = _generateId();
                String diffId = const Uuid().v4();
                String title = 'New Title';
                String subscription = 'Subscription';
                final userUID = organizationUser.organizers.id;
                final newCollaboration = EventCollaborationModel(
                  id: diffId,
                  cardId: newId.toString(),
                  columnBelong: columnData.headerData.groupId,
                  title: title,
                  subTitle: subscription,
                  lastEditDate:
                      "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}:${DateTime.now().second.toString().padLeft(2, '0')}",
                  startDate: "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}",
                  endDate: "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}",
                  storyPoint: "1",
                );
                eventCollaboration.createCollaborationDetails(
                    newCollaboration, userUID);
                final newCard = RichTextItem(
                    uid: diffId,
                    ids: newId,
                    title: title,
                    description: subscription,
                    timeCreated:
                        "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}:${DateTime.now().second.toString().padLeft(2, '0')}");
                groupController.add(newCard);
                boardController.scrollToBottom(columnData.id);
              },
              onMoreButtonClick: () {
                print('test on more button');
              },
            );
          },
          groupConstraints: const BoxConstraints.tightFor(width: 240),
          config: config,
        );
      },
    );
  }

  Widget _buildCard(AppFlowyGroupItem item) {
    //ni tempat card semua di cipta
    if (item is RichTextItem) {
      return RichTextCard(item: item);
    }

    throw UnimplementedError();
  }
}

//-----------------------------------------------------------------------------------------------

class RichTextCard extends StatefulWidget {
  final RichTextItem item;

  const RichTextCard({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  State<RichTextCard> createState() => _RichTextCardState();
}

class _RichTextCardState extends State<RichTextCard> {
  late String _title;
  late String _description;
  late String _timeCreated;
  late String _id;
  late String _uid;

  @override
  void initState() {
    super.initState();
    _title = widget.item.title;
    _description = widget.item.description;
    _timeCreated = widget.item.timeCreated;
    _id = widget.item.id;
    _uid = widget.item.uid;
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      EventCollaborationProvider eventCollaboration =
          Provider.of<EventCollaborationProvider>(context);
      return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Palette.lightGrey,
              width: 2,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: InkWell(
            onTap: _changeTitleAndSubtitle,
            onLongPress: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(Translation.deleteTaskTitle.getString(context)),
                    content:
                        Text(Translation.deleteTaskQuestion.getString(context)),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(Translation.cancel.getString(context)),
                      ),
                      TextButton(
                        onPressed: () {
                          eventCollaboration.deleteEventCollaboration(_uid);
                          Navigator.of(context).pop();
                        },
                        child: Text(Translation.delete.getString(context)),
                      ),
                    ],
                  );
                },
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _id,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                SpacerV(
                  value: Dimens.space12,
                ),
                Text(
                  _title,
                  style: const TextStyle(fontSize: 14, color: Colors.blue),
                  textAlign: TextAlign.left,
                ),
                Text(
                  _description,
                  style: const TextStyle(fontSize: 12, color: Palette.grey),
                  textAlign: TextAlign.left,
                ),
                SpacerV(
                  value: Dimens.space10,
                ),
                Text(
                  _timeCreated,
                  style: const TextStyle(fontSize: 12, color: Colors.red),
                ),
                SpacerV(
                  value: Dimens.space10,
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.green,
                      child: Icon(Icons.person, size: 18),
                    ),
                    SpacerH(
                      value: Dimens.space8,
                    ),
                    const Text(
                      "John Doe",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  void _changeTitleAndSubtitle() async {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    titleController.text = _title;
    descriptionController.text = _description;

    await showDialog(
      context: context,
      builder: (context) {
        EventCollaborationProvider eventCollaboration =
            Provider.of<EventCollaborationProvider>(context);
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
            side: const BorderSide(
              color: Palette.purpleMain,
              width: 3,
            ),
          ),
          title: Text(
            _id,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                controller: titleController,
                labelText: Translation.taskTitle.getString(context),
              ),
              SpacerV(
                value: Dimens.space8,
              ),
              CustomTextField(
                controller: descriptionController,
                labelText: Translation.taskDescription.getString(context),
                multiLine: true,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(Translation.cancel.getString(context)),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _title = titleController.text;
                  _description = descriptionController.text;
                });
                eventCollaboration.updateTaskDetails(
                    _uid, _title, _description);
                Navigator.pop(context);
              },
              child: Text(Translation.save.getString(context)),
            ),
          ],
        );
      },
    );
  }
}

class RichTextItem extends AppFlowyGroupItem {
  final String uid;
  final int ids;
  final String title;
  final String description;
  final String timeCreated;

  RichTextItem(
      {required this.uid,
      required this.ids,
      required this.title,
      required this.timeCreated,
      required this.description});

  @override
  // TODO: implement id
  String get id => "CEMS-$ids";
}
