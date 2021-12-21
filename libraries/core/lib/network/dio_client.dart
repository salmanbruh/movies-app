import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioClient {
  final String baseUrl;

  DioClient({required this.baseUrl});

  Dio get dio => _getDio();

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 50000,
      receiveTimeout: 30000,
    );
    Dio dio = Dio(options);
    dio.interceptors.addAll(<Interceptor>[_loggingInterceptor()]);
    return dio;
  }

  Interceptor _loggingInterceptor() {
    return InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      debugPrint("\n"
          "Request ${options.uri} \n"
          "-- headers --\n"
          "${options.headers.toString()} \n"
          "");
      handler.next(options);
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      if (response.statusCode == 200) {
        debugPrint("\n"
            "Response ${response.realUri} \n"
            "-- headers -- \n"
            "${response.headers.toString()} \n"
            "-- payload -- \n"
            "${jsonEncode(response.data)} \n"
            "-- END RESPONSE --"
            "");
      } else {
        debugPrint("Dio Response Status --> ${response.statusCode}");
      }
      handler.next(response);
    }, onError: (DioError e, ErrorInterceptorHandler handler) {
      debugPrint("Dio Response Error --> $e");
      handler.next(e);
    });
  }
}
