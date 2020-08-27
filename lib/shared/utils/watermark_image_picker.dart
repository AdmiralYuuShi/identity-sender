import 'dart:io';
import 'package:meta/meta.dart';

import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

final picker = ImagePicker();

Future<File> watermarkImagePicker(
    {@required String text, @required ImageSource source}) async {
  PickedFile pickedImage = await picker.getImage(source: source);
  if (pickedImage == null) return null;

  File image = File(pickedImage.path);

  img.Image decodeImg = img.decodeImage(image.readAsBytesSync());

  img.Image resizeImg = img.copyResize(decodeImg, width: 960, height: 720);
  img.drawString(
      resizeImg, img.arial_48, 10, resizeImg.height - 60, 'ID : $text');

  List<int> encodeImage = img.encodeJpg(resizeImg, quality: 100);

  File finalImage = File(pickedImage.path)..writeAsBytesSync(encodeImage);

  return finalImage;
}
