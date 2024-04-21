import 'package:flutter/material.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';

class PostulationCard extends StatelessWidget {
  const PostulationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Palette.textLighter,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nombre Apellido',
                style:
                    FontConstants.body1.copyWith(color: Palette.primaryDarker),
              ),
              Text(
                'Enviado el 25-10-2024',
                style:
                    FontConstants.caption2.copyWith(color: Palette.textLight),
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: Palette.primaryLighter,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.keyboard_double_arrow_right_rounded,
                color: Palette.primaryDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
