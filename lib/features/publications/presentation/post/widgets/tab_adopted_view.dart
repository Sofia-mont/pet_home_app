import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/widgets/cards/pet_card.dart';

class TabAdoptedView extends ConsumerStatefulWidget {
  const TabAdoptedView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TabAdoptedViewState();
}

class _TabAdoptedViewState extends ConsumerState<TabAdoptedView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Aquí encontrarás todas las mascotas que ya han sido adoptadas',
            style: FontConstants.caption2.copyWith(
              color: Palette.textLight,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const PetCard(
            petName: 'Firulais',
          ),
          const PetCard(
            petName: 'Firulais',
          ),
          const PetCard(
            petName: 'Firulais',
          ),
          const PetCard(
            petName: 'Firulais',
          ),
          const PetCard(
            petName: 'Firulais',
          ),
          const PetCard(
            petName: 'Firulais',
          ),
          const PetCard(
            petName: 'Firulais',
          ),
          const PetCard(
            petName: 'Firulais',
          ),
        ],
      ),
    );
  }
}
