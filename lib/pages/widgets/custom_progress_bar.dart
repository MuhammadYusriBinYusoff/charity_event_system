import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

class ProgressBarIndicator extends StatelessWidget {
  final double? value;

  const ProgressBarIndicator({
    super.key,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProgressBar(
          value: value,
          width: 180.0,
          backgroundColor: Palette.greyIndicator,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Palette.blueIndicatorLight,Palette.blueLink],
          ),
        ),
        SpacerH(value: Dimens.space8,),
        Text(
          '${(value ?? 0) * 100}%',
          style: const TextStyle(fontSize: 10,color: Palette.grey),
        ),
      ],
    );
  }
}
