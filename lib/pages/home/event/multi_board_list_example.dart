import 'package:appflowy_board/appflowy_board.dart';
import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/common/resources/palette.dart';
import 'package:charity_event_system/pages/widgets/spacer_v.dart';
import 'package:flutter/material.dart';

class MultiBoardListExample extends StatefulWidget {
  const MultiBoardListExample({Key? key}) : super(key: key);

  @override
  State<MultiBoardListExample> createState() => _MultiBoardListExampleState();
}

class _MultiBoardListExampleState extends State<MultiBoardListExample> {
  final AppFlowyBoardController controller = AppFlowyBoardController(
    onMoveGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
      //ini nak pindahkan column big tuuu
      debugPrint('Moves item from $fromIndex to $toIndex');
    },
    onMoveGroupItem: (groupId, fromIndex, toIndex) {
      debugPrint('Movess $groupId:$fromIndex to $groupId:$toIndex');
    },
    onMoveGroupItemToGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
      //ni kalau pindakhan card
      debugPrint('Movessss $fromGroupId:$fromIndex to $toGroupId:$toIndex');
    },
  );

  late AppFlowyBoardScrollController boardController;
  int _currentId = 0;

  int _generateId() {
    return ++_currentId;
  }

  @override
  void initState() {
    boardController = AppFlowyBoardScrollController();
    final group1 = AppFlowyGroupData(id: "To Do", name: "To Do", items: [
      RichTextItem(ids:_generateId(),title: "Card $_currentId",description: 'New Description'  ,timeCreated: "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}:${DateTime.now().second.toString().padLeft(2, '0')}"),
    ]);

    final group2 = AppFlowyGroupData(
      id: "In Progress",
      name: "In Progress",
      items: <AppFlowyGroupItem>[
        RichTextItem(ids:_generateId(),title: "Card $_currentId",description: 'New Description'  ,timeCreated: "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}:${DateTime.now().second.toString().padLeft(2, '0')}"),
        RichTextItem(ids:_generateId(),title: "Card $_currentId",description: 'New Description'  ,timeCreated: "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}:${DateTime.now().second.toString().padLeft(2, '0')}"),
      ],
    );

    final group3 =
        AppFlowyGroupData(id: "Dome", name: "Done", items: <AppFlowyGroupItem>[
      RichTextItem(ids:_generateId(),title: "Card $_currentId",description: 'New Description' , timeCreated: "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}:${DateTime.now().second.toString().padLeft(2, '0')}"),
    ]);

    controller.addGroup(group1);
    controller.addGroup(group2);
    controller.addGroup(group3);

    super.initState();
  }

  // Function to generate a unique id for RichTextItems


  @override
  Widget build(BuildContext context) {
    final config = AppFlowyBoardConfig( //Group refer pada kotak panajng to do , in progress and done
      groupBackgroundColor: Palette.purpleLow,
      stretchGroupHeight: false,
    );
    return AppFlowyBoard(
        controller: controller,
        cardBuilder: (context, group, groupItem) {
          return AppFlowyGroupCard(
            key: ValueKey(groupItem.id), //id ni refer to nama or title card
            child: _buildCard(groupItem),
          );
        },
        boardScrollController: boardController,
        footerBuilder: (context, columnData) {
          return AppFlowyGroupFooter(
            icon: const Icon(Icons.add, size: 20),
            title: const Text('New'),
            height: 50,
            //margin: config.groupBodyPadding,
            onAddButtonClick: () {  //ni button  new kat bawah tuuu
              print("sasssss");
              final groupController =
                  controller.getGroupController(columnData.headerData.groupId)!;
              final newCard =
                  RichTextItem(ids:_generateId(),title: 'New Title',description: 'New Description' , timeCreated: "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}:${DateTime.now().second.toString().padLeft(2, '0')}");
              groupController.add(newCard);
              boardController.scrollToBottom(columnData.id);
            },
          );
        },
        headerBuilder: (context, columnData) {  //group header punya elemnt
          return AppFlowyGroupHeader(
            icon: const Icon(Icons.lightbulb_circle),
            title: SizedBox(
              width: 60,
              child: TextField(
                controller: TextEditingController()
                  ..text = columnData.headerData.groupName,
                onSubmitted: (val) {
                  controller
                      .getGroupController(columnData.headerData.groupId)!
                      .updateGroupName(val);
                },
              ),
            ),
            addIcon: const Icon(Icons.add, size: 20),
            moreIcon: const Icon(Icons.more_horiz, size: 20),
            height: 50,
            onAddButtonClick: () {
              final groupController =
                  controller.getGroupController(columnData.headerData.groupId)!;
              final newCard =
                  RichTextItem(ids:_generateId(),title: 'New Title',description: 'New Description' ,timeCreated: "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}:${DateTime.now().second.toString().padLeft(2, '0')}");
              groupController.add(newCard);
            },

            onMoreButtonClick: () {
              print('qqqqqq');
            },
            //margin: config.groupBodyPadding,
          );
        },
        groupConstraints: const BoxConstraints.tightFor(width: 240),
        config: config);
  }

  Widget _buildCard(AppFlowyGroupItem item) {  //ni tempat card semua di cipta
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

  @override
  void initState() {
    super.initState();
    _title = widget.item.title;
    _description = widget.item.description;
    _timeCreated = widget.item.timeCreated;
    _id = widget.item.id;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: InkWell(
          onTap: _changeTitleAndSubtitle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _id,
                style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              SpacerV(value:Dimens.space12),
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
              const SizedBox(height: 10),
              Text(
                _timeCreated,
                style: const TextStyle(fontSize: 12, color: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _changeTitleAndSubtitle() async {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    titleController.text = _title;
    descriptionController.text = _description;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Change Title and Subtitle'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Subtitle'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _title = titleController.text;
                  _description = descriptionController.text;
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

class RichTextItem extends AppFlowyGroupItem {
  final int ids;
  final String title;
  final String description;
  final String timeCreated;

  RichTextItem({required this.ids, required this.title, required this.timeCreated, required this.description});

  @override
  // TODO: implement id
  String get id => "CEMS-$ids";
}
