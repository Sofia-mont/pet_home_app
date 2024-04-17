part of 'router.dart';

String? _redirect(BuildContext context, GoRouterState state) {
  final isLoggedIn = AppService.instance.isLoggedIn;
  final isProtectedRoute =
      !CustomRouter.notProtectedRoutes.contains(state.matchedLocation);

  if (!isLoggedIn && isProtectedRoute) {
    return LoginScreen.path;
  }
  return null;
}
