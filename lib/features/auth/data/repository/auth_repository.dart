import 'package:dio/dio.dart';
import 'package:pet_home/core/constants/app_constants.dart';
import 'package:pet_home/core/utils/dio_provider.dart';
import 'package:pet_home/features/auth/domain/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) =>
    AuthRepository(client: ref.watch(dioProvider));

class AuthRepository {
  AuthRepository({required this.client});
  final Dio client;

  Future<User> register({required User user, CancelToken? cancelToken}) async {
    const path = '${AppConstants.baseURL}/auth/register';
    final data = user.toJson();
    final response = await client.post(
      path,
      data: data,
      cancelToken: cancelToken,
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    return User.fromJson(response.data);
  }
}
