import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_home/features/auth/ui/login/login_user_screen.dart';
import 'package:pet_home/features/auth/ui/login/login_screen.dart';
import 'package:pet_home/features/auth/ui/register/register_info_screen.dart';
import 'package:pet_home/features/auth/ui/register/register_screen.dart';
import 'package:pet_home/features/favorites/ui/favorites_screen.dart';
import 'package:pet_home/features/home/ui/home_screen.dart';
import 'package:pet_home/features/publications/ui/user_publications_screen.dart';
import 'package:pet_home/ui/widgets/errors_screen.dart';

enum RoutePath {
  root(path: '/'),
  home(path: '/home'),
  userPublications(path: '/user-publications'),
  favorites(path: '/favorites'),
  login(path: '/login'),
  loginUser(path: '/login-user'),
  register(path: '/register'),
  registerInfo(path: '/register-info');

  const RoutePath({required this.path});
  final String path;
}

final goRouterProvider = Provider<GoRouter>((ref) {
  final rootNavKey = GlobalKey<NavigatorState>(debugLabel: 'rootNav');
  //final listenable = ref.watch(appRouterListenableProvider);
  return GoRouter(
    initialLocation: '/home',
    navigatorKey: rootNavKey,
    //refreshListenable: listenable,
    //redirect: (context, state) => appRouteRedirect(context, ref, state),
    routes: [
      GoRoute(
        path: RoutePath.home.path,
        name: RoutePath.home.name,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: RoutePath.userPublications.path,
        name: RoutePath.userPublications.name,
        builder: (context, state) => const UserPublicationsScreen(),
      ),
      GoRoute(
        path: RoutePath.favorites.path,
        name: RoutePath.favorites.name,
        builder: (context, state) => const FavoritesScreen(),
      ),
      GoRoute(
        path: RoutePath.login.path,
        name: RoutePath.login.name,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RoutePath.loginUser.path,
        name: RoutePath.loginUser.name,
        builder: (context, state) => const LoginUserScreen(),
      ),
      GoRoute(
        path: RoutePath.register.path,
        name: RoutePath.register.name,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: RoutePath.registerInfo.path,
        name: RoutePath.registerInfo.name,
        builder: (context, state) => const RegisterInfoScreen(),
      ),
    ],
    errorBuilder: (context, state) => ErrorsScreen(
      msg: state.error.toString(),
    ),
  );
});
