import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/features/adoption/domain/form_adoption_response.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/icons/pethome_icons.dart';
import 'package:pet_home/ui/widgets/texts/text_with_title.dart';

class TabPostulationInfo extends ConsumerWidget {
  const TabPostulationInfo({required this.form, super.key});

  final FormAdoptionResponse form;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        form.candidateInfo.fullName,
                        style: FontConstants.subtitle1
                            .copyWith(color: Palette.primaryDark),
                      ),
                      Text(
                        form.candidateInfo.email,
                        style: FontConstants.caption2,
                      ),
                      Text(
                        form.candidateInfo.occupation,
                        style: FontConstants.body1,
                      ),
                      Text(
                        '${form.candidateInfo.age} años',
                        style: FontConstants.body2,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Pethome.map_pin,
                          color: Palette.textMedium,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text(
                                '${form.candidateInfo.city}, ${form.candidateInfo.department}',
                                style: FontConstants.body1,
                              ),
                            ),
                            Text(
                              form.candidateInfo.address,
                              style: FontConstants.caption2
                                  .copyWith(color: Palette.textMedium),
                            ),
                            Text(
                              'Barrio ${form.candidateInfo.neighborhood.toLowerCase()}',
                              style: FontConstants.caption2
                                  .copyWith(color: Palette.textMedium),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Pethome.phone,
                          color: Palette.textMedium,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          form.candidateInfo.phoneNumber,
                          style: FontConstants.body1,
                        ),
                      ],
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Divider(
                    thickness: 0.5,
                    height: 1,
                    color: Palette.textLight,
                  ),
                ),
                Text(
                  'Composición de la familia',
                  style: FontConstants.body1,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Pethome.baby,
                          color: Palette.textMedium,
                        ),
                        const SizedBox(width: 5),
                        Text(form.familyComposition.babiesHome.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Pethome.kid,
                          size: 35,
                          color: Palette.textMedium,
                        ),
                        const SizedBox(width: 5),
                        Text(form.familyComposition.kidsHome.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Pethome.man,
                          color: Palette.textMedium,
                        ),
                        const SizedBox(width: 5),
                        Text(form.familyComposition.adultsHome.toString()),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextWithTitle(
                  title: 'Edades de cada uno',
                  text: form.familyComposition.ages,
                ),
                TextWithTitle(
                  title: 'Composición del grupo familiar',
                  text: form.familyComposition.composition,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
