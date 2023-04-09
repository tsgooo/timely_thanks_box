// To parse this JSON data, do
//
//     final tbSendingModel = tbSendingModelFromJson(jsonString);

import 'dart:convert';

TbSendingModel tbSendingModelFromJson(String str) =>
    TbSendingModel.fromJson(json.decode(str));

String tbSendingModelToJson(TbSendingModel data) => json.encode(data.toJson());

class TbSendingModel {
  TbSendingModel({
    this.success,
    this.message,
  });

  String? success;
  String? message;

  factory TbSendingModel.fromJson(Map<String, dynamic> json) => TbSendingModel(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
