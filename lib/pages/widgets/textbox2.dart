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
  final bool compulsory; // New property to indicate if filling is compulsory

  const CustomTextField({
    Key? key,
    this.controller,
    this.labelText,
    this.hintText,
    this.initValue,
    this.helpText,
    this.obscureText = false,
    this.multiLine = false,
    this.compulsory = false, // Default value is false
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _textEditingController;
  bool _isFilled = false; // Track if the field is filled

  @override
  void initState() {
    super.initState();
    _textEditingController = widget.controller ?? TextEditingController();
    if (widget.initValue != null) {
      _textEditingController.text = widget.initValue!;
      _isFilled = true; // Set to true if initial value is provided
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = widget.compulsory && !_isFilled ? Colors.red : Colors.grey;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: Dimens.space8, right: Dimens.space8),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor), // Set border color based on filling requirement
            borderRadius: BorderRadius.circular(8),
          ),
          child: SizedBox(
            height: widget.multiLine ? null : Dimens.space54,
            child: TextField(
              controller: _textEditingController,
              obscureText: widget.obscureText,
              maxLines: widget.multiLine ? null : 1,
              onChanged: (value) {
                setState(() {
                  _isFilled = value.isNotEmpty;
                });
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                labelText: widget.labelText,
                hintText: widget.hintText,
                helperText: widget.helpText,
              ),
            ),
          ),
        ),
        if (widget.compulsory && !_isFilled)
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Text(
              'Required',
              style: TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }
}




