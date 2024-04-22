import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/icons/pethome_icons.dart';
import 'package:pet_home/ui/widgets/texts/text_with_title.dart';

class TabPostulationInfo extends ConsumerStatefulWidget {
  const TabPostulationInfo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TabPostulationInfoState();
}

class _TabPostulationInfoState extends ConsumerState<TabPostulationInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Container(
          height: MediaQuery.of(context).size.height * 0.72,
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
                        'Sofia Montoya Bolivar',
                        style: FontConstants.subtitle1
                            .copyWith(color: Palette.primaryDark),
                      ),
                      Text(
                        'sofia.montoya@gmail.com',
                        style: FontConstants.caption2,
                      ),
                      Text('Abogada', style: FontConstants.body1),
                      Text('21 años', style: FontConstants.body2),
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
                            Text(
                              'Itagüí, Antioquia',
                              style: FontConstants.body1,
                            ),
                            Text(
                              'Carrera 49 # 47-26',
                              style: FontConstants.caption2
                                  .copyWith(color: Palette.textMedium),
                            ),
                            Text(
                              'Barrio Asturias',
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
                        Text('3135273327', style: FontConstants.body1),
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Pethome.baby,
                          color: Palette.textMedium,
                        ),
                        SizedBox(width: 5),
                        Text('1'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Pethome.kid,
                          size: 35,
                          color: Palette.textMedium,
                        ),
                        SizedBox(width: 5),
                        Text('1'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Pethome.man,
                          color: Palette.textMedium,
                        ),
                        SizedBox(width: 5),
                        Text('1'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const TextWithTitle(
                  title: 'Edades de cada uno',
                  text: '38, 58, 21, 13',
                ),
                const TextWithTitle(
                  title: 'Composición del grupo familiar',
                  text: 'Abuela, Mamá, Hermanas',
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
                  'Datos de contacto adicional diferente a núcleo familiar',
                  style: FontConstants.body1,
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    'Ana Maria Madariaga Arce',
                    style: FontConstants.body2,
                  ),
                ),
                const SizedBox(height: 10),
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
                            Text(
                              'Itagüí, Antioquia',
                              style: FontConstants.body1,
                            ),
                            Text(
                              'Carrera 49 # 47-26',
                              style: FontConstants.caption2
                                  .copyWith(color: Palette.textMedium),
                            ),
                            Text(
                              'Barrio Asturias',
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
                        Text('3135273327', style: FontConstants.body1),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
