import 'package:dio/dio.dart';
import 'package:pet_home/core/constants/app_constants.dart';
import 'package:pet_home/core/utils/dio/dio_provider.dart';
import 'package:pet_home/features/auth/domain/register_request.dart';
import 'package:pet_home/features/auth/domain/token.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) =>
    AuthRepository(client: ref.watch(dioProvider));

class AuthRepository {
  AuthRepository({required this.client});
  final Dio client;

  Future<RegisterRequest> register({
    required RegisterRequest user,
    CancelToken? cancelToken,
  }) async {
    const path = '${AppConstants.baseURL}/auth/register';
    final data = user.toJson();
    final response = await client.post(
      path,
      data: data,
      cancelToken: cancelToken,
      options: Options(
        headers: {'Content-Type': 'application/json', 'requiresToken': false},
      ),
    );
    return RegisterRequest.fromJson(response.data);
  }

  Future<Token> login({required String email, required String password}) async {
    const path = '${AppConstants.baseURL}/auth/login';
    final data = {
      'email': email,
      'password': password,
    };
    final response = await client.post(
      path,
      data: data,
      options: Options(
        headers: {'Content-Type': 'application/json', 'requiresToken': false},
      ),
    );
    return Token.fromJson(response.data);
  }

  Future<Token> refreshToken({required String refreshToken}) async {
    const path = '${AppConstants.baseURL}/auth/refresh-token';
    final response = await client.post(
      path,
      data: {'token': refreshToken},
      options: Options(
        headers: {'Content-Type': 'application/json', 'requiresToken': false},
      ),
    );
    return Token.fromJson(response.data);
  }
}
