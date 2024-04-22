import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/icons/pethome_icons.dart';
import 'package:pet_home/ui/widgets/texts/text_with_title.dart';

class TabPostulationQuestionnary extends ConsumerWidget {
  const TabPostulationQuestionnary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                const TextWithTitle(
                  alignment: CrossAxisAlignment.center,
                  boldTitle: true,
                  title: 'Razón de adopción',
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Divider(
                    thickness: 0.5,
                    height: 1,
                    color: Palette.textLight,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Pethome.home_heart,
                          color: Palette.textMedium,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Apartamento', style: FontConstants.body1),
                            Text('Propia', style: FontConstants.caption2),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.check,
                              color: Palette.textMedium,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'Permite mascotas',
                              style: FontConstants.body2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.clear_outlined,
                      color: Palette.textMedium,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        'Vivienda con patio, terraza o jardín cubierto',
                        style: FontConstants.body2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.check,
                      color: Palette.textMedium,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        'Dispuesto a colocar protecciones para prevenir escapes y accidentes',
                        style: FontConstants.body2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Center(
                  child: TextWithTitle(
                    alignment: CrossAxisAlignment.center,
                    boldTitle: true,
                    title: 'Vivienda destinada al animal',
                    text: 'Toda la casa',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Divider(
                    thickness: 0.5,
                    height: 1,
                    color: Palette.textLight,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.clear_outlined,
                      color: Palette.textMedium,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        'Candidato o familiar alérgico al pelo de gato o perro',
                        style: FontConstants.body2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.check,
                      color: Palette.textMedium,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        'Puede cubrir económicamente sus necesidades',
                        style: FontConstants.body2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'Horas al día que permanecería solo el animal: ',
                          style: FontConstants.body2,
                        ),
                        TextSpan(text: '2', style: FontConstants.body1),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Tiempo diario para compartir con el animal: ',
                          style: FontConstants.body2,
                        ),
                        TextSpan(text: '2', style: FontConstants.body1),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Divider(
                    thickness: 0.5,
                    height: 1,
                    color: Palette.textLight,
                  ),
                ),
                const TextWithTitle(
                  alignment: CrossAxisAlignment.center,
                  boldTitle: true,
                  title:
                      '¿Qué sucedería si alguien resultara alérgico al animal?',
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                ),
                const SizedBox(height: 10),
                const TextWithTitle(
                  alignment: CrossAxisAlignment.center,
                  boldTitle: true,
                  title:
                      '¿Qué sucedería si el candidato o, en caso de ser hombre, su pareja quedara embarazada?',
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                ),
                const SizedBox(height: 10),
                const TextWithTitle(
                  alignment: CrossAxisAlignment.center,
                  boldTitle: true,
                  title:
                      '¿Anteriormente ha tenido animales en casa? ¿Cuál (es)? ¿Qué paso con ellos?',
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
