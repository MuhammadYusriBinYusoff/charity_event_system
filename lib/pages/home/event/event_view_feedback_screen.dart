import 'package:charity_event_system/common/resources/resources.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventManageFeedbackPage extends StatefulWidget {
  final String? session;
  final int?  totalScore;

  const EventManageFeedbackPage({
    Key? key,
    this.session = 'update',
    this.totalScore = 0,
  }) : super(key: key);

  @override
  _EventManageFeedbackPageState createState() =>
      _EventManageFeedbackPageState();
}

class _EventManageFeedbackPageState extends State<EventManageFeedbackPage> {
  final centerTextStyle = const TextStyle(
    fontSize: 28,
    color: Colors.lightBlue,
    fontWeight: FontWeight.bold,
  );
  late ValueNotifier<double> valueNotifier;
  late ValueNotifier<double> valueNotifier2;

  @override
  void initState() {
    super.initState();
    valueNotifier = ValueNotifier(40);
    valueNotifier2 = ValueNotifier((widget.totalScore ?? 0).toDouble());
  }

  @override
  Widget build(BuildContext context) {
    OrganizerProvider organizationUser =
        Provider.of<OrganizerProvider>(context);
    EventItemsProvider eventItems = Provider.of<EventItemsProvider>(context);

    List<String> comments = [
      'Comment 1',
      'Comment 2',
      'Comment 3',
      'Comment 1',
      'Comment 2',
      'Comment 3',
      'Comment 1',
      'Comment 2',
      'Comment 3',
      'Comment 1',
      'Comment 2',
      'Comment 3',
      // Add more comments as needed
    ];

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
              padding: EdgeInsets.all(Dimens.space24),
              color: Palette.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          CustomStatisticCard(
                            valueNotifier: valueNotifier,
                            centerTextStyle: centerTextStyle,
                            statisticText: 'Overall Score',
                          ),
                        ],
                      ),
                      SpacerH(
                        value: Dimens.space32,
                      ),
                      Column(
                        children: [
                          CustomStatisticCard(
                            valueNotifier: valueNotifier2,
                            centerTextStyle: centerTextStyle,
                            statisticText: 'Current Score',
                          ),
                        ],
                      ),
                    ],
                  ),
                  SpacerV(
                    value: Dimens.space32,
                  ),
                  CommentCard(
                    comments: comments,
                  )
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
    super.dispose();
  }
}
