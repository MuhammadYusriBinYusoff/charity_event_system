import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? initValue;
  final String? helpText;
  final bool obscureText;
  final bool multiLine;
  final bool compulsory;
  final bool readOnly;
  final bool isDigitOnly; // Add this line
  final ValueChanged<String>? onChanged;
  final int maxWords;

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
    this.readOnly = false,
    this.isDigitOnly = false, // Add this line
    this.onChanged,
    this.maxWords = 1000,
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
  void dispose() {
    if (widget.controller == null) {
      _textEditingController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = widget.compulsory && !_isFilled ? Colors.red : Colors.grey;
    final backgroundColor = widget.readOnly ? Colors.grey[200] : Colors.white;

    List<TextInputFormatter> inputFormatters = [
      LengthLimitingTextInputFormatter(widget.maxWords),
    ];

    if (widget.isDigitOnly) {
      inputFormatters.add(FilteringTextInputFormatter.digitsOnly);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(8),
            color: backgroundColor,
          ),
          child: SizedBox(
            height: widget.multiLine ? null : 54,
            child: TextField(
              controller: _textEditingController,
              obscureText: widget.obscureText,
              maxLines: widget.multiLine ? null : 1,
              readOnly: widget.readOnly,
              inputFormatters: inputFormatters,
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







