import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../widgets.dart';

class ButtonPrimaryCenterIconTextAtm extends StatelessWidget {
  final Function onPressed;
  final String text;
  final double width;
  final double height;
  final double radius;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final Color textColor;
  final String imageAsset;

  const ButtonPrimaryCenterIconTextAtm({
    Key key,
    @required this.onPressed,
    @required this.text,
    this.width = double.infinity,
    this.height = 47,
    this.radius = 8,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w600,
    this.color,
    this.textColor,
    @required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: RaisedButton(
        color: color ?? Theme.of(context).accentColor,
        textColor: textColor ?? Theme.of(context).primaryColor,
        onPressed: onPressed,
        disabledTextColor: colorGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ImageAssetAtm(
              name: imageAsset,
            ),
            AppDimens.horizontalSpace10,
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
