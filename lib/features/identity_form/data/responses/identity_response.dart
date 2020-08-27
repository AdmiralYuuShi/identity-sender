import 'dart:convert';

IdentityResponse identityResponseFromJson(String str) =>
    IdentityResponse.fromJson(json.decode(str));

String identityResponseToJson(IdentityResponse data) =>
    json.encode(data.toJson());

class IdentityResponse {
  IdentityResponse({
    this.type,
    this.imageUrl,
    this.description,
    this.dateUpload,
    this.userId,
  });

  String type;
  String imageUrl;
  String description;
  int dateUpload;
  String userId;

  factory IdentityResponse.fromJson(Map<String, dynamic> json) =>
      IdentityResponse(
        type: json["type"],
        imageUrl: json["image_url"],
        description: json["description"],
        dateUpload: json["date_upload"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "image_url": imageUrl,
        "description": description,
        "date_upload": dateUpload,
        "user_id": userId,
      };
}
