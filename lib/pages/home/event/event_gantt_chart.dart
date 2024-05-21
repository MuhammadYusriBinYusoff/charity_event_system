import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:gantt_chart/gantt_chart.dart';
import 'package:provider/provider.dart';

class GanntChartScreen extends StatefulWidget {
  const GanntChartScreen({Key? key}) : super(key: key);

  @override
  State<GanntChartScreen> createState() => _GanntChartScreenState();
}

class _GanntChartScreenState extends State<GanntChartScreen> {
  bool showStickyArea = true;

  @override
  Widget build(BuildContext context) {
    EventCollaborationProvider eventCollaboration =
        Provider.of<EventCollaborationProvider>(context);

    List<GanttAbsoluteEvent> ganttEvents =
        eventCollaboration.collaborationDetailsList.map((item) {
      DateTime startDate = item.startDate != null
          ? DateTime.parse(item.startDate!)
          : DateTime.now();
      DateTime endDate =
          item.endDate != null ? DateTime.parse(item.endDate!) : DateTime.now();
      return GanttAbsoluteEvent(
        startDate: startDate,
        endDate: endDate,
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SwitchListTile.adaptive(
          value: showStickyArea,
          title: const Text('Show Sticky Area?'),
          onChanged: (value) {
            setState(() {
              showStickyArea = value;
            });
          },
        ),
        const Text(
          "Gantt Chart",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SpacerV(
          value: Dimens.space16,
        ),
        GanttChartView(
          maxDuration: null,
          startDate: DateTime.now(),
          dayWidth: 30,
          eventHeight: 30,
          stickyAreaWidth: MediaQuery.of(context).size.width * 0.38,
          showStickyArea: showStickyArea,
          showDays: true,
          startOfTheWeek: WeekDay.sunday,
          weekEnds: const {WeekDay.friday, WeekDay.saturday},
          isExtraHoliday: (context, day) {
            return DateUtils.isSameDay(DateTime(2025, 1, 2), day);
          },
          events: ganttEvents,
          stickyAreaEventBuilder: (context, eventIndex, event, eventColor) {
            String cardId = eventCollaboration
                    .collaborationDetailsList[eventIndex].cardId ??
                '';

            String title =
                eventCollaboration.collaborationDetailsList[eventIndex].title ??
                    'No Title';

            return Container(
              color: eventColor,
              child: Center(
                child: Text(
                  "CEMS $cardId: $title",
                  style: const TextStyle(color: Palette.white),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
