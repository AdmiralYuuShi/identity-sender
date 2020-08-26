import 'dart:io';

class IdentityRequest {
  File image;
  String type;
  String description;
  DateTime dateUpload;
  IdentityRequest({this.image, this.dateUpload, this.description, this.type});
}
