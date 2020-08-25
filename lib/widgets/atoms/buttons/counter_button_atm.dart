import 'package:flutter/material.dart';

import '../../../lib.dart';

class CounterButtonAtm extends StatelessWidget {
  final int qty;
  final ValueSetter<int> onAdd;
  final ValueSetter<int> onRemove;
  final MainAxisAlignment alignment;
  final double fontSize;
  final double iconSize;
  CounterButtonAtm(
      {Key key,
      this.qty = 1,
      this.onAdd,
      this.onRemove,
      this.iconSize = 24,
      this.alignment = MainAxisAlignment.spaceAround,
      this.fontSize = 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: alignment,
      children: <Widget>[
        InkWell(
            onTap: () {
              if (qty > 1) onRemove(qty - 1);
            },
            child: Icon(
              Icons.remove_circle_outline,
              color: colorGrey,
              size: iconSize,
            )),
        Text(
          '$qty',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
        ),
        InkWell(
          onTap: () {
            onAdd(qty + 1);
          },
          child: Icon(
            Icons.add_circle_outline,
            color: Theme.of(context).primaryColor,
            size: iconSize,
          ),
        ),
      ],
    ));
  }
}
