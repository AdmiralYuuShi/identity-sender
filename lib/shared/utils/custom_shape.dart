import 'package:flutter/material.dart';
import 'colors.dart';

class CustomShape {
  static Widget horizontalLine({
    Color color = colorGrey,
    double height = 1.0,
    double width,
    double radius = 0.0,
  }) {
    return Container(
      height: height,
      width: width != null ? width : null,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius)),
    );
  }

  static Widget verticalLine({
    Color color = colorGrey,
    double height = 10,
    double width = 0.5,
    double radius = 0.0,
    double border = 0.0,
    Color borderColor = colorGrey,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: borderColor, width: border)),
    );
  }

  static Widget dot({
    double size = 5,
    Color color = colorGrey,
  }) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
