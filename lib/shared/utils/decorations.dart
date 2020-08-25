import 'package:flutter/material.dart';

import '../../lib.dart';

BoxDecoration radiusAllDecoration(double radius) {
  return BoxDecoration(borderRadius: BorderRadius.circular(radius));
}

BoxDecoration radiusTopDecoration(double radius) {
  return BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius), topRight: Radius.circular(radius)));
}

BoxDecoration radiusBottomDecoration(double radius) {
  return BoxDecoration(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(radius),
          bottomRight: Radius.circular(radius)));
}

BoxDecoration borderRadiusAllDecoration(
    {double radius = 8, Color color = colorGrey, double width = 1}) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: color, width: width));
}
