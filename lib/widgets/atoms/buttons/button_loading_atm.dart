import 'package:flutter/material.dart';

class ButtonLoadingAtm extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Color color;

  ButtonLoadingAtm({
    Key key,
    this.color,
    this.width = double.infinity,
    this.height = 47,
    this.radius = 8,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color ?? Theme.of(context).primaryColor),
      child: CircularProgressIndicator(),
    );
  }
}
