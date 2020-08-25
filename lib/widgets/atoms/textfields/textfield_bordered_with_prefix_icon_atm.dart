import 'package:flutter/material.dart';

import '../../../lib.dart';

class TextFieldBorderedWithPrefixIconAtm extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;
  final Function(String) onChanged;
  final TextInputType keyboardType;
  final String hintText;
  final Color backgroundColor;
  final Color borderColor;
  final IconData prefixIcon;
  final Color prefixIconColor;

  const TextFieldBorderedWithPrefixIconAtm(
      {Key key,
      this.controller,
      this.onSubmitted,
      this.keyboardType,
      this.onChanged,
      this.hintText,
      this.backgroundColor = colorWhite,
      this.borderColor = colorGrey,
      this.prefixIcon,
      this.prefixIconColor = colorBlack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor, width: 1)),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4))),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Icon(
              prefixIcon,
              size: 28,
              color: prefixIconColor,
            ),
          ),
          Container(color: borderColor, width: 1, height: 36),
          Expanded(
            child: Container(
              child: TextField(
                decoration: InputDecoration(
                  isDense: true,
                  hintText: hintText,
                  hintStyle: TextStyle(
                      color: colorBlack.withOpacity(0.2),
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 14, color: colorBlack),
                controller: controller,
                onSubmitted: onSubmitted,
                keyboardType: keyboardType,
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
