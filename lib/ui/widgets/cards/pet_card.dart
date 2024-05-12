import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/publications/domain/post/post/post.dart';
import 'package:pet_home/features/publications/presentation/post/post_screen.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/icons/pethome_icons.dart';

class PetCard extends ConsumerWidget {
  const PetCard({
    required this.publicationInfo,
    this.isHome = false,
    this.isOwner = false,
    super.key,
  });

  final Post publicationInfo;
  final bool isHome;
  final bool isOwner;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height / 3,
      margin: EdgeInsets.only(right: 10, left: isHome ? 0 : 10),
      child: InkWell(
        onTap: () => ref.read(appRouterProvider).pushNamed(
          PostScreen.path,
          extra: publicationInfo,
          queryParameters: {
            'isOwner': isOwner.toString(),
          },
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              right: 0,
              child: Container(
                height: 230,
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
                          Expanded(
                            child: Text(
                              publicationInfo.petName,
                              style: FontConstants.subtitle1.copyWith(
                                color: Palette.primaryDarker,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Icon(
                            publicationInfo.petSex == 'Macho'
                                ? Pethome.male
                                : Pethome.female,
                            color: publicationInfo.petSex == 'Macho'
                                ? Palette.primary
                                : Palette.softPink,
                          ),
                        ],
                      ),
                      Text(
                        '${publicationInfo.department}, ${publicationInfo.city}',
                        style: FontConstants.caption2,
                      ),
                      Text(
                        publicationInfo.petAge,
                        style: FontConstants.caption1
                            .copyWith(color: Palette.textMedium),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          if (publicationInfo.vaccinated)
                            const Icon(
                              Icons.check_circle,
                              color: Palette.successDark,
                              size: 20,
                            )
                          else
                            const Icon(
                              Icons.cancel,
                              color: Palette.errorDark,
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
                          if (publicationInfo.neutered)
                            const Icon(
                              Icons.check_circle,
                              color: Palette.successDark,
                              size: 20,
                            )
                          else
                            const Icon(
                              Icons.cancel,
                              color: Palette.errorDark,
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
                          if (publicationInfo.dewormed)
                            const Icon(
                              Icons.check_circle,
                              color: Palette.successDark,
                              size: 20,
                            )
                          else
                            const Icon(
                              Icons.cancel,
                              color: Palette.errorDark,
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
                            color: Palette.textMedium.withOpacity(
                              publicationInfo.petSize == 'Grande' ? 1 : 0.3,
                            ),
                            size: 35,
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            Pethome.dog,
                            color: Palette.textMedium.withOpacity(
                              publicationInfo.petSize == 'Mediano' ? 1 : 0.3,
                            ),
                            size: 30,
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            Pethome.dog,
                            color: Palette.textMedium.withOpacity(
                              publicationInfo.petSize == 'Pequeño' ? 1 : 0.3,
                            ),
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
                height: 260,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: NetworkImage(
                      publicationInfo.petImages.first,
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
