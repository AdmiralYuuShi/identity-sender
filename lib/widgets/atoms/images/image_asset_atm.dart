import 'package:flutter/material.dart';

class ImageAssetAtm extends StatelessWidget {
  final String name;
  final double height;
  final double width;
  final BoxFit fit;

  const ImageAssetAtm({Key key, this.name, this.height, this.width, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      name,
      height: height,
      width: width,
      fit: fit,
      alignment: Alignment.centerRight,
    );
  }
}
