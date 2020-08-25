import 'package:flutter/material.dart';

import '../../../lib.dart';
import '../../widgets.dart';

class AppbarDefault extends PreferredSize {
  final double height;
  final String title;
  final String backText;
  final String actionText;
  final Function onActionTap;
  final bool underline;
  final Color color;
  final TextStyle backTextStyle;
  final Color backIconColor;
  final TextStyle titleTextStyle;
  final TextStyle actionTextStyle;
  final Function onBackTap;
  final bool withoutBack;

  AppbarDefault({
    this.height = kToolbarHeight,
    this.title = '',
    this.backText = 'Back',
    this.actionText,
    this.onActionTap,
    this.underline = true,
    this.backTextStyle,
    this.backIconColor,
    this.actionTextStyle,
    this.titleTextStyle = const TextStyle(fontWeight: FontWeight.bold),
    this.color = colorWhite,
    this.onBackTap,
    this.withoutBack = false,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            color: color,
            border: underline
                ? Border(bottom: BorderSide(color: colorGrey, width: 0.5))
                : Border(bottom: BorderSide.none)),
        height: preferredSize.height,
        alignment: Alignment.center,
        child: Stack(
          children: <Widget>[
            Center(
              child: Text24Atm(
                text: title,
                textStyle: titleTextStyle,
              ),
            ),
            Container(
              height: height,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  if (!withoutBack)
                    InkWell(
                      onTap: () {
                        onBackTap ?? Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 12,
                                color: backIconColor ??
                                    Theme.of(context).primaryColor,
                              ),
                            ),
                            AppDimens.horizontalSpace2,
                            Text18Atm(
                              text: backText ?? 'Back',
                              textStyle: backTextStyle ??
                                  TextStyle(
                                      color: Theme.of(context).primaryColor),
                            )
                          ],
                        ),
                      ),
                    ),
                  actionText != null
                      ? InkWell(
                          onTap: onActionTap,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Text18Atm(
                              text: actionText,
                              textStyle: actionTextStyle ??
                                  TextStyle(
                                      color: Theme.of(context).primaryColor),
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
