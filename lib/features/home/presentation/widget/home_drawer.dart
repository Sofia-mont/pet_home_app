import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/app/app_service.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/adoption/presentation/my_postulations/my_postulations_screen.dart';
import 'package:pet_home/features/posts/presentation/give_adoption_pet/give_adoption_pet_screen.dart';
import 'package:pet_home/features/posts/presentation/post/filter_pet_screen.dart';
import 'package:pet_home/features/posts/presentation/post/my_posts_screen.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/icons/pethome_icons.dart';
import 'package:pet_home/ui/scaffold/scaffold_controller.dart';

class HomeDrawer extends ConsumerWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Column(
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
                ListTile(
                  leading: const Icon(
                    Pethome.home_heart,
                    color: Palette.textMedium,
                  ),
                  title: Text(
                    'Dar en adopción',
                    style: FontConstants.body1,
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
                    'Encuentra tu mascota',
                    style: FontConstants.body1,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    ref.read(appRouterProvider).pushNamed(FilterPetScreen.path);
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
                ListTile(
                  leading: const Icon(
                    Pethome.paw_filled,
                    color: Palette.textMedium,
                  ),
                  title: Text(
                    'Mis publicaciones',
                    style: FontConstants.body1,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    ref
                        .read(scaffoldControllerProvider.notifier)
                        .setPosition(1);
                    ref.read(appRouterProvider).go(MyPostsScreen.path);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Pethome.heart_filled,
                    color: Palette.textMedium,
                  ),
                  title: Text(
                    'Mis postulaciones',
                    style: FontConstants.body1,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    ref
                        .read(scaffoldControllerProvider.notifier)
                        .setPosition(2);
                    ref.read(appRouterProvider).go(MyPostulationsScreen.path);
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
            ),
            onTap: () => AppService.instance.manageAutoLogout(),
          ),
        ],
      ),
    );
  }
}
