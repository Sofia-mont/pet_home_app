import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_home/features/auth/ui/login/login_user_screen.dart';
import 'package:pet_home/features/auth/ui/login/login_screen.dart';
import 'package:pet_home/features/auth/ui/register/register_info_screen.dart';
import 'package:pet_home/features/auth/ui/register/register_screen.dart';
import 'package:pet_home/features/favorites/ui/favorites_screen.dart';
import 'package:pet_home/features/form_adoption/ui/family_data_screen.dart';
import 'package:pet_home/features/form_adoption/ui/personal_data_screen.dart';
import 'package:pet_home/features/form_adoption/ui/questionary_first_screen.dart';
import 'package:pet_home/features/form_adoption/ui/questionary_second_screen.dart';
import 'package:pet_home/features/form_adoption/ui/questionary_third_screen.dart';
import 'package:pet_home/features/form_adoption/ui/secondary_data_screen.dart';
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
  registerInfo(path: '/register-info'),
  adoptionPersonalData(path: '/adoption-form-personal-information'),
  adoptionFamilyData(path: '/adoption-form-family-information'),
  adoptionSecondaryData(path: '/adoption-form-secondary-information'),
  adoptionQuestionaryFirts(path: '/adoption-form-questionary-1'),
  adoptionQuestionarySecond(path: '/adoption-form-questionary-2'),
  adoptionQuestionaryThird(path: '/adoption-form-questionary-3');

  const RoutePath({required this.path});
  final String path;
}

final goRouterProvider = Provider<GoRouter>((ref) {
  final rootNavKey = GlobalKey<NavigatorState>(debugLabel: 'rootNav');
  //final listenable = ref.watch(appRouterListenableProvider);
  return GoRouter(
    initialLocation: '/home',
    navigatorKey: rootNavKey,
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
      //FORM ADOPTION ROUTES
      GoRoute(
        path: RoutePath.adoptionFamilyData.path,
        name: RoutePath.adoptionFamilyData.name,
        builder: (context, state) => const FamilyDataScreen(),
      ),
      GoRoute(
        path: RoutePath.adoptionPersonalData.path,
        name: RoutePath.adoptionPersonalData.name,
        builder: (context, state) => const PersonalDataScreen(),
      ),
      GoRoute(
        path: RoutePath.adoptionQuestionaryFirts.path,
        name: RoutePath.adoptionQuestionaryFirts.name,
        builder: (context, state) => const QuestionaryScreen(),
      ),
      GoRoute(
        path: RoutePath.adoptionQuestionarySecond.path,
        name: RoutePath.adoptionQuestionarySecond.name,
        builder: (context, state) => const QuestionarySecondScreen(),
      ),
      GoRoute(
        path: RoutePath.adoptionQuestionaryThird.path,
        name: RoutePath.adoptionQuestionaryThird.name,
        builder: (context, state) => const QuestionaryThirdScreen(),
      ),
      GoRoute(
        path: RoutePath.adoptionSecondaryData.path,
        name: RoutePath.adoptionSecondaryData.name,
        builder: (context, state) => const SecondaryDataScreen(),
      ),
      //LOGIN ROUTES
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
