import 'package:charity_event_system/common/common.dart';
import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const CircleIcon({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.space8),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(Dimens.space8),
          width: Dimens.space45,
          height: Dimens.space45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Palette.purpleMain,
            border: Border.all(
              width: 0.5
            )
          ),
          child: Icon(
            icon,
            color: Palette.white,
            size: Dimens.space22,
          ),
        ),
      ),
    );
  }
}
