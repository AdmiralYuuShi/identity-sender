import 'package:flutter/material.dart';

import '../../../lib.dart';

class DropdownButtonAtm extends StatelessWidget {
  final Widget hint;
  final List<String> items;
  final List values;
  final List descItems;
  final ValueSetter onChanged;
  final dynamic selected;
  DropdownButtonAtm(
      {Key key,
      this.hint,
      @required this.items,
      this.onChanged,
      @required this.values,
      this.descItems,
      this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          border: Border.all(color: colorGrey),
          borderRadius: BorderRadius.circular(8)),
      child: DropdownButton(
        isExpanded: true,
        underline: Container(),
        hint: hint,
        value: selected,
        items: List.generate(
            items.length,
            (index) => DropdownMenuItem(
                value: values[index],
                child: descItems != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text16Atm(
                            text: items[index],
                            textStyle: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          Text12Atm(text: descItems[index]),
                        ],
                      )
                    : Text16Atm(text: items[index]))),
        onChanged: onChanged,
      ),
    );
  }
}
