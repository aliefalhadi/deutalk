import 'dart:convert';
import 'dart:io';
import 'package:deutalk/config/locator.dart';
import 'package:deutalk/constants/ViewState.dart';
import 'package:deutalk/model/DaftarKataModel.dart';
import 'package:deutalk/provider/BaseProvider.dart';
import 'package:deutalk/services/KamusService.dart';

class KamusProvider extends BaseProvider {
  DaftarKataModel daftarKataModel;
  List<Datum> listKataKamus = [];
  KamusService kamusService = locator<KamusService>();
  int page = 1;
  int oldPage;
  Map cariKata = {'kata': ''};

  Future initDataKamus() async {
    try {
      setState(ViewState.Fetching);
      await refreshDataKamus();
    } catch (e) {
      print('erer');
      setState(ViewState.FetchNull);
    }
  }

  Future refreshDataKamus() async {
    try {
      listKataKamus = [];
      daftarKataModel = await kamusService.getKataKamus(page.toString());
      daftarKataModel.data.forEach((element) {
        listKataKamus.add(element);
      });
      setState(ViewState.Idle);
    } on SocketException catch (e) {
      setState(ViewState.ErrConnection);
    } catch (e) {
      print(e);
      if (e == 404 || e == 502 || e == 503) {
        setState(ViewState.ErrConnection);
      } else {
        setState(ViewState.FetchNull);
      }
    }
  }

  Future getNextDataKamus() async {
    try {
      oldPage = page;
      setState(ViewState.Fetching);
      page = page + 1;
      daftarKataModel = await kamusService.getKataKamus(page.toString());
      daftarKataModel.data.forEach((element) {
        listKataKamus.add(element);
      });
      setState(ViewState.Idle);
    } on SocketException catch (e) {
      page = oldPage;
      setState(ViewState.FetchNull);
    } catch (e) {
      page = oldPage;
      setState(ViewState.FetchNull);
    }
  }

  Future getCariKata() async {
    try {
      setState(ViewState.Fetching);
      listKataKamus = [];
      daftarKataModel = await kamusService.getCariKata(jsonEncode(cariKata));

      daftarKataModel.data.forEach((element) {
        listKataKamus.add(element);
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
}
