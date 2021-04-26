import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiInterceptors {
  Dio dio;
  DioCacheManager dioCacheManager;

  ApiInterceptors() {
    print('construct');
    dio = new Dio(BaseOptions(
      connectTimeout: 20000,
      receiveTimeout: 20000,
      contentType: "application/json;charset=utf-8",
    ));
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options) => requestInterceptor(options)));

    dioCacheManager = DioCacheManager(CacheConfig());
    dio.interceptors.add(dioCacheManager.interceptor);
  }

  dynamic requestInterceptor(RequestOptions options) async {
    print('on request');
    print(options.headers.containsKey("requiresToken"));
    if (options.headers.containsKey("requiresToken")) {
      //remove the auxiliary header
      options.headers.remove("requiresToken");
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String token = '';
      if (options.headers.containsKey('marketplace')) {
        options.headers.remove('marketplace');
        if (sharedPreferences.containsKey('tokenPembeli')) {
          token = sharedPreferences.getString('tokenPembeli');
        } else {
          token = 'public';
        }
      } else {
        token = sharedPreferences.getString("token");
      }
      print(token);
      options.headers.addAll({"Authorization": "Bearer $token"});

      return options;
    }
  }

  Future<bool> deleteCacheByKey(String key) async {
    print('delete cache');
    bool deleteCache = await dioCacheManager.delete(key, requestMethod: 'GET');
    return deleteCache;
  }

  void deleteAllCache() {
    dioCacheManager.clearAll();
  }

  Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(Duration(seconds: 5));
      bool res;
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('ok internet');
        res = true;
      } else {
        res = false;
      }
      return res;
    } on SocketException catch (_) {
      print('no connection');
      return false;
    }
  }
}
