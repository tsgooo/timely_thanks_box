// To parse this JSON data, do
//
//     final receivedTbModel = receivedTbModelFromJson(jsonString);

import 'dart:convert';

ReceivedTbModel receivedTbModelFromJson(String str) =>
    ReceivedTbModel.fromJson(json.decode(str));

String receivedTbModelToJson(ReceivedTbModel data) =>
    json.encode(data.toJson());

class ReceivedTbModel {
  ReceivedTbModel({
    this.success,
    this.message,
    this.data,
  });

  String? success;
  String? message;
  List<ReceivedModel>? data;

  factory ReceivedTbModel.fromJson(Map<String, dynamic> json) =>
      ReceivedTbModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<ReceivedModel>.from(
                json["data"]!.map((x) => ReceivedModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ReceivedModel {
  ReceivedModel({
    this.id,
    this.fromUserId,
    this.from,
    this.date,
    this.description,
    this.templateId,
    this.template,
  });

  String? id;
  String? fromUserId;
  String? from;
  DateTime? date;
  String? description;
  String? templateId;
  String? template;

  factory ReceivedModel.fromJson(Map<String, dynamic> json) => ReceivedModel(
        id: json["id"],
        fromUserId: json["from_user_id"],
        from: json["from"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        description: json["description"],
        templateId: json["template_id"],
        template: json["template"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "from_user_id": fromUserId,
        "from": from,
        "date": date?.toIso8601String(),
        "description": description,
        "template_id": templateId,
        "template": template,
      };
}
