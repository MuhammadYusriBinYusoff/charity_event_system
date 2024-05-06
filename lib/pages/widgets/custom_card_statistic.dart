import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class CustomStatisticCard extends StatelessWidget {
  final ValueNotifier<double> valueNotifier;
  final TextStyle centerTextStyle;
  final String statisticText;

  const CustomStatisticCard({
    Key? key,
    required this.valueNotifier,
    required this.centerTextStyle,
    required this.statisticText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.space10),
      ),
      child: Padding(
        padding: EdgeInsets.all(Dimens.space16),
        child: Column(
          children: [
            SimpleCircularProgressBar(
              valueNotifier: valueNotifier,
              animationDuration: 4,
              mergeMode: true,
              onGetText: (value) {
                return Text(
                  '${value.toInt()}%',
                  style: centerTextStyle,
                );
              },
              progressColors: const [
                Palette.redIndicator,
                Palette.greenIndicator
              ],
              backColor: Colors.black.withOpacity(0.4),
            ),
            SpacerV(
              value: Dimens.space16,
            ),
            Text(
              statisticText,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
