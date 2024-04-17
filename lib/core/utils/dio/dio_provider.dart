import 'package:dio/dio.dart';
import 'package:pet_home/core/utils/dio/interceptors/auth_interceptor.dart';
import 'package:pet_home/core/utils/dio/interceptors/logger_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final dio = Dio();
  dio.interceptors.addAll([AuthInterceptor(), LoggerInterceptor()]);
  return dio;
}
