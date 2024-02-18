import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:pet_home/core/constants/app_constants.dart';
import 'package:pet_home/features/auth/model/user.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

class AuthService {
  Future<AsyncValue<User>> register() async {
    String path = '${AppConstants.baseURL}/register';
    Response response = await get(Uri.parse(path));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return AsyncValue.data(User.fromJson(body));
    }
    if (response.statusCode == 400) {
      return AsyncValue.error(
        'This user is already exists',
        StackTrace.current,
      );
    }
    return AsyncError('An error has ocurred', StackTrace.current);
  }
}
