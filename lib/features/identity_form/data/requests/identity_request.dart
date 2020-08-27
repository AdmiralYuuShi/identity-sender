import 'dart:io';

class IdentityRequest {
  File image;
  String userId;
  String type;
  String description;
  DateTime dateUpload;
  IdentityRequest(
      {this.image, this.dateUpload, this.description, this.type, this.userId});
}
