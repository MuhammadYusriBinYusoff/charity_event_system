import 'package:flutter/material.dart';
import 'package:charity_event_system/common/resources/resources.dart';

class CustomChosenButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const CustomChosenButton({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320, // Adjust button width as needed
      height: 64, // Adjust button height as needed
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Palette.purpleMain,
          textStyle: const TextStyle(fontSize: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 24,
            color: Palette.white,
            fontFamily: 'Inter',
          ),
        ),
      ),
    );
  }
}
