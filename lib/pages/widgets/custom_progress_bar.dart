import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

class ProgressBarIndicator extends StatelessWidget {
  final double? value;
  final double width;
  final double height;

  const ProgressBarIndicator({
    super.key,
    this.value,
    this.width = 180.0,
    this.height = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProgressBar(
          value: value,
          width: width,
          height: height,
          backgroundColor: Palette.greyIndicator,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Palette.blueIndicatorLight,Palette.blueLink],
          ),
        ),
        SpacerH(value: Dimens.space8,),
        Text(
          '${((value ?? 0) * 100).toStringAsFixed(1)}%',
          style: const TextStyle(fontSize: 10,color: Palette.black),
        ),
      ],
    );
  }
}
