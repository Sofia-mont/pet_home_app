import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_home/features/auth/view/login/login_user_screen.dart';
import 'package:pet_home/features/auth/view/login/login_screen.dart';
import 'package:pet_home/features/auth/view/register/register_info_screen.dart';
import 'package:pet_home/features/auth/view/register/register_screen.dart';
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
import 'package:pet_home/ui/widgets/errors_screen.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: HomeScreen.path,
    navigatorKey: _rootNavigator,
    routes: [
      GoRoute(
        path: PublicationScreen.path,
        name: PublicationScreen.path,
        builder: (context, state) => const PublicationScreen(),
      ),
      //FORM ADOPTION ROUTES
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: AdoptionAlert.path,
        name: AdoptionAlert.path,
        builder: (context, state) => const AdoptionAlert(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: FamilyDataScreen.path,
        name: FamilyDataScreen.path,
        builder: (context, state) => const FamilyDataScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: PersonalDataScreen.path,
        name: PersonalDataScreen.path,
        builder: (context, state) => const PersonalDataScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: QuestionaryScreen.path,
        name: QuestionaryScreen.path,
        builder: (context, state) => const QuestionaryScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: QuestionarySecondScreen.path,
        name: QuestionarySecondScreen.path,
        builder: (context, state) => const QuestionarySecondScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: QuestionaryThirdScreen.path,
        name: QuestionaryThirdScreen.path,
        builder: (context, state) => const QuestionaryThirdScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: SecondaryDataScreen.path,
        name: SecondaryDataScreen.path,
        builder: (context, state) => const SecondaryDataScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: SuccessFormSentScreen.path,
        name: SuccessFormSentScreen.path,
        builder: (context, state) => const SuccessFormSentScreen(),
      ),
      //LOGIN ROUTES
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: LoginScreen.path,
        name: LoginScreen.path,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: LoginUserScreen.path,
        name: LoginUserScreen.path,
        builder: (context, state) => const LoginUserScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: RegisterScreen.path,
        name: RegisterScreen.path,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: RegisterInfoScreen.path,
        name: RegisterInfoScreen.path,
        builder: (context, state) => RegisterInfoScreen(
          userType: state.uri.queryParameters['userType']!,
        ),
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
    ],
    errorBuilder: (context, state) => ErrorsScreen(
      msg: state.error.toString(),
    ),
  );
});
