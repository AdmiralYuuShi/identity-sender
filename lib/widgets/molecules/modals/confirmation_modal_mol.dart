import 'package:flutter/material.dart';
import '../../../lib.dart';
import '../../widgets.dart';

class ConfirmationModalMol {
  static Future<void> openModal({BuildContext context, String text}) async {
    await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            children: <Widget>[
              Text20Atm(
                text: text,
                textAlign: TextAlign.center,
              ),
              AppDimens.verticalSpace20,
              ButtonPrimaryAtm(
                width: 80,
                text: 'OK',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
