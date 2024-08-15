import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/app/app_service.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/core/sealed/custom_async_value.dart';
import 'package:pet_home/features/adoption/presentation/my_postulations/my_postulations_screen.dart';
import 'package:pet_home/features/auth/data/provider/auth_provider.dart';
import 'package:pet_home/features/posts/presentation/give_adoption_pet/give_adoption_pet_screen.dart';
import 'package:pet_home/features/posts/presentation/post/filter_pet_screen.dart';
import 'package:pet_home/features/posts/presentation/post/my_posts_screen.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/icons/pethome_icons.dart';

class HomeDrawer extends ConsumerStatefulWidget {
  const HomeDrawer({super.key});

  @override
  ConsumerState<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends ConsumerState<HomeDrawer> {
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
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: user.when(
        data: (user) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: const BoxDecoration(
                        color: Palette.primary,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.asset(
                            'assets/img/pethome_logo.png',
                            height: 50,
                          ),
                          const SizedBox(width: 20),
                          Text(
                            'Pet Home',
                            style: FontConstants.heading2
                                .copyWith(color: Palette.textLighter),
                          ),
                        ],
                      ),
                    ),
                    if (user.userType == 'Fundación')
                      ListTile(
                        leading: const Icon(
                          Pethome.home_heart,
                          color: Palette.textMedium,
                        ),
                        title: Text(
                          'Dar en adopción',
                          style: FontConstants.body1
                              .copyWith(color: Palette.textMedium),
                        ),
                        onTap: () {
                          ref.read(appRouterProvider).pop();
                          ref
                              .read(appRouterProvider)
                              .pushNamed(GiveAdoptionPetScreen.path);
                        },
                      ),
                    ListTile(
                      leading: const Icon(
                        Pethome.dog_nose,
                        color: Palette.textMedium,
                      ),
                      title: Text(
                        'Buscar mascota',
                        style: FontConstants.body1
                            .copyWith(color: Palette.textMedium),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        ref
                            .read(appRouterProvider)
                            .pushNamed(FilterPetScreen.path);
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Divider(
                        indent: 15,
                        endIndent: 15,
                        color: Palette.textMedium,
                      ),
                    ),
                    if (user.userType == 'Fundación')
                      ListTile(
                        leading: const Icon(
                          Pethome.paw_filled,
                          color: Palette.textMedium,
                        ),
                        title: Text(
                          'Mis publicaciones',
                          style: FontConstants.body1
                              .copyWith(color: Palette.textMedium),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          ref.read(appRouterProvider).push(MyPostsScreen.path);
                        },
                      ),
                    if (user.userType == 'Persona')
                      ListTile(
                        leading: const Icon(
                          Pethome.heart_filled,
                          color: Palette.textMedium,
                        ),
                        title: Text(
                          'Mis postulaciones',
                          style: FontConstants.body1
                              .copyWith(color: Palette.textMedium),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          ref
                              .read(appRouterProvider)
                              .push(MyPostulationsScreen.path);
                        },
                      ),
                  ],
                ),
              ),
              const Divider(
                indent: 15,
                endIndent: 15,
                color: Palette.textMedium,
              ),
              ListTile(
                leading: Transform.scale(
                  scaleX: -1,
                  child: const Icon(
                    Icons.login_rounded,
                    color: Palette.textMedium,
                  ),
                ),
                title: const Text(
                  'Cerrar sesión',
                  style: TextStyle(color: Palette.textMedium),
                ),
                onTap: () => AppService.instance.manageAutoLogout(),
              ),
            ],
          );
        },
        failure: (p0) => const SizedBox.shrink(),
      ),
    );
  }
}
