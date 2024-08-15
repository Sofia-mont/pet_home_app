import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pet_home/core/app/domain/user_data.dart';
import 'package:pet_home/features/auth/presentation/login/login_screen.dart';

class AppService extends ChangeNotifier {
  AppService._();

  factory AppService() => _instance;

  static AppService get instance => _instance;
  static final AppService _instance = AppService._();

  final Box storageBox = Hive.box('App Service Box');

  final navigatorKey = GlobalKey<NavigatorState>();

  BuildContext get context => navigatorKey.currentContext!;

  final _kCurrentUserKey = 'current_user';

  UserData? currentUser;

  bool accessTokenHasExpired = false;

  bool refreshTokenHasExpired = false;

  bool get isLoggedIn => currentUser != null;

  void initialize() {
    final user = storageBox.get(_kCurrentUserKey);
    if (user != null) {
      currentUser = user;
      final accessToken = currentUser?.token;
      final refreshToken = currentUser?.refreshToken;
      final userData = currentUser?.user;
      if (accessToken == null || refreshToken == null || userData == null) {
        manageAutoLogout();
      } else {
        accessTokenHasExpired = JwtDecoder.isExpired(accessToken);
        refreshTokenHasExpired = JwtDecoder.isExpired(refreshToken);
      }
    }
  }

  void setUserData(UserData userData) {
    storageBox.put(_kCurrentUserKey, userData);
    currentUser = userData;
    notifyListeners();
  }

  void manageAutoLogout() {
    terminate();
    context.go(LoginScreen.path);
  }

  Future<void> terminate() async {
    currentUser = null;
    storageBox.clear();
  }
}
