import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class CustomStatisticCard extends StatelessWidget {
  final ValueNotifier<double> valueNotifier;
  final TextStyle centerTextStyle;
  final String statisticText;
  final double? size;
  final bool? removeBackground;
  final bool? adjustBackgroundCircle;
  final double? backStrock;
  final double? progressStrock;

  const CustomStatisticCard({
    Key? key,
    required this.valueNotifier,
    required this.centerTextStyle,
    required this.statisticText,
    this.size = 100,
    this.removeBackground = false,
    this.adjustBackgroundCircle = false,
    this.backStrock = 25,
    this.progressStrock = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (removeBackground ?? true) {
      return Padding(
        padding: EdgeInsets.all(Dimens.space16),
        child: Container(
          height: adjustBackgroundCircle == true ? 60 : null,
          width: adjustBackgroundCircle == true ? 60 : null,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Palette.white,
            border: Border.all(
              color: Palette.purpleMain,
              width: 3,
            ),
          ),
          child: SimpleCircularProgressBar(
            size: size ?? 100,
            backStrokeWidth: backStrock ?? 0,
            progressStrokeWidth: backStrock ?? 0,
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
              Palette.redWarning,
              Palette.yellowMark,
              Palette.greenIndicator
            ],
            backColor: Palette.greyIndicator,
          ),
        ),
      );
    } else {
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
                size: size ?? 100,
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
                  Palette.redWarning,
                  Palette.yellowMark,
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
}
