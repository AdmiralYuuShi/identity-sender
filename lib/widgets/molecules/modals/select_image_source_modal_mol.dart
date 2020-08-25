import 'package:flutter/material.dart';
import '../../../lib.dart';
import '../../widgets.dart';

class SelectImageSourceModalMol {
  static Future<void> openModal(
      {@required BuildContext context,
      @required Function onGallerySelected,
      @required Function onCameraSelected}) async {
    await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            children: <Widget>[
              Text20Atm(
                text: 'Select Image Source',
                textAlign: TextAlign.center,
              ),
              AppDimens.verticalSpace20,
              ButtonPrimaryAtm(
                width: 80,
                text: 'Camera',
                fontSize: 20,
                color: colorGreen,
                fontWeight: FontWeight.w600,
                onPressed: () {
                  Navigator.pop(context);
                  onCameraSelected();
                },
              ),
              AppDimens.verticalSpace10,
              ButtonPrimaryAtm(
                width: 80,
                text: 'Gallery',
                color: colorRedHeart,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                onPressed: () {
                  Navigator.pop(context);
                  onGallerySelected();
                },
              ),
              AppDimens.verticalSpace2,
              ButtonFlatAtm(
                width: 80,
                text: 'Later',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
