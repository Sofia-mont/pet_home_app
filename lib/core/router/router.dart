import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_home/core/app/app_service.dart';
import 'package:pet_home/features/auth/presentation/login/login_user_screen.dart';
import 'package:pet_home/features/auth/presentation/login/login_screen.dart';
import 'package:pet_home/features/auth/presentation/register/register_info_screen.dart';
import 'package:pet_home/features/auth/presentation/register/register_screen.dart';
import 'package:pet_home/features/favorites/ui/favorites_screen.dart';
import 'package:pet_home/features/form_adoption/ui/adoption_alert.dart';
import 'package:pet_home/features/form_adoption/ui/family_data_screen.dart';
import 'package:pet_home/features/form_adoption/ui/personal_data_screen.dart';
import 'package:pet_home/features/form_adoption/ui/questionary_first_screen.dart';
import 'package:pet_home/features/form_adoption/ui/questionary_second_screen.dart';
import 'package:pet_home/features/form_adoption/ui/questionary_third_screen.dart';
import 'package:pet_home/features/form_adoption/ui/secondary_data_screen.dart';
import 'package:pet_home/features/form_adoption/ui/success_form_sent_screen.dart';
import 'package:pet_home/features/home/ui/home_screen.dart';
import 'package:pet_home/features/publications/ui/publication_screen.dart';
import 'package:pet_home/features/publications/ui/user_publications_screen.dart';
import 'package:pet_home/ui/scaffold/scaffold_with_navbar.dart';
import 'package:pet_home/ui/widgets/response_screen.dart';

part 'redirection.dart';

final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    redirect: _redirect,
    debugLogDiagnostics: true,
    refreshListenable: AppService.instance,
    navigatorKey: AppService.instance.navigatorKey,
    routes: CustomRouter.routes,
    errorBuilder: (context, state) => const ResponseScreen(
      isError: true,
      title: 'Ha ocurrido un error',
      buttonMsg: 'Reintentar',
      message: 'No se pudo cargar la pagina',
    ),
  );
});

class CustomRouter {
  static final routes = [
    GoRoute(
      path: PublicationScreen.path,
      name: PublicationScreen.path,
      builder: (context, state) => const PublicationScreen(),
    ),
    //FORM ADOPTION ROUTES
    GoRoute(
      path: AdoptionAlert.path,
      name: AdoptionAlert.path,
      builder: (context, state) => const AdoptionAlert(),
    ),
    GoRoute(
      path: FamilyDataScreen.path,
      name: FamilyDataScreen.path,
      builder: (context, state) => const FamilyDataScreen(),
    ),
    GoRoute(
      path: PersonalDataScreen.path,
      name: PersonalDataScreen.path,
      builder: (context, state) => const PersonalDataScreen(),
    ),
    GoRoute(
      path: QuestionaryScreen.path,
      name: QuestionaryScreen.path,
      builder: (context, state) => const QuestionaryScreen(),
    ),
    GoRoute(
      path: QuestionarySecondScreen.path,
      name: QuestionarySecondScreen.path,
      builder: (context, state) => const QuestionarySecondScreen(),
    ),
    GoRoute(
      path: QuestionaryThirdScreen.path,
      name: QuestionaryThirdScreen.path,
      builder: (context, state) => const QuestionaryThirdScreen(),
    ),
    GoRoute(
      path: SecondaryDataScreen.path,
      name: SecondaryDataScreen.path,
      builder: (context, state) => const SecondaryDataScreen(),
    ),
    GoRoute(
      path: SuccessFormSentScreen.path,
      name: SuccessFormSentScreen.path,
      builder: (context, state) => const SuccessFormSentScreen(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigator,
      builder: (context, state, child) =>
          ScaffoldWithNavBar(key: state.pageKey, widget: child),
      routes: [
        GoRoute(
          path: HomeScreen.path,
          name: HomeScreen.path,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              child: HomeScreen(
                key: state.pageKey,
              ),
            );
          },
        ),
        GoRoute(
          path: UserPublicationsScreen.path,
          name: UserPublicationsScreen.path,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              child: UserPublicationsScreen(
                key: state.pageKey,
              ),
            );
          },
        ),
        GoRoute(
          path: FavoritesScreen.path,
          name: FavoritesScreen.path,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              child: FavoritesScreen(
                key: state.pageKey,
              ),
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: ResponseScreen.path,
      name: ResponseScreen.path,
      builder: (context, state) {
        final args = state.extra;
        if (args is! ResponseScreenArgs) {
          return const ResponseScreen(
            isError: true,
            title: 'Ha ocurrido un error',
            buttonMsg: 'Reintentar',
            message: 'No se pudo cargar la pagina',
          );
        }
        return ResponseScreen(
          isError: args.isError,
          title: args.title,
          buttonMsg: args.buttonMsg,
          message: args.message,
          onPressed: args.onPressed,
        );
      },
    ),
    GoRoute(
      path: LoginScreen.path,
      name: LoginScreen.path,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: LoginUserScreen.path,
      name: LoginUserScreen.path,
      builder: (context, state) => const LoginUserScreen(),
    ),
    GoRoute(
      path: RegisterScreen.path,
      name: RegisterScreen.path,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: RegisterInfoScreen.path,
      name: RegisterInfoScreen.path,
      builder: (context, state) => RegisterInfoScreen(
        userType: state.queryParameters['userType']!,
      ),
    ),
  ];
  static final notProtectedRoutes = [
    ResponseScreen.path,
    LoginScreen.path,
    LoginUserScreen.path,
    RegisterScreen.path,
    RegisterInfoScreen.path,
  ];
}
