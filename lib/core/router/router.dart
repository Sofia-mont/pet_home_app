import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_home/features/auth/ui/login/login_user_screen.dart';
import 'package:pet_home/features/auth/ui/login/login_screen.dart';
import 'package:pet_home/features/auth/ui/register/register_info_screen.dart';
import 'package:pet_home/features/auth/ui/register/register_screen.dart';
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

enum RoutePath {
  root(path: '/'),
  home(path: '/home'),
  userPublications(path: '/user-publications'),
  userPublication(path: '/publication'),
  favorites(path: '/favorites'),
  login(path: '/login'),
  loginUser(path: '/login-user'),
  register(path: '/register'),
  registerInfo(path: '/register-info'),
  adoptionAlert(path: '/adoption-aler'),
  adoptionPersonalData(path: '/adoption-form-personal-information'),
  adoptionFamilyData(path: '/adoption-form-family-information'),
  adoptionSecondaryData(path: '/adoption-form-secondary-information'),
  adoptionQuestionaryFirts(path: '/adoption-form-questionary-1'),
  adoptionQuestionarySecond(path: '/adoption-form-questionary-2'),
  adoptionQuestionaryThird(path: '/adoption-form-questionary-3'),
  successFormSent(path: '/success-form-sent');

  const RoutePath({required this.path});
  final String path;
}

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/home',
    navigatorKey: _rootNavigator,
    routes: [
      GoRoute(
        path: RoutePath.userPublication.path,
        name: RoutePath.userPublication.name,
        builder: (context, state) => const PublicationScreen(),
      ),
      //FORM ADOPTION ROUTES
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: RoutePath.adoptionAlert.path,
        name: RoutePath.adoptionAlert.name,
        builder: (context, state) => const AdoptionAlert(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: RoutePath.adoptionFamilyData.path,
        name: RoutePath.adoptionFamilyData.name,
        builder: (context, state) => const FamilyDataScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: RoutePath.adoptionPersonalData.path,
        name: RoutePath.adoptionPersonalData.name,
        builder: (context, state) => const PersonalDataScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: RoutePath.adoptionQuestionaryFirts.path,
        name: RoutePath.adoptionQuestionaryFirts.name,
        builder: (context, state) => const QuestionaryScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: RoutePath.adoptionQuestionarySecond.path,
        name: RoutePath.adoptionQuestionarySecond.name,
        builder: (context, state) => const QuestionarySecondScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: RoutePath.adoptionQuestionaryThird.path,
        name: RoutePath.adoptionQuestionaryThird.name,
        builder: (context, state) => const QuestionaryThirdScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: RoutePath.adoptionSecondaryData.path,
        name: RoutePath.adoptionSecondaryData.name,
        builder: (context, state) => const SecondaryDataScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: RoutePath.successFormSent.path,
        name: RoutePath.successFormSent.name,
        builder: (context, state) => const SuccessFormSentScreen(),
      ),
      //LOGIN ROUTES
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: RoutePath.login.path,
        name: RoutePath.login.name,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: RoutePath.loginUser.path,
        name: RoutePath.loginUser.name,
        builder: (context, state) => const LoginUserScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: RoutePath.register.path,
        name: RoutePath.register.name,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: RoutePath.registerInfo.path,
        name: RoutePath.registerInfo.name,
        builder: (context, state) => const RegisterInfoScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigator,
        builder: (context, state, child) =>
            ScaffoldWithNavBar(key: state.pageKey, widget: child),
        routes: [
          GoRoute(
            path: RoutePath.home.path,
            name: RoutePath.home.name,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: HomeScreen(
                  key: state.pageKey,
                ),
              );
            },
          ),
          GoRoute(
            path: RoutePath.userPublications.path,
            name: RoutePath.userPublications.name,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: UserPublicationsScreen(
                  key: state.pageKey,
                ),
              );
            },
          ),
          GoRoute(
            path: RoutePath.favorites.path,
            name: RoutePath.favorites.name,
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
