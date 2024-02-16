import 'package:charity_event_system/common/resources/dimens.dart';
import 'package:flutter/material.dart';

class SpacerH extends StatelessWidget {
  const SpacerH({super.key, this.value});
  final double? value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: value ?? Dimens.space8);
  }
}