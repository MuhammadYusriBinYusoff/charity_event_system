import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:flutter/material.dart';

class ErrorAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String buttonText;

  const ErrorAlertDialog({
    super.key,
    required this.title,
    required this.content,
    this.buttonText = 'OK',
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Palette.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(color: Palette.black),
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.error, color: Palette.redButton),
          SpacerH(value: Dimens.space10),
          Text(
            title,
            style: const TextStyle(color: Palette.black),
          ),
        ],
      ),
      content: Text(
        content,
        style: const TextStyle(color: Palette.black),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            buttonText,
            style: const TextStyle(color: Palette.black),
          ),
        ),
      ],
    );
  }
}
