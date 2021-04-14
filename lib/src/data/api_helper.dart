import 'dart:convert';

import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:music_player/src/core/constants.dart';
import 'package:music_player/src/data/model/music_response.dart';

_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

class ApiHelper {
  Alice _alice = Alice(showNotification: kReleaseMode ? false : true, showInspectorOnShake: true);

  var _dio = Dio(BaseOptions(
    baseUrl: Constant.baseUrl,
    connectTimeout: 10000,
    receiveTimeout: 10000,
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
    followRedirects: false,
  ));

  HttpHelper() {
    _dio.interceptors..add(CookieManager(CookieJar()))..add(LogInterceptor());
    _dio.interceptors.add(_alice.getDioInterceptor());
    (_dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
  }

  Future<MusicResponse> getMusics(String query) async {
  	query = query.replaceAll(" ", "+");
  	
    try {
      Response response =
          await _dio.get("search", queryParameters: {"term": query, "entity": "song"});
      return MusicResponse.fromJson(json.decode(response.toString()));
    } on DioError catch (e) {
      return MusicResponse.withError(_handleError(e));
    }
  }

  String _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return "Request to API server was cancelled";
      case DioErrorType.connectTimeout:
        return "Connection timeout with API server";
      case DioErrorType.receiveTimeout:
        return "Receive timeout in connection with API server";
      case DioErrorType.response:
        return "Received invalid status code: ${error.response!.statusCode}";
      case DioErrorType.sendTimeout:
        return "Send timeout in connection with API server";
      default:
        return "Connection to API server failed due to internet connection";
    }
  }

  GlobalKey<NavigatorState>? getAliceKey() {
    return _alice.getNavigatorKey();
  }
}

final api = ApiHelper();