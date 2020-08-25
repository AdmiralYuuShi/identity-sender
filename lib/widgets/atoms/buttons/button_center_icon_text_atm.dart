import 'package:flutter/material.dart';

import '../../../lib.dart';

class ButtonCenterIconTextAtm extends StatelessWidget {
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
  final String imageAsset;
  final IconData icon;

  const ButtonCenterIconTextAtm({
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
    this.icon,
    this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: RaisedButton(
        color: color ?? Theme.of(context).primaryColor,
        textColor: textColor ?? Theme.of(context).primaryColor,
        onPressed: onPressed,
        disabledTextColor: colorGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (imageAsset != null)
              ImageAssetAtm(
                name: imageAsset,
              ),
            if (icon != null) Icon(icon),
            AppDimens.horizontalSpace8,
            Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
