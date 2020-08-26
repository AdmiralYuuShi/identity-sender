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
  });

  String type;
  String imageUrl;
  String description;
  String dateUpload;

  factory IdentityResponse.fromJson(Map<String, dynamic> json) =>
      IdentityResponse(
        type: json["type"],
        imageUrl: json["image_url"],
        description: json["description"],
        dateUpload: json["date_upload"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "image_url": imageUrl,
        "description": description,
        "date_upload": dateUpload,
      };
}
