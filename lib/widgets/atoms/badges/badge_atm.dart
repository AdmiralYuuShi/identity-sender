import 'package:flutter/material.dart';

import '../../../lib.dart';

class BadgeAtm extends StatelessWidget {
  final Color color;
  final Widget content;
  final double width;
  final double height;
  final double radius;
  BadgeAtm(
      {Key key,
      this.color,
      this.content,
      this.height,
      this.width,
      this.radius = 8.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: radiusAllDecoration(radius)
            .copyWith(color: color ?? Theme.of(context).primaryColor),
        child: content);
  }
}
