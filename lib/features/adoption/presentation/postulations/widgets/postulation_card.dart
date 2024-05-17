import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/adoption/presentation/user_postulation/user_postulation_screen.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';

class PostulationCard extends ConsumerStatefulWidget {
  const PostulationCard({required this.nombre, required this.date, super.key});

  final String nombre;
  final DateTime date;
  @override
  ConsumerState<PostulationCard> createState() => _PostulationCardState();
}

class _PostulationCardState extends ConsumerState<PostulationCard> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('es_ES');
  }

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
                widget.nombre,
                style:
                    FontConstants.body1.copyWith(color: Palette.primaryDarker),
              ),
              Text(
                'Enviado el ${DateFormat('d/MM/y', 'es_ES').format(widget.date)}',
                style:
                    FontConstants.caption2.copyWith(color: Palette.textLight),
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: Palette.primaryLighter,
            child: IconButton(
              onPressed: () => ref
                  .read(appRouterProvider)
                  .pushNamed(UserPostulationScreen.path),
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
