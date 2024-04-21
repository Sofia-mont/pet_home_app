import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/features/adoption/presentation/postulations/widgets/postulation_card.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';

class TabPostulationsRejected extends ConsumerStatefulWidget {
  const TabPostulationsRejected({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TabPostulationsRejectedState();
}

class _TabPostulationsRejectedState
    extends ConsumerState<TabPostulationsRejected> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Aquí podrás ver los formularios de adopción que has rechazado',
            style: FontConstants.caption2.copyWith(
              color: Palette.textLight,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const PostulationCard(),
          const PostulationCard(),
          const PostulationCard(),
          const PostulationCard(),
          const PostulationCard(),
          const PostulationCard(),
          const PostulationCard(),
          const PostulationCard(),
          const PostulationCard(),
        ],
      ),
    );
  }
}
