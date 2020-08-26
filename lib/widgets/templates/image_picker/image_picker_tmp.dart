import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../lib.dart';

class ImagePickerTmp extends StatefulWidget {
  @override
  _ImagePickerTmpState createState() => _ImagePickerTmpState();
}

class _ImagePickerTmpState extends State<ImagePickerTmp> {
  File image;

  Future<void> pickImage({ImageSource source, String text}) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarDefault(
          title: 'Select Image',
          withoutBack: true,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppDimens.verticalSpace20,
              image != null
                  ? ImageFileAtm(
                      file: image,
                      width: 323,
                      height: 204,
                      fit: BoxFit.fill,
                    )
                  : Container(
                      width: 323,
                      height: 204,
                      alignment: Alignment.center,
                      decoration: borderRadiusAllDecoration(),
                      child: Icon(Icons.image),
                    ),
              AppDimens.verticalSpace20,
              ButtonPrimaryAtm(
                  onPressed: () {
                    SelectImageSourceModalMol.openModal(
                      context: context,
                      onCameraSelected: () {
                        pickImage(source: ImageSource.camera);
                      },
                      onGallerySelected: () {
                        pickImage(source: ImageSource.gallery);
                      },
                    );
                    // print(image);
                  },
                  width: 200,
                  text: 'Select Image'),
            ],
          ),
        ));
  }
}
