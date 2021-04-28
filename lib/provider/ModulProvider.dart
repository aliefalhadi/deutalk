import 'dart:convert';
import 'dart:io';

import 'package:deutalk/config/locator.dart';
import 'package:deutalk/model/DaftarModulBelajarModel.dart';
// import 'package:deutalk/models/DaftarModulBelajarModel.dart';
import 'package:deutalk/model/DaftarModulModel.dart';
import 'package:deutalk/provider/BaseProvider.dart';
import 'package:deutalk/services/EventBusService.dart';
import 'package:deutalk/services/ModulService.dart';
import 'package:deutalk/constants/ViewState.dart';

class ModulProvider extends BaseProvider {
  DaftarModulModel daftarModulModel;
  DaftarModulBelajarModel daftarModulBelajarModel;
  List<Datum> listModul = [];
  ModulService modulService = locator<ModulService>();
  int page = 1;
  int oldPage;
  Map cariKata = {'kata': ''};

  Future initDataModul() async {
    try {
      setState(ViewState.Fetching);
      await refreshDataModul();
    } catch (e) {
      print('erer');
      setState(ViewState.FetchNull);
    }
  }

  Future refreshDataModul() async {
    try {
      listModul = [];
      daftarModulModel = await modulService.getDaftarModul();
      daftarModulModel.data.forEach((element) {
        listModul.add(element);
      });
      setState(ViewState.Idle);
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

  Future getDaftarModulBelajar(String idModul) async {
    try {
      setState(ViewState.Fetching);
      daftarModulBelajarModel =
          await modulService.getDaftarModulBelajar(idModul);
      if (daftarModulBelajarModel.data.isEmpty) {
        throw ('errr');
      }
      locator<EventBusService>().daftarModulBelajarModel =
          daftarModulBelajarModel;
      setState(ViewState.Idle);
    } catch (e) {
      print('erer');
      setState(ViewState.FetchNull);
    }
  }
}
