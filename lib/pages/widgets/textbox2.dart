import 'package:charity_event_system/common/common.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? initValue;
  final String? helpText;
  final bool obscureText;
  final bool multiLine;

  const CustomTextField({
    Key? key,
    this.controller,
    this.labelText,
    this.hintText,
    this.initValue,
    this.helpText,
    this.obscureText = false,
    this.multiLine = false,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = widget.controller ?? TextEditingController();
    if (widget.initValue != null) {
      _textEditingController.text = widget.initValue!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: Dimens.space8, right: Dimens.space8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        height: widget.multiLine ? null : Dimens.space54,
        child: TextField(
          controller: _textEditingController,
          obscureText: widget.obscureText,
          maxLines: widget.multiLine ? null : 1,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            labelText: widget.labelText,
            hintText: widget.hintText,
            helperText: widget.helpText,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}

