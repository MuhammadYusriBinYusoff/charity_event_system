import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:flutter/material.dart';

class EventCollaborationPage extends StatefulWidget {
  const EventCollaborationPage({Key? key}) : super(key: key);

  @override
  State<EventCollaborationPage> createState() => _EventCollaborationPageState();
}

class _EventCollaborationPageState extends State<EventCollaborationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SpacerV(
              value: Dimens.space56,
            ),
            Container(
              padding: EdgeInsets.all(Dimens.space4),
              child: const GanntChartScreen()),
            SpacerV(
              value: Dimens.space32,
            ),
            const BacklogItemDetailsScreen(),
            SpacerV(
              value: Dimens.space16,
            ),
            Container(
                padding: EdgeInsets.all(Dimens.space16),
                color: Palette.lightGrey,
                child: const MultiBoardListExample()),
          ],
        ),
      ),
    );
  }
}
