import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_home/features/auth/ui/login/login_main_screen.dart';
import 'package:pet_home/features/auth/ui/login/login_screen.dart';
import 'package:pet_home/features/auth/ui/register/register_info_step.dart';
import 'package:pet_home/features/auth/ui/register/register_option_step.dart';
import 'package:pet_home/features/favorites/ui/favorites_screen.dart';
import 'package:pet_home/features/home/ui/index_home.dart';
import 'package:pet_home/features/publications/ui/my_publications_screen.dart';
import 'package:pet_home/ui/widgets/errors_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/index',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/index',
        name: 'Index',
        builder: (context, state) => IndexHome(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/my-publications',
        name: 'MyPublications',
        builder: (context, state) => MyPublicationsScreen(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/favorites',
        name: 'Favorites',
        builder: (context, state) => FavoritesScreen(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/login',
        name: 'Login',
        builder: (context, state) => LoginScreen(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/login-main',
        name: 'LoginMain',
        builder: (context, state) => LoginMainScreen(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/register-option-step',
        name: 'RegisterOptionStep',
        builder: (context, state) => RegisterOptionStep(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/register-info-step',
        name: 'RegisterInfoStep',
        builder: (context, state) => RegisterInfoStep(
          key: state.pageKey,
        ),
      ),
    ],
    errorBuilder: (context, state) => ErrorsScreen(
      msg: state.error.toString(),
      key: state.pageKey,
    ),
  );
});
