import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/form_adoption/ui/adoption_alert.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/icons/pethome_icons.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';

class PublicationScreen extends ConsumerStatefulWidget {
  const PublicationScreen({super.key});

  @override
  ConsumerState<PublicationScreen> createState() => _PublicationScreenState();

  static const path = '/publication';
}

class _PublicationScreenState extends ConsumerState<PublicationScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://estaticos-cdn.prensaiberica.es/clip/823f515c-8143-4044-8f13-85ea1ef58f3a_16-9-discover-aspect-ratio_default_0.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: InkWell(
                    onTap: () => ref.read(appRouterProvider).pop(),
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        Icons.arrow_back_rounded,
                        size: 32,
                        color: Palette.textLighter,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 2.8,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width * 0.95,
                  decoration: BoxDecoration(
                    color: Palette.textLighter,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.pin_drop,
                                color: Palette.textMedium,
                                size: 20,
                              ),
                              Text(
                                'Antioquia, Itagüí',
                                style: FontConstants.body2
                                    .copyWith(color: Palette.textMedium),
                              ),
                            ],
                          ),
                          const Icon(
                            Pethome.female,
                            color: Palette.textMedium,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Firulais',
                            style: FontConstants.heading3
                                .copyWith(color: Palette.primaryDarker),
                          ),
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
                      Text(
                        '2 años',
                        style: FontConstants.body2
                            .copyWith(color: Palette.textMedium),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 1.95,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 10.0, bottom: 20),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sofia Montoya',
                                    style: FontConstants.body1,
                                  ),
                                  Text(
                                    'Dueño',
                                    style: FontConstants.caption2.copyWith(
                                      color: Palette.textMedium,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'May 10, 2024',
                                style: FontConstants.body2
                                    .copyWith(color: Palette.textMedium),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Proident sit cupidatat enim eu proident tempor elit consequat qui aliquip id. Consectetur voluptate dolore tempor est et. Cillum sit nulla fugiat consectetur laborum reprehenderit culpa dolore dolor esse et non.em. Proident sit cupidatat enim eu proident tempor elit consequat qui aliquip id. Consectetur voluptate dolore tempor est et. Cillum sit nulla fugiat consectetur laborum reprehenderit culpa dolore dolor esse et non.em',
                            style: FontConstants.body2
                                .copyWith(color: Palette.textMedium),
                          ),
                          const Spacer(),
                          LargeButton(
                            onPressed: () => {
                              ref
                                  .read(appRouterProvider)
                                  .push(AdoptionAlert.path),
                            },
                            text: 'Adoptame',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
