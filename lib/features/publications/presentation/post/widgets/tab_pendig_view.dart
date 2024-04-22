import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/widgets/cards/pet_card.dart';

class TabPendingView extends ConsumerStatefulWidget {
  const TabPendingView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TabPendingViewState();
}

class _TabPendingViewState extends ConsumerState<TabPendingView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Aquí podrás ver todas las mascotas que aún están en búsqueda de un hogar',
            style: FontConstants.caption2.copyWith(
              color: Palette.textLight,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const PetCard(),
          const PetCard(),
          const PetCard(),
          const PetCard(),
          const PetCard(),
          const PetCard(),
          const PetCard(),
          const PetCard(),
        ],
      ),
    );
  }
}