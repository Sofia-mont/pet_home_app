import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/publications/presentation/post/post_screen.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/icons/pethome_icons.dart';

class PetCard extends ConsumerWidget {
  const PetCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height / 3,
      margin: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () => ref.read(appRouterProvider).pushNamed(
              PostScreen.path,
            ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                  color: Palette.textLighter,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Palette.textMedium.withOpacity(0.25),
                      offset: const Offset(0, 5),
                      blurRadius: 10,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Firulais',
                            style: FontConstants.subtitle1
                                .copyWith(color: Palette.primaryDarker),
                          ),
                          const Icon(
                            Pethome.female,
                            color: Palette.textMedium,
                          ),
                        ],
                      ),
                      Text(
                        'Medellín, Itagüí',
                        style: FontConstants.caption2,
                      ),
                      Text(
                        '2 años',
                        style: FontConstants.caption1
                            .copyWith(color: Palette.textMedium),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: Palette.primaryDark,
                            size: 20,
                          ),
                          Text(
                            'Vacunado',
                            style: FontConstants.caption2,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: Palette.primaryDark,
                            size: 20,
                          ),
                          Text(
                            'Castrado',
                            style: FontConstants.caption2,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: Palette.primaryDark,
                            size: 20,
                          ),
                          Text(
                            'Desparasitado',
                            style: FontConstants.caption2,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Pethome.dog,
                            color: Palette.textMedium.withOpacity(0.3),
                            size: 35,
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            Pethome.dog,
                            color: Palette.textMedium.withOpacity(0.3),
                            size: 30,
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Pethome.dog,
                            color: Palette.primaryDark,
                            size: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              child: Container(
                height: MediaQuery.of(context).size.height / 3.2,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://estaticos-cdn.prensaiberica.es/clip/823f515c-8143-4044-8f13-85ea1ef58f3a_16-9-discover-aspect-ratio_default_0.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Palette.textMedium.withOpacity(0.3),
                      offset: const Offset(2, 3),
                      blurRadius: 5,
                      spreadRadius: 0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
