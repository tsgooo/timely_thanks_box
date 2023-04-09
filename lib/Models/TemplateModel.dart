// To parse this JSON data, do
//
//     final templateModel = templateModelFromJson(jsonString);

import 'dart:convert';

TemplateModel templateModelFromJson(String str) =>
    TemplateModel.fromJson(json.decode(str));

String templateModelToJson(TemplateModel data) => json.encode(data.toJson());

class TemplateModel {
  TemplateModel({
    this.success,
    this.message,
    this.data,
  });

  String? success;
  String? message;
  List<TemplateData>? data;

  factory TemplateModel.fromJson(Map<String, dynamic> json) => TemplateModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<TemplateData>.from(
                json["data"]!.map((x) => TemplateData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class TemplateData {
  TemplateData({
    this.id,
    this.picture,
  });

  String? id;
  String? picture;

  factory TemplateData.fromJson(Map<String, dynamic> json) => TemplateData(
        id: json["id"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "picture": picture,
      };
}
