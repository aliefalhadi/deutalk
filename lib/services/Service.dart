import 'dart:async';
import 'dart:io';

import 'package:deutalk/config/locator.dart';
import 'package:deutalk/services/ApiInterceptors.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class Service {
  String uri = '';
  Dio dio = locator<ApiInterceptors>().dio;

  String baseUrl = 'http://api.france.intermediasolution.com/v1';

  Future getWithCache(String url,
      {Duration duration,
      String key,
      String subKey,
      bool isRefresh = false}) async {
    url = baseUrl + url;
    print(url);
    if (await locator<ApiInterceptors>().checkConnection()) {
      final response = dio.get(url,
          options: buildCacheOptions(duration,
              primaryKey: key,
              subKey: subKey,
              maxStale: Duration(minutes: 2),
              forceRefresh: isRefresh,
              options: Options(headers: {'requiresToken': true})));
      return response;
    } else {
      print('no');
      throw SocketException('no_internet');
    }
  }

  Future get(String url) async {
    try {
      url = baseUrl + url;
      print(url);
      if (await locator<ApiInterceptors>().checkConnection()) {
        final response = dio.get(url);
        return response;
      } else {
        print('no');
        throw SocketException('no_internet');
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        print('timeout');
      }
      if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
        print('timeout2');
      }
    }
  }

  Future postLogin2(String url, var data) async {
    url = baseUrl + url;
    if (await locator<ApiInterceptors>().checkConnection()) {
      print(data);
      final Response response = await dio.post(url,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          }),
          data: data);
      return response;
    } else {
      print('no');
      throw SocketException('no_internet');
    }
  }

  Future post(String url, var data) async {
    url = baseUrl + url;
    print(url);
    if (await locator<ApiInterceptors>().checkConnection()) {
      final response = await dio.post(url,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          }),
          data: data);
      return response;
    } else {
      print('no');
      throw SocketException('no_internet');
    }
  }

  Future put(String url, var data) async {
    url = baseUrl + url;
    print(url);
    if (await locator<ApiInterceptors>().checkConnection()) {
      final response = await dio.put(url,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          }),
          data: data);
      return response;
    } else {
      print('no');
      throw SocketException('no_internet');
    }
  }

  Future patch(String url, var data) async {
    url = baseUrl + url;
    print(url);
    if (await locator<ApiInterceptors>().checkConnection()) {
      final response = await dio.patch(url,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'requiresToken': true
          }),
          data: data);
      return response;
    } else {
      print('no');
      throw SocketException('no_internet');
    }
  }
}
