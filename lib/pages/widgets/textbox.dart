import 'package:charity_event_system/common/common.dart';
import 'package:flutter/material.dart';


Widget buildTextField({
  required TextEditingController controller,
  required String labelText,
  bool obscureText = false,
}) {
  return Container(
    padding: EdgeInsets.only(left: Dimens.space8, right: Dimens.space8),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(Dimens.space8),
    ),
    child: SizedBox(
      height: Dimens.space54,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          labelText: labelText,
        ),
      ),
    ),
  );
}
