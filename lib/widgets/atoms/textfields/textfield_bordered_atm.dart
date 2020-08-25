import 'package:flutter/material.dart';

import '../../../lib.dart';

class TextFieldBorderedAtm extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;
  final Function(String) onChanged;
  final TextInputType keyboardType;
  final String hintText;
  final Color backgroundColor;
  final Color borderColor;
  final int maxLines;
  final EdgeInsets padding;
  final TextStyle hintTextStyle;
  final double radius;
  final bool disable;

  const TextFieldBorderedAtm({
    Key key,
    this.controller,
    this.onSubmitted,
    this.keyboardType,
    this.onChanged,
    this.hintText,
    this.backgroundColor = colorWhite,
    this.borderColor = colorGrey,
    this.maxLines = 1,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.hintTextStyle = const TextStyle(
        color: colorBlack, fontWeight: FontWeight.w600, fontSize: 14),
    this.radius = 8,
    this.disable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: borderColor, width: 1)),
      child: TextField(
        readOnly: disable,
        maxLines: maxLines,
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          hintStyle: hintTextStyle,
          border: InputBorder.none,
        ),
        style: TextStyle(fontSize: 14, color: colorBlack),
        controller: controller,
        onSubmitted: onSubmitted,
        keyboardType: keyboardType,
        onChanged: onChanged,
      ),
    );
  }
}
