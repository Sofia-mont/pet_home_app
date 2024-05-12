import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_home/core/app/app_service.dart';
import 'package:pet_home/features/adoption/presentation/my_postulations/my_postulations_screen.dart';
import 'package:pet_home/features/adoption/presentation/postulations/postulations_list_screen.dart';
import 'package:pet_home/features/adoption/presentation/user_postulation/user_postulation_screen.dart';
import 'package:pet_home/features/auth/presentation/login/login_user_screen.dart';
import 'package:pet_home/features/auth/presentation/login/login_screen.dart';
import 'package:pet_home/features/auth/presentation/register/register_info_screen.dart';
import 'package:pet_home/features/auth/presentation/register/register_screen.dart';
import 'package:pet_home/features/adoption/presentation/form_adoption/family_data_screen.dart';
import 'package:pet_home/features/adoption/presentation/form_adoption/personal_data_screen.dart';
import 'package:pet_home/features/adoption/presentation/form_adoption/questionary_first_screen.dart';
import 'package:pet_home/features/adoption/presentation/form_adoption/questionary_second_screen.dart';
import 'package:pet_home/features/adoption/presentation/form_adoption/adoption_conditions_screen.dart';
import 'package:pet_home/features/adoption/presentation/form_adoption/secondary_data_screen.dart';
import 'package:pet_home/features/adoption/presentation/form_adoption/success_form_sent_screen.dart';
import 'package:pet_home/features/home/presentation/home_more_screen.dart';
import 'package:pet_home/features/home/presentation/home_screen.dart';
import 'package:pet_home/features/publications/domain/post/post/post.dart';
import 'package:pet_home/features/publications/presentation/adopt_pet/adopt_pet_screen.dart';
import 'package:pet_home/features/publications/presentation/post/post_screen.dart';
import 'package:pet_home/features/publications/presentation/post/my_posts_screen.dart';
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
    ...authRoutes,
    ...adoptionRoutes,
    GoRoute(
      parentNavigatorKey: AppService.instance.navigatorKey,
      path: HomeMore.path,
      name: HomeMore.path,
      builder: (context, state) => HomeMore(
        petType: state.queryParameters['petType']!,
      ),
    ),
    GoRoute(
      parentNavigatorKey: AppService.instance.navigatorKey,
      path: UserPostulationScreen.path,
      name: UserPostulationScreen.path,
      builder: (context, state) => const UserPostulationScreen(),
    ),
    GoRoute(
      parentNavigatorKey: AppService.instance.navigatorKey,
      path: AdoptPetScreen.path,
      name: AdoptPetScreen.path,
      builder: (context, state) => const AdoptPetScreen(),
    ),
    GoRoute(
      parentNavigatorKey: AppService.instance.navigatorKey,
      path: PostScreen.path,
      name: PostScreen.path,
      builder: (context, state) {
        Post publication = state.extra as Post;
        return PostScreen(
          isOwner: bool.tryParse(state.queryParameters['isOwner'] ?? 'false') ??
              false,
          publication: publication,
        );
      },
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
            return CustomTransitionPage(
              child: HomeScreen(
                key: state.pageKey,
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: MyPostsScreen.path,
          name: MyPostsScreen.path,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: MyPostsScreen(
                key: state.pageKey,
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: MyPostulationsScreen.path,
          name: MyPostulationsScreen.path,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: MyPostulationsScreen(
                key: state.pageKey,
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
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
  ];

  static final authRoutes = [
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

  static final adoptionRoutes = [
    GoRoute(
      parentNavigatorKey: AppService.instance.navigatorKey,
      path: FamilyDataScreen.path,
      name: FamilyDataScreen.path,
      builder: (context, state) => const FamilyDataScreen(),
    ),
    GoRoute(
      parentNavigatorKey: AppService.instance.navigatorKey,
      path: PersonalDataScreen.path,
      name: PersonalDataScreen.path,
      builder: (context, state) => const PersonalDataScreen(),
    ),
    GoRoute(
      parentNavigatorKey: AppService.instance.navigatorKey,
      path: QuestionaryScreen.path,
      name: QuestionaryScreen.path,
      builder: (context, state) => const QuestionaryScreen(),
    ),
    GoRoute(
      parentNavigatorKey: AppService.instance.navigatorKey,
      path: QuestionarySecondScreen.path,
      name: QuestionarySecondScreen.path,
      builder: (context, state) => const QuestionarySecondScreen(),
    ),
    GoRoute(
      parentNavigatorKey: AppService.instance.navigatorKey,
      path: AdoptionConditionsScreen.path,
      name: AdoptionConditionsScreen.path,
      builder: (context, state) => const AdoptionConditionsScreen(),
    ),
    GoRoute(
      parentNavigatorKey: AppService.instance.navigatorKey,
      path: SecondaryDataScreen.path,
      name: SecondaryDataScreen.path,
      builder: (context, state) => const SecondaryDataScreen(),
    ),
    GoRoute(
      parentNavigatorKey: AppService.instance.navigatorKey,
      path: SuccessFormSentScreen.path,
      name: SuccessFormSentScreen.path,
      builder: (context, state) => const SuccessFormSentScreen(),
    ),
    GoRoute(
      parentNavigatorKey: AppService.instance.navigatorKey,
      path: PostulationsListScreen.path,
      name: PostulationsListScreen.path,
      builder: (context, state) => const PostulationsListScreen(),
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
