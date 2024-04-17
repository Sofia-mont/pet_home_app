import 'package:dio/dio.dart';
import 'package:pet_home/core/app/app_service.dart';

class AuthInterceptor implements Interceptor {
  final _localStorage = AppService.instance;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!options.headers.containsKey('requiresToken')) {
      return handler.next(options);
    }
    final accessToken = _localStorage.currentUser?.token;
    if (accessToken == null) {
      final error = DioException(
        requestOptions: options,
        type: DioExceptionType.badCertificate,
      );
      return handler.reject(error);
    } else {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
