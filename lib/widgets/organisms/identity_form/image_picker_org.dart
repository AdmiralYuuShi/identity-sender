import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../lib.dart';

class ImagePickerOrg extends StatefulWidget {
  final ValueSetter<File> onImageSelected;
  ImagePickerOrg({Key key, this.onImageSelected}) : super(key: key);
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
            SelectImageSourceModalMol.openModal(
              context: context,
              onCameraSelected: () {
                watermarkImagePicker(source: ImageSource.camera, text: 'Sample')
                    .then((value) {
                  setState(() {
                    image = value;
                  });
                });
              },
              onGallerySelected: () {
                watermarkImagePicker(
                        source: ImageSource.gallery, text: 'Sample')
                    .then((value) {
                  setState(() {
                    image = value;
                  });
                });
              },
            );
          },
        ));
  }
}
