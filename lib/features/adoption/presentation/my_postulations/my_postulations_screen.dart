import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/scaffold/custom_scaffold.dart';
import 'package:pet_home/ui/widgets/cards/pet_card.dart';

class MyPostulationsScreen extends ConsumerStatefulWidget {
  const MyPostulationsScreen({super.key});

  static const path = '/my-postulations';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MyPostulationsScreenState();
}

class _MyPostulationsScreenState extends ConsumerState<MyPostulationsScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appbarTitle: 'Mis postulaciones',
      body: Column(
        children: [
          Text(
            'Aquí puedes ver todas las mascotas a las cuales te postulaste para adoptar',
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
