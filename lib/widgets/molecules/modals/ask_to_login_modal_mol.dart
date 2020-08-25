import 'package:flutter/material.dart';
import '../../../lib.dart';
import '../../widgets.dart';

class AskToLoginModalMol {
  static Future<void> openModal(BuildContext context) async {
    switch (await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            children: <Widget>[
              Text20Atm(
                text: 'You Must Login to Access This Feature',
                textAlign: TextAlign.center,
              ),
              AppDimens.verticalSpace20,
              ButtonPrimaryAtm(
                width: 80,
                text: 'Login',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
              AppDimens.verticalSpace2,
              ButtonFlatAtm(
                width: 80,
                text: 'Later',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
            ],
          );
        })) {
      case true:
        debugPrint('Login');
        break;
      case false:
        debugPrint('Cancel Login');
        break;
    }
  }
}
