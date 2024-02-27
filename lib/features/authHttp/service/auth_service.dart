/* import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:pet_home/core/constants/app_constants.dart';
import 'package:pet_home/features/auth/domain/user.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

class AuthService {
  Future<AsyncValue<bool>> register(User user) async {
    String path = '${AppConstants.baseURL}/auth/register';
    var body = jsonEncode(
      User(
        user.name,
        user.email,
        user.password,
        user.userType,
        user.deparment,
        user.city,
      ).toJson(),
    );
    Response response = await post(
      Uri.parse(path),
      body: body,
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return const AsyncValue.data(true);
    }
    if (response.statusCode == 400) {
      return AsyncValue.error('The user is alredy exists', StackTrace.current);
    }
    return AsyncError('An error has ocurred', StackTrace.current);
  }
}

*/