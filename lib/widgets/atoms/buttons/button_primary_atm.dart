import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

class ButtonPrimaryAtm extends StatelessWidget {
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

  const ButtonPrimaryAtm({
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: RaisedButton(
        elevation: elevation,
        color: color ?? Theme.of(context).primaryColor,
        textColor: textColor ?? Theme.of(context).accentColor,
        onPressed: onPressed,
        disabledColor: colorBlack.withOpacity(0.2),
        disabledTextColor: colorWhite,
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
