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
    initialLocation: '/login',
    navigatorKey: _rootNavigator,
    routes: [
      GoRoute(
        path: '/publication',
        name: 'userPublication',
        builder: (context, state) => const PublicationScreen(),
      ),
      //FORM ADOPTION ROUTES
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: '/adoption-alert',
        name: 'adoptionAlert',
        builder: (context, state) => const AdoptionAlert(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: '/adoption-form-family-information',
        name: 'adoptionFamilyData',
        builder: (context, state) => const FamilyDataScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: '/adoption-form-personal-information',
        name: 'adoptionPersonalData',
        builder: (context, state) => const PersonalDataScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: '/adoption-form-questionary-1',
        name: 'adoptionQuestionaryFirst',
        builder: (context, state) => const QuestionaryScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: '/adoption-form-questionary-2',
        name: 'adoptionQuestionarySecond',
        builder: (context, state) => const QuestionarySecondScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: '/adoption-form-questionary-3',
        name: 'adoptionQuestionaryThird',
        builder: (context, state) => const QuestionaryThirdScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: '/adoption-form-secondary-information',
        name: 'adoptionSecondaryData',
        builder: (context, state) => const SecondaryDataScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: '/success-form-sent',
        name: 'successFormSent',
        builder: (context, state) => const SuccessFormSentScreen(),
      ),
      //LOGIN ROUTES
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: '/login-index',
        name: 'loginIndex',
        builder: (context, state) => const LoginUserScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: '/register-info',
        name: 'registerInfo',
        builder: (context, state) => const RegisterInfoScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigator,
        builder: (context, state, child) =>
            ScaffoldWithNavBar(key: state.pageKey, widget: child),
        routes: [
          GoRoute(
            path: '/home',
            name: 'home',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: HomeScreen(
                  key: state.pageKey,
                ),
              );
            },
          ),
          GoRoute(
            path: '/user-publications',
            name: 'userPublications',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: UserPublicationsScreen(
                  key: state.pageKey,
                ),
              );
            },
          ),
          GoRoute(
            path: '/favorites',
            name: 'favorites',
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
