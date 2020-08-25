import 'dart:io';

import 'package:flutter/material.dart';

class ImageFileAtm extends StatelessWidget {
  final File file;
  final double height;
  final double width;
  final BoxFit fit;

  const ImageFileAtm({
    Key key,
    @required this.file,
    this.height = 100,
    this.width = 100,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.file(
      file,
      height: height,
      width: width,
      fit: fit,
      alignment: Alignment.centerRight,
    );
  }
}
