// To parse this JSON data, do
//
//     final daftarKataModel = daftarKataModelFromJson(jsonString);

import 'dart:convert';

DaftarKataModel daftarKataModelFromJson(String str) =>
    DaftarKataModel.fromJson(json.decode(str));

String daftarKataModelToJson(DaftarKataModel data) =>
    json.encode(data.toJson());

class DaftarKataModel {
  DaftarKataModel({
    this.status,
    this.data,
    this.totalItems,
  });

  String status;
  List<Datum> data;
  String totalItems;

  factory DaftarKataModel.fromJson(Map<String, dynamic> json) =>
      DaftarKataModel(
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        totalItems:
            json["totalItems"] == null ? null : json["totalItems"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
        "totalItems": totalItems == null ? null : totalItems.toString(),
      };
}

class Datum {
  Datum({
    this.idKamus,
    this.kata,
    this.pelafalan,
    this.terjemahanKata,
  });

  String idKamus;
  String kata;
  String pelafalan;
  String terjemahanKata;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idKamus: json["id_kamus"] == null ? null : json["id_kamus"].toString(),
        kata: json["kata"] == null ? null : json["kata"],
        pelafalan: json["pelafalan"] == null ? null : json["pelafalan"],
        terjemahanKata:
            json["terjemahan_kata"] == null ? null : json["terjemahan_kata"],
      );

  Map<String, dynamic> toJson() => {
        "id_kamus": idKamus == null ? null : idKamus.toString(),
        "kata": kata == null ? null : kata,
        "pelafalan": pelafalan == null ? null : pelafalan,
        "terjemahan_kata": terjemahanKata == null ? null : terjemahanKata,
      };
}
