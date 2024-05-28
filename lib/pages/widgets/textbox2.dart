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
  final bool compulsory;
  final bool readOnly; // Add this line
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    Key? key,
    this.controller,
    this.labelText,
    this.hintText,
    this.initValue,
    this.helpText,
    this.obscureText = false,
    this.multiLine = false,
    this.compulsory = false,
    this.readOnly = false, // Add this line
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _textEditingController;
  bool _isFilled = false;

  @override
  void initState() {
    super.initState();
    _textEditingController = widget.controller ?? TextEditingController();
    if (widget.initValue != null) {
      _textEditingController.text = widget.initValue!;
      _isFilled = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = widget.compulsory && !_isFilled ? Colors.red : Colors.grey;
    final backgroundColor = widget.readOnly ? Colors.grey[200] : Colors.white; // Add this line

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: Dimens.space8, right: Dimens.space8),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(8),
            color: backgroundColor, // Add this line
          ),
          child: SizedBox(
            height: widget.multiLine ? null : Dimens.space54,
            child: TextField(
              controller: _textEditingController,
              obscureText: widget.obscureText,
              maxLines: widget.multiLine ? null : 1,
              readOnly: widget.readOnly, // Add this line
              onChanged: (value) {
                setState(() {
                  _isFilled = value.isNotEmpty;
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
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





