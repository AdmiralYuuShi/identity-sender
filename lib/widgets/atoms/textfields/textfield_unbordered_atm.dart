import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../lib.dart';

class TextFieldUnborderedAtm extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;
  final Function(String) onChanged;
  final TextInputType keyboardType;
  final String hintText;
  final Color backgroundColor;

  const TextFieldUnborderedAtm(
      {Key key,
      this.controller,
      this.onSubmitted,
      this.keyboardType,
      this.onChanged,
      this.hintText,
      this.backgroundColor = colorWhite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          hintStyle: TextStyle(
              color: colorBlack.withOpacity(0.2),
              fontWeight: FontWeight.w600,
              fontSize: 14),
          border: InputBorder.none,
        ),
        controller: controller,
        onSubmitted: onSubmitted,
        keyboardType: keyboardType,
        onChanged: onChanged,
      ),
    );
  }
}
