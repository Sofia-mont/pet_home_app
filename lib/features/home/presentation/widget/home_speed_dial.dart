import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/publications/presentation/adopt_pet/adopt_pet_screen.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/icons/pethome_icons.dart';
import 'package:pet_home/ui/widgets/modals/custom_modals.dart';

class HomeSpeedDial extends ConsumerWidget {
  const HomeSpeedDial({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SpeedDial(
      icon: Pethome.dog_nose,
      activeIcon: Icons.clear_outlined,
      spacing: 20,
      children: [
        SpeedDialChild(
          child: const Icon(
            Pethome.home_heart,
            color: Palette.primary,
          ),
          label: 'Dar en adopción',
          labelStyle: FontConstants.body2.copyWith(color: Palette.textMedium),
          labelBackgroundColor: Palette.primaryLighter,
          onTap: () =>
              ref.read(appRouterProvider).pushNamed(AdoptPetScreen.path),
        ),
        SpeedDialChild(
          child: const Icon(
            Pethome.dog_nose,
            color: Palette.primary,
          ),
          label: 'Encuentra a tu mascota',
          labelStyle: FontConstants.body2.copyWith(color: Palette.textMedium),
          labelBackgroundColor: Palette.primaryLighter,
          onTap: () => ref
              .read(customModalsProvider)
              .showFilterDialog(buildContext: context),
        ),
      ],
    );
  }
}
