import 'package:deutalk/view/Home.dart';
import 'package:deutalk/view/Kamus/Index.dart';
import 'package:deutalk/view/Login.dart';
import 'package:deutalk/view/latihan/IndexLatihan.dart';
import 'package:deutalk/view/latihan/JawabSoalLatihan.dart';
import 'package:deutalk/view/latihan/SoalLatihan.dart';
import 'package:deutalk/view/modul/DetailModulBelajar.dart';
import 'package:deutalk/view/modul/IndexModul.dart';
import 'package:deutalk/view/modul/IndexModulBelajar.dart';
import 'package:flutter/material.dart';

class RouterApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(
            builder: (_) => Login()
        );

      case '/home':
        return MaterialPageRoute(builder: (_) => Home());

      case '/kamus':
        return MaterialPageRoute(builder: (_) => KamusIndex());

      case '/modul':
        return MaterialPageRoute(builder: (_) => ModulIndex());
      //
      case '/modul/latihan':
        return MaterialPageRoute(builder: (_) => IndexLatihan());
      //
      case '/modul/latihan/soal':
        Map dataProgresLatihanModul = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => SoalLatihan(
                  dataProgresLatihanModul: dataProgresLatihanModul,
                ));

      case '/modul/latihan/soal/jawab':
        int indexSoal = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => JawabSoalLatihan(
                  indexSoal: indexSoal,
                ));

      case '/modul/belajar':
        Map data = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => IndexModulBelajar(
                  idModul: data['idModul'],
                  namaModul: data['namaModul'],
                ));
      //
      case '/modul/belajar/detail':
        var data = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => DetailModulBelajar(
                  indexModulbelajar: data,
                ));
      //
      // case '/test-latihan':
      //   return MaterialPageRoute(
      //       builder: (_) => TestLatihan()
      //   );
    }
  }
}
