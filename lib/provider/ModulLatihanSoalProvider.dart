import 'dart:io';

import 'package:deutalk/config/locator.dart';
import 'package:deutalk/model/DaftarSoalModulLatihanModel.dart';
import 'package:deutalk/provider/BaseProvider.dart';
import 'package:deutalk/services/EventBusService.dart';
import 'package:deutalk/services/LatihanService.dart';
import 'package:deutalk/constants/ViewState.dart';

class ModulLatihanSoalProvider extends BaseProvider {
  DaftarSoalModulLatihanModel daftarSoalModulLatihanModel;
  LatihanService latihanService = locator<LatihanService>();
  List listDaftarSoal = [];

  Future initDataSoalModulLatihan(String idModulLatihan) async {
    try {
      setState(ViewState.Fetching);

      listDaftarSoal = [];
      List dataSoalSelesai = [];
      int indexDataProgressLocal = locator<EventBusService>()
          .progressLatihanUser
          .indexWhere((element2) =>
              element2['idModulLatihan'].toString() == idModulLatihan);
      if (indexDataProgressLocal != -1) {
        dataSoalSelesai = locator<EventBusService>()
            .progressLatihanUser[indexDataProgressLocal]['soalSelesai'];
      }
      print(indexDataProgressLocal);
      print(locator<EventBusService>().progressLatihanUser);

      await getDaftarSoalModulLatihan(idModulLatihan);
      await checkProgressLatihanUser(dataSoalSelesai);
      setState(ViewState.Idle);
    } catch (e) {
      print('erer');
      setState(ViewState.FetchNull);
    }
  }

  Future getDaftarSoalModulLatihan(String idModulLatihan) async {
    try {
      daftarSoalModulLatihanModel =
          await latihanService.getDaftarSoalModulLatihan(idModulLatihan);
      //simpan di local
      locator<EventBusService>().daftarSoalModulLatihanModel =
          daftarSoalModulLatihanModel;
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

  Future checkProgressLatihanUser(List dataSoalSelesai) async {
    daftarSoalModulLatihanModel.data.forEach((element) {
      //check progress dari db
      if (dataSoalSelesai.contains(element.nomorSoal)) {
        listDaftarSoal.add({
          "dataSoal": element,
          "isSelesai": true,
        });
      } else {
        listDaftarSoal.add({
          "dataSoal": element,
          "isSelesai": false,
        });
      }
    });
  }
}
