import 'dart:convert';
import 'dart:io';

import 'package:deutalk/config/locator.dart';
import 'package:deutalk/model/DaftarModulBelajarModel.dart';
import 'package:deutalk/model/DaftarModulLatihanModel.dart';
import 'package:deutalk/model/DaftarModulModel.dart';
import 'package:deutalk/provider/BaseProvider.dart';
import 'package:deutalk/services/EventBusService.dart';
import 'package:deutalk/services/LatihanService.dart';
import 'package:deutalk/services/ModulService.dart';
import 'package:deutalk/constants/ViewState.dart';

class ModulLatihanProvider extends BaseProvider {
  DaftarModulLatihanModel daftarModulLatihanModel;
  LatihanService latihanService = locator<LatihanService>();
  List listProgressLatihanUser = [];
  int totalProgresTemp = 0;
  double totalProgres = 0;
  int totalSoal;
  int totalSoalSelesai;

  Future initDataModul() async {
    try {
      setState(ViewState.Fetching);
      listProgressLatihanUser = [];
      totalSoalSelesai = 0;
      totalSoal = 0;
      await getDaftarModulLatihan();
      await checkProgressLatihanUser(daftarModulLatihanModel);
      setState(ViewState.Idle);
    } catch (e) {
      print('erer');
      setState(ViewState.FetchNull);
    }
  }

  Future getDaftarModulLatihan() async {
    try {
      daftarModulLatihanModel = await latihanService.getDaftarModulLatihan();
    } on SocketException catch (e) {
      setState(ViewState.ErrConnection);
    } catch (e) {
      if (e == 404 || e == 502 || e == 503) {
        setState(ViewState.ErrConnection);
      } else {
        setState(ViewState.FetchNull);
      }
    }
  }

  //
  Future checkProgressLatihanUser(
      DaftarModulLatihanModel daftarModulLatihanModel) async {
    print('masuk');
    daftarModulLatihanModel.data.forEach((element) {
      //check progress dari db
      int indexDataProgressLocal = locator<EventBusService>()
          .progressLatihanUser
          .indexWhere((element2) =>
              element2['idModulLatihan'] == element.model.idModulLatihan);

      if (indexDataProgressLocal == -1) {
        listProgressLatihanUser.add({
          "namaModulLatihan": element.model.namaModulLatihan,
          "idModulLatihan": element.model.idModulLatihan,
          "soalSelesai": [],
          "nilaiProses": 0
        });
        totalSoal += int.parse(element.jumlahSoal);
      } else {
        var nilaiProgres = locator<EventBusService>()
                .progressLatihanUser[indexDataProgressLocal]['soalSelesai']
                .length /
            int.parse(element.jumlahSoal) *
            100;

        totalSoal += int.parse(element.jumlahSoal);
        totalSoalSelesai += locator<EventBusService>()
            .progressLatihanUser[indexDataProgressLocal]['soalSelesai']
            .length;

        listProgressLatihanUser.add({
          "namaModulLatihan": element.model.namaModulLatihan,
          "idModulLatihan": element.model.idModulLatihan,
          "soalSelesai": locator<EventBusService>()
              .progressLatihanUser[indexDataProgressLocal]['soalSelesai'],
          "nilaiProses": nilaiProgres
        });
      }
    });
    print('listp');
    print(listProgressLatihanUser);

    totalProgres = totalSoalSelesai / totalSoal * 100;
    print(totalProgres);
  }
}
