import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_home/features/auth/ui/login/login_screen.dart';
import 'package:pet_home/features/chat/ui/conversations_chat.dart';
import 'package:pet_home/features/favorites/ui/favorites_screen.dart';
import 'package:pet_home/features/home/ui/index_home.dart';
import 'package:pet_home/features/profile/ui/profile_screen.dart';
import 'package:pet_home/features/publications/ui/my_publications_screen.dart';
import 'package:pet_home/ui/widgets/app_scaffold.dart';
import 'package:pet_home/ui/widgets/errors_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/index',
    debugLogDiagnostics: true,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return AppScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: '/index',
            name: 'Index',
            builder: (context, state) => IndexHome(
              key: state.pageKey,
            ),
          ),
          GoRoute(
            path: '/profile',
            name: 'Profile',
            builder: (context, state) => ProfileScreen(
              key: state.pageKey,
            ),
          ),
          GoRoute(
            path: '/my-publications',
            name: 'My Publications',
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
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/login',
        name: 'Login',
        builder: (context, state) => LoginScreen(
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
