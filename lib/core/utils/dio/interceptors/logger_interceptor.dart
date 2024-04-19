import 'dart:developer';

import 'package:dio/dio.dart';

class LoggerInterceptor implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('❌ Dio Error!');
    log('❌ Url: ${err.requestOptions.uri}');
    log('❌ Status Code: ${err.response?.statusCode}');
    log('❌ Response Error: ${err.response?.data}');
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('🌍 Sending network request: ${options.baseUrl}${options.path}');
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('⬅️ Received network response');
    log('${response.statusCode != 200 ? '❌ ${response.statusCode} ❌' : '✅ 200 ✅'} ${response.requestOptions.baseUrl}${response.requestOptions.path}');
    log('Response: ${response.data}');
    return handler.next(response);
  }
}
