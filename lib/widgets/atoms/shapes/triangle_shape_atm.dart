import 'package:flutter/material.dart';

import '../../../lib.dart';

enum TriangleType { upRightTriangle, upRightTriangleReverse }

class TriangleShapeAtm extends StatelessWidget {
  final Size size;
  final Color color;
  final TriangleType type;
  TriangleShapeAtm(
      {Key key,
      this.size = const Size(9, 14),
      this.color = colorBlack,
      this.type = TriangleType.upRightTriangle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        size: size, painter: DrawTriangleShape(color: color, type: type));
  }
}

class DrawTriangleShape extends CustomPainter {
  Paint painter;
  final Color color;
  final TriangleType type;

  DrawTriangleShape({this.color, this.type}) {
    painter = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    switch (type) {
      case (TriangleType.upRightTriangle):
        path.moveTo(0, 0);
        path.lineTo(size.width, 0);
        path.lineTo(0, size.height);
        path.close();
        break;
      case (TriangleType.upRightTriangleReverse):
        path.moveTo(0, 0);
        path.lineTo(size.width, 0);
        path.lineTo(size.width, size.height);
        path.close();
        break;
      default:
        path.moveTo(0, 0);
        path.lineTo(size.width, 0);
        path.lineTo(0, size.height);
        path.close();
    }

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
