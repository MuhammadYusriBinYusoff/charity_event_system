import 'package:charity_event_system/common/resources/dimens.dart';
import 'package:flutter/material.dart';

class SpacerV extends StatelessWidget {
  const SpacerV({super.key, this.value});
  final double? value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: value ?? Dimens.space8);
  }
}