import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../lib.dart';
import '../../widgets.dart';

class ImageNetworkAtm extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  final BorderRadius borderRadius;

  const ImageNetworkAtm(
      {Key key,
      @required this.imageUrl,
      this.width,
      this.height,
      this.fit = BoxFit.cover,
      this.borderRadius = BorderRadius.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: kIsWeb
          ? Image.network(imageUrl, height: height, width: width, fit: fit)
          : CachedNetworkImage(
              imageUrl: imageUrl,
              width: width,
              height: height,
              fit: fit,
              placeholder: (context, url) => Container(
                width: width,
                height: height,
                color: colorGrey,
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    border: Border.all(color: colorGrey),
                    borderRadius: borderRadius,
                    color: colorWhite),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.error),
                    Text12Atm(
                      text: 'Can\'t load image',
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
