import 'package:flutter/material.dart';

import '../../../lib.dart';

class ButtonIconAtm extends StatelessWidget {
  final Function onPressed;
  final String text;
  final double width;
  final double height;
  final double radius;
  final double fontSize;
  final FontWeight fontWeight;
  final double elevation;
  final Color color;
  final Color textColor;
  final IconData prefixIcon;
  final String prefixAssetImage;
  final IconData suffixIcon;
  final String suffixAssetImage;
  final Color borderColor;

  const ButtonIconAtm({
    Key key,
    @required this.onPressed,
    @required this.text,
    this.width = double.infinity,
    this.height = 47,
    this.radius = 8,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w600,
    this.elevation,
    this.color,
    this.textColor,
    this.prefixIcon,
    this.prefixAssetImage,
    this.suffixIcon,
    this.suffixAssetImage,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: OutlineButton(
        color: color ?? Theme.of(context).primaryColor,
        textColor: textColor ?? Theme.of(context).primaryColor,
        onPressed: onPressed,
        borderSide:
            BorderSide(color: borderColor ?? Theme.of(context).primaryColor),
        disabledTextColor: colorGrey,
        disabledBorderColor: colorGrey,
        highlightedBorderColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (prefixIcon != null) Icon(prefixIcon),
            if (prefixAssetImage != null)
              ImageAssetAtm(
                name: prefixAssetImage,
              ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              width: MediaQuery.of(context).size.width - 140,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),
            ),
            if (suffixAssetImage != null)
              ImageAssetAtm(
                name: suffixAssetImage,
              ),
            if (suffixIcon != null) Icon(suffixIcon),
          ],
        ),
      ),
    );
  }
}
