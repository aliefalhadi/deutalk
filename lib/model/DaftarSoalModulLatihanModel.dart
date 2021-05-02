// To parse this JSON data, do
//
//     final daftarSoalModulLatihanModel = daftarSoalModulLatihanModelFromJson(jsonString);

import 'dart:convert';

DaftarSoalModulLatihanModel daftarSoalModulLatihanModelFromJson(String str) =>
    DaftarSoalModulLatihanModel.fromJson(json.decode(str));

String daftarSoalModulLatihanModelToJson(DaftarSoalModulLatihanModel data) =>
    json.encode(data.toJson());

class DaftarSoalModulLatihanModel {
  DaftarSoalModulLatihanModel({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory DaftarSoalModulLatihanModel.fromJson(Map<String, dynamic> json) =>
      DaftarSoalModulLatihanModel(
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
    this.idModulLatihanSoal,
    this.idModulLatihan,
    this.nomorSoal,
    this.textJerman,
    this.textPelafalan,
    this.textTerjemahan,
    this.textJepangAlternatif,
  });

  int idModulLatihanSoal;
  int idModulLatihan;
  int nomorSoal;
  String textJerman;
  String textPelafalan;
  String textTerjemahan;
  String textJepangAlternatif;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idModulLatihanSoal: json["id_modul_latihan_soal"] == null
            ? null
            : json["id_modul_latihan_soal"],
        idModulLatihan:
            json["id_modul_latihan"] == null ? null : json["id_modul_latihan"],
        nomorSoal: json["nomor_soal"] == null ? null : json["nomor_soal"],
        textJerman: json["text_jerman"] == null ? null : json["text_jerman"],
        textPelafalan:
            json["text_pelafalan"] == null ? null : json["text_pelafalan"],
        textTerjemahan:
            json["text_terjemahan"] == null ? null : json["text_terjemahan"],
        textJepangAlternatif: json["text_jepang_alternatif"] == null
            ? null
            : json["text_jepang_alternatif"],
      );

  Map<String, dynamic> toJson() => {
        "id_modul_latihan_soal":
            idModulLatihanSoal == null ? null : idModulLatihanSoal,
        "id_modul_latihan": idModulLatihan == null ? null : idModulLatihan,
        "nomor_soal": nomorSoal == null ? null : nomorSoal,
        "text_jerman": textJerman == null ? null : textJerman,
        "text_pelafalan": textPelafalan == null ? null : textPelafalan,
        "text_terjemahan": textTerjemahan == null ? null : textTerjemahan,
        "text_jepang_alternatif":
            textJepangAlternatif == null ? null : textJepangAlternatif,
      };
}
