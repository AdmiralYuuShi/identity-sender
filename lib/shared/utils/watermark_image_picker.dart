import 'dart:io';
import 'dart:typed_data';
import 'package:meta/meta.dart';

import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as imageEditor;

final picker = ImagePicker();

Future<File> watermarkImagePicker(
    {@required String text, @required ImageSource source}) async {
  final pickedFile = await picker.getImage(source: source);
  File _image = File(pickedFile.path);

  imageEditor.Image watermarkImage =
      imageEditor.decodeImage(_image.readAsBytesSync());

  imageEditor.Image image = imageEditor.Image(160, 50);
  imageEditor.drawImage(image, watermarkImage);
  imageEditor.copyInto(watermarkImage, image,
      dstX: watermarkImage.width - 160 - 25,
      dstY: watermarkImage.height - 50 - 25);

  imageEditor.drawString(
    watermarkImage,
    imageEditor.arial_24,
    10,
    (watermarkImage.height / 2).floor(),
    text,
  );
  List<int> wmImage = imageEditor.encodePng(watermarkImage);
  print('Watermarked Done');
  return File.fromRawPath(Uint8List.fromList(wmImage));
}
