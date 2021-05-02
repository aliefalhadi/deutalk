// To parse this JSON data, do
//
//     final daftarModulLatihanModel = daftarModulLatihanModelFromJson(jsonString);

import 'dart:convert';

DaftarModulLatihanModel daftarModulLatihanModelFromJson(String str) =>
    DaftarModulLatihanModel.fromJson(json.decode(str));

String daftarModulLatihanModelToJson(DaftarModulLatihanModel data) =>
    json.encode(data.toJson());

class DaftarModulLatihanModel {
  DaftarModulLatihanModel({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory DaftarModulLatihanModel.fromJson(Map<String, dynamic> json) =>
      DaftarModulLatihanModel(
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
    this.model,
    this.jumlahSoal,
  });

  Model model;
  String jumlahSoal;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        model: json["model"] == null ? null : Model.fromJson(json["model"]),
        jumlahSoal: json["jumlah_soal"] == null ? null : json["jumlah_soal"],
      );

  Map<String, dynamic> toJson() => {
        "model": model == null ? null : model.toJson(),
        "jumlah_soal": jumlahSoal == null ? null : jumlahSoal,
      };
}

class Model {
  Model({
    this.idModulLatihan,
    this.levelLatihan,
    this.namaModulLatihan,
  });

  int idModulLatihan;
  int levelLatihan;
  String namaModulLatihan;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        idModulLatihan:
            json["id_modul_latihan"] == null ? null : json["id_modul_latihan"],
        levelLatihan:
            json["level_latihan"] == null ? null : json["level_latihan"],
        namaModulLatihan: json["nama_modul_latihan"] == null
            ? null
            : json["nama_modul_latihan"],
      );

  Map<String, dynamic> toJson() => {
        "id_modul_latihan": idModulLatihan == null ? null : idModulLatihan,
        "level_latihan": levelLatihan == null ? null : levelLatihan,
        "nama_modul_latihan":
            namaModulLatihan == null ? null : namaModulLatihan,
      };
}
