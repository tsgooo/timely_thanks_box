// To parse this JSON data, do
//
//     final sentTbModel = sentTbModelFromJson(jsonString);

import 'dart:convert';

SentTbModel sentTbModelFromJson(String str) =>
    SentTbModel.fromJson(json.decode(str));

String sentTbModelToJson(SentTbModel data) => json.encode(data.toJson());

class SentTbModel {
  SentTbModel({
    this.success,
    this.message,
    this.mySentList,
  });

  String? success;
  String? message;
  List<SendingModel>? mySentList;

  factory SentTbModel.fromJson(Map<String, dynamic> json) => SentTbModel(
        success: json["success"],
        message: json["message"],
        mySentList: json["data"] == null
            ? []
            : List<SendingModel>.from(
                json["data"]!.map((x) => SendingModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": mySentList == null
            ? []
            : List<dynamic>.from(mySentList!.map((x) => x.toJson())),
      };
}

class SendingModel {
  SendingModel({
    this.id,
    this.to,
    this.date,
    this.description,
    this.templateId,
    this.template,
  });

  String? id;
  String? to;
  DateTime? date;
  String? description;
  String? templateId;
  String? template;

  factory SendingModel.fromJson(Map<String, dynamic> json) => SendingModel(
        id: json["id"],
        to: json["to"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        description: json["description"],
        templateId: json["template_id"],
        template: json["template"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "to": to,
        "date": date?.toIso8601String(),
        "description": description,
        "template_id": templateId,
        "template": template,
      };
}
