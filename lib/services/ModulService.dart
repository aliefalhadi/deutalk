import 'dart:convert';
import 'dart:developer';

import 'package:deutalk/model/DaftarModulBelajarModel.dart';
import 'package:dio/dio.dart';
import 'package:deutalk/model/DaftarKataModel.dart';
// import 'package:deutalk/models/DaftarModulBelajarModel.dart';
import 'package:deutalk/model/DaftarModulModel.dart';
import 'package:deutalk/services/Service.dart';

class ModulService extends Service {
  Future getDaftarModul() async {
    try {
      var url = "/moduls/daftar-modul";
      print(url);
      var response = await get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        DaftarModulModel daftarModulModel =
            daftarModulModelFromJson(jsonEncode(response.data));
        if (daftarModulModel.data.isEmpty) {
          throw ('data tidak ditemukan');
        }
        return daftarModulModel;
      } else {
        throw ('data tidak ditemukan');
      }
    } catch (error) {
      if (error is DioError) {
        print(error.response.statusCode);
        throw (error.response.statusCode);
      }
    }
  }

  Future getDaftarModulBelajar(String idModul) async {
    try {
      var url = "/moduls/daftar-modul-belajar/" + idModul;
      print(url);
      var response = await get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        DaftarModulBelajarModel daftarModulBelajarModel =
            daftarModulBelajarModelFromJson(jsonEncode(response.data));
        if (daftarModulBelajarModel.data.isEmpty ||
            daftarModulBelajarModel.data == null) {
          throw ('data tidak ditemukan');
        }
        return daftarModulBelajarModel;
      } else {
        throw ('data tidak ditemukan');
      }
    } catch (error) {
      if (error is DioError) {
        print(error.response.statusCode);
        throw (error.response.statusCode);
      }
    }
  }
}
