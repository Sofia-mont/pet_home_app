import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/app/app_service.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/core/sealed/custom_async_value.dart';
import 'package:pet_home/features/auth/data/provider/auth_provider.dart';
import 'package:pet_home/features/home/presentation/home_more_screen.dart';
import 'package:pet_home/features/home/presentation/widget/home_drawer.dart';
import 'package:pet_home/features/posts/presentation/give_adoption_pet/give_adoption_pet_screen.dart';
import 'package:pet_home/features/posts/presentation/post/filter_pet_screen.dart';
import 'package:pet_home/features/posts/presentation/post/my_posts_screen.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({this.showBottomBar = true, super.key});

  final bool showBottomBar;

  static const path = '/';

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(authNotifierProvider.notifier)
          .getUser(email: AppService.instance.currentUser!.user!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authNotifierProvider.select((a) => a.user));
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        backgroundColor: Palette.primary,
        title: user.when(
          data: (user) => Text(
            'Hola, ${user.name}!',
            style: FontConstants.subtitle2.copyWith(
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          failure: (p0) => const SizedBox.shrink(),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      endDrawer: const HomeDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Text(
                  'Mascotas en adopción',
                  style: FontConstants.subtitle1,
                ),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => ref.read(appRouterProvider).pushNamed(
                            HomeMore.path,
                            queryParameters: {'petType': 'Gato'},
                          ),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 5,
                            ),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFD95A59),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Palette.textMedium.withOpacity(0.25),
                                  offset: const Offset(0, 5),
                                  blurRadius: 10,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/img/cat_card.png',
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                ),
                                Text(
                                  'Gatos',
                                  style: FontConstants.body1.copyWith(
                                    color: Palette.textLighter,
                                  ),
                                ),
                                Text(
                                  'Ver gatos en adopción',
                                  style: FontConstants.caption2.copyWith(
                                    color: Palette.textLighter,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => ref.read(appRouterProvider).pushNamed(
                            HomeMore.path,
                            queryParameters: {'petType': 'Perro'},
                          ),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 5,
                            ),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFF597FD9),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Palette.textMedium.withOpacity(0.25),
                                  offset: const Offset(0, 5),
                                  blurRadius: 10,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/img/dog_card.png',
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                ),
                                Text(
                                  'Perros',
                                  style: FontConstants.body1.copyWith(
                                    color: Palette.textLighter,
                                  ),
                                ),
                                Text(
                                  'Ver perros en adopción',
                                  style: FontConstants.caption2.copyWith(
                                    color: Palette.textLighter,
                                    height: 1,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => ref.read(appRouterProvider).pushNamed(
                        FilterPetScreen.path,
                      ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 5,
                    ),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF49BB5A),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Palette.textMedium.withOpacity(0.25),
                          offset: const Offset(0, 5),
                          blurRadius: 10,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/img/search_pet_card.png',
                          width: MediaQuery.of(context).size.height * 0.1,
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Búsqueda personalizada',
                                style: FontConstants.body1.copyWith(
                                  color: Palette.textLighter,
                                ),
                              ),
                              Text(
                                'Encuentra tu mascota ideal filtrando por las características que estás buscando',
                                style: FontConstants.caption2.copyWith(
                                  color: Palette.textLighter,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                user.when(
                  data: (user) {
                    return user.userType == 'Fundación'
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Gestión de adopción',
                                style: FontConstants.subtitle1,
                              ),
                              IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () => ref
                                            .read(appRouterProvider)
                                            .pushNamed(
                                              GiveAdoptionPetScreen.path,
                                            ),
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 5,
                                          ),
                                          padding: const EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            color: Palette.secondary,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Palette.textMedium
                                                    .withOpacity(0.25),
                                                offset: const Offset(0, 5),
                                                blurRadius: 10,
                                                spreadRadius: 0,
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/img/adopt_pet_card.png',
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.1,
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                'Dar en adopción',
                                                style: FontConstants.body1
                                                    .copyWith(
                                                  color: Palette.textLighter,
                                                ),
                                              ),
                                              Text(
                                                'Publica las mascotas que están en búsqueda de un hogar',
                                                style: FontConstants.caption2
                                                    .copyWith(
                                                  color: Palette.textLighter,
                                                  height: 1.2,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () => ref
                                            .read(appRouterProvider)
                                            .pushNamed(
                                              MyPostsScreen.path,
                                            ),
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 5,
                                          ),
                                          padding: const EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF875AE6),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Palette.textMedium
                                                    .withOpacity(0.25),
                                                offset: const Offset(0, 5),
                                                blurRadius: 10,
                                                spreadRadius: 0,
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/img/my_post_card.png',
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.1,
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                'Mis publicaciones',
                                                style: FontConstants.body1
                                                    .copyWith(
                                                  color: Palette.textLighter,
                                                ),
                                              ),
                                              Text(
                                                'Ver mis mascotas publicadas',
                                                style: FontConstants.caption2
                                                    .copyWith(
                                                  color: Palette.textLighter,
                                                  height: 1.2,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink();
                  },
                  failure: (p0) => const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
