import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/posts/domain/post.dart';
import 'package:pet_home/features/posts/presentation/post/post_screen.dart';
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
      height: 280,
      margin: EdgeInsets.only(
        right: 10,
        left: isHome ? 0 : 10,
        bottom: isHome ? 0 : 10,
        top: isHome ? 0 : 10,
      ),
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
                height: 240,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: const BoxDecoration(
                  color: Palette.textLighter,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  loadingBuilder: (
                    BuildContext context,
                    Widget child,
                    ImageChunkEvent? loadingProgress,
                  ) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  publicationInfo.petImages.first,
                  fit: BoxFit.cover,
                  height: 270,
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
