import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/home/event/multi_board_list_example.dart';
import 'package:charity_event_system/pages/home/event/single_board_list_example.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:kanban_board/custom/board.dart';
import 'package:kanban_board/models/inputs.dart';

//Custom Kanban board example 3
// class EventCollaborationPage extends StatefulWidget {
//   @override
//   _EventCollaborationPageState createState() => _EventCollaborationPageState();
// }

// class _EventCollaborationPageState extends State<EventCollaborationPage> {
//   List<List<String>> _lists = [
//     ['Task 1', 'Task 2'],
//     ['Task 3', 'Task 4'],
//     ['Task 5', 'Task 6']
//   ];

//   // Variables to track task dragging
//   int? _draggingListIndex;
//   int? _draggingTaskIndex;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Kanban Board'),
//       ),
//       body: Row(
//         children: List.generate(
//           _lists.length,
//           (listIndex) => _buildList(listIndex),
//         ),
//       ),
//     );
//   }

//   Widget _buildList(int listIndex) {
//     return Expanded(
//       child: Container(
//         margin: EdgeInsets.all(8.0),
//         decoration: BoxDecoration(
//           color: Colors.grey.shade200,
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text(
//                 'List ${listIndex + 1}',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: DragTarget<String>(
//                 onWillAccept: (data) => true,
//                 onAccept: (task) {
//                   setState(() {
//                     _lists[listIndex].add(task!);
//                   });
//                 },
//                 builder: (context, candidateData, rejectedData) {
//                   return ReorderableListView(
//                     onReorder: (oldIndex, newIndex) {
//                       if (oldIndex != newIndex) {
//                         setState(() {
//                           if (oldIndex < newIndex) {
//                             newIndex -= 1;
//                           }
//                           final task = _lists[listIndex].removeAt(oldIndex);
//                           _lists[listIndex].insert(newIndex, task);
//                         });
//                       }
//                     },
//                     children: _buildTasks(listIndex),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   List<Widget> _buildTasks(int listIndex) {
//     return List.generate(
//       _lists[listIndex].length,
//       (taskIndex) => _buildTask(listIndex, taskIndex),
//     );
//   }

//   Widget _buildTask(int listIndex, int taskIndex) {
//   final String task = _lists[listIndex][taskIndex];
//   final bool isDragging =
//       _draggingListIndex == listIndex && _draggingTaskIndex == taskIndex;

//   return ListTile(
//     key: ValueKey('${listIndex}_$taskIndex'), // Corrected line
//     title: Text(task),
//     onLongPress: () => _startDragging(listIndex, taskIndex),
//     onTap: () => _renameTask(listIndex, taskIndex),
//     enabled: !isDragging,
//   );
// }

//   void _startDragging(int listIndex, int taskIndex) {
//     setState(() {
//       _draggingListIndex = listIndex;
//       _draggingTaskIndex = taskIndex;
//     });
//   }

//   void _renameTask(int listIndex, int taskIndex) {
//     final TextEditingController controller = TextEditingController();
//     controller.text = _lists[listIndex][taskIndex];

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Rename Task'),
//           content: TextField(
//             controller: controller,
//             onChanged: (value) => controller.text = value,
//             decoration: InputDecoration(hintText: 'Enter new task name'),
//           ),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   _lists[listIndex][taskIndex] = controller.text;
//                 });
//                 Navigator.pop(context);
//               },
//               child: Text('Rename'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

//Plugin 1
// class EventCollaborationPage extends StatefulWidget {
//   const EventCollaborationPage({super.key});

//   @override
//   State<EventCollaborationPage> createState() => _EventCollaborationPageState();
// }

// class _EventCollaborationPageState extends State<EventCollaborationPage> {
//   @override
//   Widget build(BuildContext context) {
//     return KanbanBoard(
//       List.generate(
//         3,
//         (index) => BoardListsData(
//             items: List.generate(
//           2,
//           (index) => Container(
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(4),
//                 border: Border.all(
//                   color: Colors.grey.shade200,
//                 )),
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//                 "Lorem ipsum dolor sit amet, sunt in culpa qui officia deserunt mollit anim id est laborum. $index",
//                 style: const TextStyle(
//                     fontSize: 16,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w500)),
//           ),
//         )),
//       ),
//       onItemLongPress: (cardIndex, listIndex) {},
//       onItemReorder:
//           (oldCardIndex, newCardIndex, oldListIndex, newListIndex) {print("lllll");},
//       onListLongPress: (listIndex) {print("ccccccc");},
//       onListReorder: (oldListIndex, newListIndex) {print("xxxxxxxx");},
//       onItemTap: (cardIndex, listIndex) {print("zzzzzzz");},
//       onListTap: (listIndex) {print(listIndex);},
//       onListRename: (oldName, newName) {print("dddddd");},
//       backgroundColor: Colors.white,
//       displacementY: 124,
//       displacementX: 100,
//       textStyle: const TextStyle(
//           fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
//     );
//   }
// }

//Plugin 2
class EventCollaborationPage extends StatefulWidget {
  const EventCollaborationPage({Key? key}) : super(key: key);

  @override
  State<EventCollaborationPage> createState() => _EventCollaborationPageState();
}

class _EventCollaborationPageState extends State<EventCollaborationPage> {
  int _currentIndex = 0;
  final _bottomNavigationColor = Colors.blue;

  final List<Widget> _examples = [
    const MultiBoardListExample(),
    const SingleBoardListExample(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                          // Close the dialog
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
          child: Column(
            children: [
              SpacerV(value: Dimens.space56,),
              Container(padding:EdgeInsets.all(Dimens.space16), color: Palette.white, child: _examples[_currentIndex]),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: _bottomNavigationColor,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_on, color: _bottomNavigationColor),
                label: "MultiColumn"),
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_on, color: _bottomNavigationColor),
                label: "SingleColumn"),
          ],
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}
