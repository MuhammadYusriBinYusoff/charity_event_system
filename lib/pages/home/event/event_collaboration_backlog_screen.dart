import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/models/models.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BacklogItemDetailsScreen extends StatelessWidget {
  const BacklogItemDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EventCollaborationProvider eventCollaboration =
        Provider.of<EventCollaborationProvider>(context);

    return Container(
      padding: EdgeInsets.all(Dimens.space4),
      decoration: BoxDecoration(
        border: Border.all(
          color: Palette.black,
          width: Dimens.space1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Backlog",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SpacerV(
            value: Dimens.space16,
          ),
          StreamBuilder<List<EventCollaborationModel>>(
            stream: eventCollaboration.collaborationDataStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final List<EventCollaborationModel> collaborationList =
                    snapshot.data ?? [];
                return SizedBox(
                  height: Dimens.space300,
                  child: Scrollbar(
                    trackVisibility: true,
                    thickness: 6,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: collaborationList.length,
                      itemBuilder: (context, index) {
                        final EventCollaborationModel item =
                            collaborationList[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AddBacklogItemScreen(item: item),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom:Dimens.space1),
                            padding: EdgeInsets.all(Dimens.space4),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Palette.purpleMain, width: Dimens.space2),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CEMS ${item.cardId}: ${item.title}',
                                  style: const TextStyle(fontWeight: FontWeight.w500),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Priority: ${item.title}'),
                                      SpacerH(value: Dimens.space16),
                                      Text(
                                        'Status: ${item.columnBelong}',
                                        style: TextStyle(
                                          color: item.columnBelong == 'Done'
                                              ? Palette.greenIndicator
                                              : item.columnBelong ==
                                                      'In Progress'
                                                  ? Palette.yellowMark
                                                  : Palette
                                                      .black,
                                        ),
                                      ),
                                      SpacerH(value: Dimens.space16),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
