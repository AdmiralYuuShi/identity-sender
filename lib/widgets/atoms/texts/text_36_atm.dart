import 'package:flutter/material.dart';

import '../../../lib.dart';

class Text36Atm extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final int maxLines;
  final bool isSoftWrap;
  final TextAlign textAlign;
  final TextOverflow textOverflow;
  final TextDirection textDirection;

  const Text36Atm(
      {Key key,
      this.text,
      this.textStyle,
      this.maxLines,
      this.isSoftWrap,
      this.textAlign,
      this.textOverflow,
      this.textDirection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle?.copyWith(fontSize: 36.0) ??
          TextStyle(
              fontSize: 36, color: colorBlack, fontWeight: FontWeight.normal),
      maxLines: maxLines,
      softWrap: isSoftWrap,
      textAlign: textAlign,
      overflow: textOverflow,
      key: key,
      textDirection: textDirection,
    );
  }
}
