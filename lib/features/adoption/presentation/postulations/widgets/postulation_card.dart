import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pet_home/features/adoption/data/provider/adoption_provider.dart';
import 'package:pet_home/features/adoption/domain/form_adoption_projection/form_adoption_projection.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';

class PostulationCard extends ConsumerStatefulWidget {
  const PostulationCard({required this.form, super.key});

  final FormAdoptionProjection form;
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
                widget.form.candidateFullName,
                style:
                    FontConstants.body1.copyWith(color: Palette.primaryDarker),
              ),
              Text(
                'Enviado el ${DateFormat('d/MM/y', 'es_ES').format(widget.form.sentAt)}',
                style:
                    FontConstants.caption2.copyWith(color: Palette.textLight),
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: Palette.primaryLighter,
            child: IconButton(
              onPressed: () => ref
                  .read(adoptionNotifierProvider.notifier)
                  .getFormById(context: context, formId: widget.form.id),
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
