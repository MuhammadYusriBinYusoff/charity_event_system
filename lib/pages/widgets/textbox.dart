import 'package:charity_event_system/common/common.dart';
import 'package:flutter/material.dart';

Widget buildTextField({
  TextEditingController? controller,
  String? labelText,
  String? hintText,
  bool obscureText = false,
  bool multiLine = false,
}) {
  return Container(
    padding: EdgeInsets.only(left: Dimens.space8, right: Dimens.space8), // Adjust padding as needed
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(8),
    ),
    child: SizedBox(
      height: multiLine ? null : 54, // Set height to null for multi-line text fields
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        maxLines: multiLine ? null : 1, // Allow multiple lines if multiLine is true
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          labelText: labelText,
          hintText: hintText,
        ),
      ),
    ),
  );
}

