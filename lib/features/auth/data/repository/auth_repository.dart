import 'package:dio/dio.dart';
import 'package:pet_home/core/constants/app_constants.dart';
import 'package:pet_home/core/utils/dio/dio_provider.dart';
import 'package:pet_home/features/auth/domain/register_user/register_user.dart';
import 'package:pet_home/features/auth/domain/token/token.dart';
import 'package:pet_home/features/auth/domain/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) =>
    AuthRepository(client: ref.watch(dioProvider));

class AuthRepository {
  AuthRepository({required this.client});
  final Dio client;

  Future<RegisterUser> register({
    required RegisterUser user,
    CancelToken? cancelToken,
  }) async {
    const path = '${AppConstants.baseURL}/auth/register';
    final data = user.toJson();
    final response = await client.post(
      path,
      data: data,
      cancelToken: cancelToken,
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    return RegisterUser.fromJson(response.data);
  }

  Future<Token> login({required User user}) async {
    const path = '${AppConstants.baseURL}/auth/login';
    final data = user.toJson();
    final response = await client.post(
      path,
      data: data,
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    return Token.fromJson(response.data);
  }
}
