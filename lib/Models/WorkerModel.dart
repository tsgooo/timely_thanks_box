// To parse this JSON data, do
//
//     final workerModel = workerModelFromJson(jsonString);

import 'dart:convert';

List<WorkerModel> workerModelFromJson(String str) => List<WorkerModel>.from(
    json.decode(str).map((x) => WorkerModel.fromJson(x)));

String workerModelToJson(List<WorkerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WorkerModel {
  WorkerModel({
    this.id,
    this.name,
    this.phone,
    this.lastname,
    this.position,
    this.gender,
    this.birthday,
    this.registerDate,
    this.email,
    this.image,
  });

  String? id;
  String? name;
  String? phone;
  String? lastname;
  String? position;
  String? gender;
  String? birthday;
  String? registerDate;
  String? email;
  String? image;

  factory WorkerModel.fromJson(Map<String, dynamic> json) => WorkerModel(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        lastname: json["lastname"],
        position: json["position"],
        gender: json["gender"],
        birthday: json["birthday"],
        registerDate: json["register_date"],
        email: json["email"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "lastname": lastname,
        "position": position,
        "gender": gender,
        "birthday": birthday,
        "register_date": registerDate,
        "email": email,
        "image": image,
      };
}
