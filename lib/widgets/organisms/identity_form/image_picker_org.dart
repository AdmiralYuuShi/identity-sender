import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../lib.dart';

class ImagePickerOrg extends StatefulWidget {
  final ValueSetter<File> onImageSelected;
  final AuthState authState;
  ImagePickerOrg({Key key, this.onImageSelected, this.authState})
      : super(key: key);
  @override
  _ImagePickerOrgState createState() => _ImagePickerOrgState();
}

class _ImagePickerOrgState extends State<ImagePickerOrg> {
  File image;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: InkWell(
          child: Container(
              child: image != null
                  ? ImageFileAtm(
                      file: image,
                      width: 300,
                      height: 180,
                      fit: BoxFit.fill,
                    )
                  : NoImagePlaceholder()),
          onTap: () {
            if (widget.authState is LogedIn) {
              String userId = (widget.authState as LogedIn).userId;
              SelectImageSourceModalMol.openModal(
                context: context,
                onCameraSelected: () {
                  watermarkImagePicker(source: ImageSource.camera, text: userId)
                      .then((value) {
                    setState(() {
                      image = value;
                    });
                    widget.onImageSelected(value);
                  });
                },
                onGallerySelected: () {
                  watermarkImagePicker(
                          source: ImageSource.gallery, text: userId)
                      .then((value) {
                    setState(() {
                      image = value;
                    });
                    widget.onImageSelected(value);
                  });
                },
              );
            } else {
              AskToLoginModalMol.openModal(context);
            }
          },
        ));
  }
}
