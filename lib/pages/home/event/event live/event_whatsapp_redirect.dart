// import 'package:charity_event_system/common/common.dart';
// import 'package:charity_event_system/pages/pages.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_localization/flutter_localization.dart';

// // ignore: must_be_immutable
// class WhatsappRedirect extends StatefulWidget {
//   int? totalScore;
//   bool? isOrganizer;

//   WhatsappRedirect({super.key, this.totalScore = 0, this.isOrganizer = false});

//   @override
//   State<UserFeedbackScore> createState() => _UserFeedbackScoreState();
// }

// class _UserFeedbackScoreState extends State<UserFeedbackScore> {
//   final centerTextStyle = const TextStyle(
//     fontSize: 32,
//     color: Colors.lightBlue,
//     fontWeight: FontWeight.bold,
//   );

//   late ValueNotifier<double> valueNotifier;

//   late ValueNotifier<double> valueNotifier2;
//   String title = "";
//   String subtitle = "";
//   String ceoComment = "\nYours sincerely\nYusri\n(SpiraCare CEO)";
//   Color titleColor = Palette.greenIndicator;

//   @override
//   void initState() {
//     super.initState();
//     valueNotifier = ValueNotifier(40);
//     valueNotifier2 = ValueNotifier((widget.totalScore ?? 0).toDouble());
//     setFeedbackMessage();
//   }

// //Ade problem sikit nak pakai localization
// //dah buat dah Translation.feedbackStatisticTitle1
//   void setFeedbackMessage() {
//     if (widget.isOrganizer ?? true) {
//       if (widget.totalScore! < 30) {
//         title = "Attention!";
//         subtitle =
//             "The organizer's track record in our app is below expectations. There may be issues with activity levels and user engagement";
//         titleColor = Palette.redWarning;
//       } else if (widget.totalScore! >= 75) {
//         title = "Excellent!";
//         subtitle =
//             "The organizer has a strong track record in conducting charity events, consistently earning the trust of the community through their past and current events.";
//         titleColor = Palette.greenIndicator;
//       } else {
//         title = "Moderate!";
//         subtitle =
//             "The organizer has a moderate track record in our app. They have earned the trust of several users. Overall, the achievement is satisfactory but has room for improvement";
//         titleColor = Palette.yellowMark;
//       }
//     } else {
//       if (widget.totalScore! < 30) {
//         title = "Attention!";
//         subtitle =
//             "This event is new and has not yet received enough votes from users. Feel free to rate the organizer. Thank you for your support.";
//         titleColor = Palette.redWarning;
//       } else if (widget.totalScore! >= 75) {
//         title = "Excellent!";
//         subtitle =
//             "The organizer has a strong track record in conducting charity events and consistently earning the trust of the community.";
//         titleColor = Palette.greenIndicator;
//       } else {
//         title = "Moderate!";
//         subtitle =
//             "This event has gain trust of several users. Overall, the achievement is satisfactory but has room for improvement";
//         titleColor = Palette.yellowMark;
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Stack(
//         children: [
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SpacerV(
//                   value: Dimens.space200,
//                 ),
//                 CustomStatisticCard(
//                   removeBackground: true,
//                   size: 132,
//                   valueNotifier: valueNotifier2,
//                   centerTextStyle: centerTextStyle,
//                   statisticText: Translation.overallScore.getString(context),
//                 ),
//                 SpacerV(
//                   value: Dimens.space20,
//                 ),
//                 Text(
//                   ceoComment,
//                   style: const TextStyle(
//                       fontSize: 12,
//                       color: Palette.greyDark,
//                       fontStyle: FontStyle.italic),
//                   textAlign: TextAlign.center,
//                 )
//               ],
//             ),
//           ),
//           Positioned(
//             top: Dimens.space100,
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               padding: const EdgeInsets.all(45),
//               color: Colors.transparent,
//               child: Center(
//                 child: Column(
//                   children: [
//                     Text(
//                       title,
//                       style: TextStyle(
//                           fontSize: 32,
//                           fontWeight: FontWeight.bold,
//                           color: titleColor),
//                     ),
//                     Text(
//                       subtitle,
//                       style: const TextStyle(fontSize: 16),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }