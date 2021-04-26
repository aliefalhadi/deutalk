import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:deutalk/model/DaftarKataModel.dart';
import 'package:deutalk/services/Service.dart';

class KamusService extends Service {
  Future getKataKamus(String page) async {
    try {
      var url = "/dictionaries/daftar-kamus" + "?page=" + page;
      print(url);
      var response = await get(url);
      print('errroorrrrrr');
      print(response.statusCode);
      if (response.statusCode == 200) {
        DaftarKataModel daftarKataModel =
            daftarKataModelFromJson(jsonEncode(response.data));
        if (daftarKataModel.data.isEmpty) {
          throw ('data tidak ditemukan');
        }
        return daftarKataModel;
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

  Future getCariKata(String kata) async {
    try {
      var url = "/dictionaries/cari-kata-kamus";
      print(url);
      var response = await post(url, kata);
      print(response.statusCode);
      if (response.statusCode == 200) {
        DaftarKataModel daftarKataModel =
            daftarKataModelFromJson(jsonEncode(response.data));
        print(daftarKataModel);
        if (daftarKataModel.data.isEmpty) {
          throw ('data tidak ditemukan');
        }
        return daftarKataModel;
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
