// To parse this JSON data, do
//
//     final daftarModulModel = daftarModulModelFromJson(jsonString);

import 'dart:convert';

DaftarModulModel daftarModulModelFromJson(String str) =>
    DaftarModulModel.fromJson(json.decode(str));

String daftarModulModelToJson(DaftarModulModel data) =>
    json.encode(data.toJson());

class DaftarModulModel {
  DaftarModulModel({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory DaftarModulModel.fromJson(Map<String, dynamic> json) =>
      DaftarModulModel(
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.idModul,
    this.namaModul,
  });

  String idModul;
  String namaModul;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idModul: json["id_modul"] == null ? null : json["id_modul"].toString(),
        namaModul: json["nama_modul"] == null ? null : json["nama_modul"],
      );

  Map<String, dynamic> toJson() => {
        "id_modul": idModul == null ? null : idModul.toString(),
        "nama_modul": namaModul == null ? null : namaModul,
      };
}
