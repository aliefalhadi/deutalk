// To parse this JSON data, do
//
//     final dataProgresUserModel = dataProgresUserModelFromJson(jsonString);

import 'dart:convert';

DataProgresUserModel dataProgresUserModelFromJson(String str) =>
    DataProgresUserModel.fromJson(json.decode(str));

String dataProgresUserModelToJson(DataProgresUserModel data) =>
    json.encode(data.toJson());

class DataProgresUserModel {
  DataProgresUserModel({
    this.status,
    this.data,
  });

  String status;
  Data data;

  factory DataProgresUserModel.fromJson(Map<String, dynamic> json) =>
      DataProgresUserModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.idLatihanUser,
    this.email,
    this.progres,
  });

  int idLatihanUser;
  String email;
  String progres;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        idLatihanUser: json["id_latihan_user"],
        email: json["email"],
        progres: json["progres"],
      );

  Map<String, dynamic> toJson() => {
        "id_latihan_user": idLatihanUser,
        "email": email,
        "progres": progres,
      };
}
