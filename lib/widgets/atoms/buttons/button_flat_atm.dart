import 'package:flutter/material.dart';

import '../../../lib.dart';

class ButtonFlatAtm extends StatelessWidget {
  final Function onPressed;
  final String text;
  final double width;
  final double height;
  final double radius;
  final double fontSize;
  final FontWeight fontWeight;
  final double elevation;
  final Color fontColor;
  final Color buttonColor;

  const ButtonFlatAtm({
    Key key,
    @required this.onPressed,
    @required this.text,
    this.width = double.infinity,
    this.height = 47,
    this.radius = 8,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w600,
    this.elevation,
    this.buttonColor,
    this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: FlatButton(
        color:
            buttonColor != null ? buttonColor : Theme.of(context).accentColor,
        textColor:
            fontColor != null ? fontColor : Theme.of(context).primaryColor,
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
