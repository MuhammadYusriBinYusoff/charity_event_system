import 'package:charity_event_system/common/resources/resources.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

class EventManageFeedbackPage extends StatefulWidget {
  final String? session;
  final int? totalScore;
  final int? overalTotalScore;
  final List<String?> comments;

  const EventManageFeedbackPage({
    Key? key,
    this.session = 'update',
    this.totalScore = 0,
    this.overalTotalScore = 0,
    this.comments = const ['none'],
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
    valueNotifier = ValueNotifier((widget.overalTotalScore ?? 0).toDouble());
    valueNotifier2 = ValueNotifier((widget.totalScore ?? 0).toDouble());
  }

  @override
  Widget build(BuildContext context) {
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
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserFeedbackScore(
                                        totalScore: widget.overalTotalScore,
                                        isOrganizer: true,
                                      )),
                            ),
                            child: CustomStatisticCard(
                              valueNotifier: valueNotifier,
                              centerTextStyle: centerTextStyle,
                              statisticText:
                                  Translation.overallScore.getString(context),
                            ),
                          ),
                        ],
                      ),
                      SpacerH(
                        value: Dimens.space24,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserFeedbackScore(
                                        totalScore: widget.totalScore,
                                        isOrganizer: true,
                                      )),
                            ),
                            child: CustomStatisticCard(
                              valueNotifier: valueNotifier2,
                              centerTextStyle: centerTextStyle,
                              statisticText:
                                  Translation.currentScore.getString(context),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SpacerV(
                    value: Dimens.space32,
                  ),
                  CommentCard(
                    comments: widget.comments,
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
