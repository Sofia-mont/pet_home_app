import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/icons/pethome_icons.dart';

class HomeSpeedDial extends StatelessWidget {
  const HomeSpeedDial({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Pethome.dog_nose,
      activeIcon: Icons.close,
      children: [
        SpeedDialChild(
          child: const Icon(
            Pethome.paw_filled,
            color: Palette.primary,
          ),
          label: 'Dar en adopción',
          labelStyle: FontConstants.body2.copyWith(color: Palette.textMedium),
          labelBackgroundColor: Palette.primaryLighter,
        ),
        SpeedDialChild(
          child: const Icon(
            Pethome.dog_nose,
            color: Palette.primary,
          ),
          label: 'Encuentra a tu mascota',
          labelStyle: FontConstants.body2.copyWith(color: Palette.textMedium),
          labelBackgroundColor: Palette.primaryLighter,
        ),
      ],
    );
  }
}
