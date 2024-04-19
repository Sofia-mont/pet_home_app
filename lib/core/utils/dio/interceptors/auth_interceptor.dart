import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pet_home/core/app/app_service.dart';
import 'package:pet_home/core/app/domain/user_data.dart';
import 'package:pet_home/core/constants/app_constants.dart';
import 'package:pet_home/features/auth/domain/token/token.dart';

class AuthInterceptor implements Interceptor {
  final _localStorage = AppService.instance;
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.headers['requiresToken'] == false) {
      options.headers.remove('requiresToken');
      return handler.next(options);
    }
    final accessToken = _localStorage.currentUser?.token;
    final refreshToken = _localStorage.currentUser?.token;
    if (accessToken == null || refreshToken == null) {
      _localStorage.manageAutoLogout();
      final error = DioException(
        requestOptions: options,
        type: DioExceptionType.badCertificate,
      );
      return handler.reject(error);
    }
    final accessTokenHasExpired = JwtDecoder.isExpired(accessToken);
    final refreshTokenHasExpired = JwtDecoder.isExpired(refreshToken);

    var refreshed = true;

    if (refreshTokenHasExpired) {
      _localStorage.manageAutoLogout();
      final error = DioException(
        requestOptions: options,
        type: DioExceptionType.badCertificate,
      );
      return handler.reject(error);
    } else if (accessTokenHasExpired) {
      refreshed = await _regenerateAccessToken();
    }

    if (refreshed) {
      options.headers['Authorization'] = 'Bearer $accessToken';
      return handler.next(options);
    } else {
      final error = DioException(
        requestOptions: options,
        type: DioExceptionType.badCertificate,
      );
      return handler.reject(error);
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

  Future<bool> _regenerateAccessToken() async {
    try {
      var dio = Dio();
      final refreshToken = _localStorage.currentUser?.refreshToken;

      final response = await dio.post(
        '${AppConstants.baseURL}/auth/refresh-token',
        data: {'token': '$refreshToken'},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final newAccessToken = Token.fromJson(
          response.data,
        );
        _localStorage.setUserData(
          UserData(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            token: newAccessToken.token,
            refreshToken: newAccessToken.refreshToken,
          ),
        );
        return true;
      } else if (response.statusCode == 401 || response.statusCode == 403) {
        _localStorage.manageAutoLogout();
        return false;
      } else {
        return false;
      }
    } on DioException {
      return false;
    } catch (e) {
      return false;
    }
  }
}
