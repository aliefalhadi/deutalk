// To parse this JSON data, do
//
//     final daftarModulBelajarModel = daftarModulBelajarModelFromJson(jsonString);

import 'dart:convert';

DaftarModulBelajarModel daftarModulBelajarModelFromJson(String str) =>
    DaftarModulBelajarModel.fromJson(json.decode(str));

String daftarModulBelajarModelToJson(DaftarModulBelajarModel data) =>
    json.encode(data.toJson());

class DaftarModulBelajarModel {
  DaftarModulBelajarModel({
    this.status,
    this.data,
  });

  String status;
  List<DatumBelajar> data;

  factory DaftarModulBelajarModel.fromJson(Map<String, dynamic> json) =>
      DaftarModulBelajarModel(
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null
            ? null
            : List<DatumBelajar>.from(
                json["data"].map((x) => DatumBelajar.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DatumBelajar {
  DatumBelajar({
    this.idModulBelajar,
    this.idModul,
    this.nomorBelajar,
    this.textJerman,
    this.textPelafalan,
    this.terjemahanText,
    this.hintText,
    this.speechText,
    this.polaBelajar,
  });

  int idModulBelajar;
  int idModul;
  int nomorBelajar;
  String textJerman;
  String textPelafalan;
  String terjemahanText;
  String hintText;
  String speechText;
  String polaBelajar;

  factory DatumBelajar.fromJson(Map<String, dynamic> json) => DatumBelajar(
        idModulBelajar:
            json["id_modul_belajar"] == null ? null : json["id_modul_belajar"],
        idModul: json["id_modul"] == null ? null : json["id_modul"],
        nomorBelajar:
            json["nomor_belajar"] == null ? null : json["nomor_belajar"],
        textJerman: json["text_jerman"] == null ? null : json["text_jerman"],
        textPelafalan:
            json["text_pelafalan"] == null ? null : json["text_pelafalan"],
        terjemahanText:
            json["terjemahan_text"] == null ? null : json["terjemahan_text"],
        hintText: json["hint_text"] == null ? null : json["hint_text"],
        speechText: json["speech_text"] == null ? null : json["speech_text"],
        polaBelajar: json["pola_belajar"] == null ? null : json["pola_belajar"],
      );

  Map<String, dynamic> toJson() => {
        "id_modul_belajar": idModulBelajar == null ? null : idModulBelajar,
        "id_modul": idModul == null ? null : idModul,
        "nomor_belajar": nomorBelajar == null ? null : nomorBelajar,
        "text_jerman": textJerman == null ? null : textJerman,
        "text_pelafalan": textPelafalan == null ? null : textPelafalan,
        "terjemahan_text": terjemahanText == null ? null : terjemahanText,
        "hint_text": hintText == null ? null : hintText,
        "speech_text": speechText == null ? null : speechText,
        "pola_belajar": polaBelajar == null ? null : polaBelajar,
      };
}
