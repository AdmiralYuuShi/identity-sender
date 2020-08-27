import 'package:flutter/material.dart';

import '../../../lib.dart';

class NoImagePlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 180,
      decoration: borderRadiusAllDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image,
            size: 30,
          ),
          AppDimens.verticalSpace10,
          Text18Atm(
            text: 'Tap to Add Your Identity Photo',
          )
        ],
      ),
    );
  }
}
