import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/features/adoption/presentation/postulations/widgets/postulation_card.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';

class TabPostulationsPending extends ConsumerStatefulWidget {
  const TabPostulationsPending({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PostulationTabPendingState();
}

class _PostulationTabPendingState
    extends ConsumerState<TabPostulationsPending> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Aquí podrás ver los formularios de adopción que aún están en proceso de revisión',
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
