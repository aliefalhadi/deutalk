import 'dart:convert';

import 'package:deutalk/config//locator.dart';
import 'package:deutalk/model/DataProgresUserModel.dart';
import 'package:deutalk/services/EventBusService.dart';
import 'package:deutalk/services/LatihanService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainProvider {
  Future<String> onStartApp() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      if (sharedPreferences.containsKey('isLogin')) {
        print('login');
        bool isLogin = sharedPreferences.getBool('isLogin');
        if (isLogin) {
          await getProgresUser(sharedPreferences.getString('email'));

          return '/home';
        } else {
          return '/login';
        }
      } else {
        return '/login';
      }
    } catch (e) {
      print('err');
      return '/login';
    }
  }

  Future getProgresUser(String email) async {
    try {
      DataProgresUserModel dataProgresUserModel =
          await locator<LatihanService>().getProgresUser(email);
      if (dataProgresUserModel.data == null) {
        locator<EventBusService>().progressLatihanUser = [];
      } else {
        locator<EventBusService>().progressLatihanUser =
            jsonDecode(dataProgresUserModel.data.progres);
      }
    } catch (e) {}
  }
}
