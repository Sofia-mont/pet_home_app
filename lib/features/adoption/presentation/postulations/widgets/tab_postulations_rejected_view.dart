import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/features/adoption/data/provider/adoption_provider.dart';
import 'package:pet_home/features/adoption/domain/postulation_search_query/postulation_search_query.dart';
import 'package:pet_home/features/adoption/presentation/postulations/widgets/postulation_card.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:riverpod_infinite_scroll_pagination/riverpod_infinite_scroll_pagination.dart';

class TabPostulationsRejected extends ConsumerStatefulWidget {
  const TabPostulationsRejected({required this.postId, super.key});

  final String postId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TabPostulationsRejectedState();
}

class _TabPostulationsRejectedState
    extends ConsumerState<TabPostulationsRejected> {
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final forms = ref.watch(
      adoptionFormsListProvider(
        PostulationSearchQuery(status: 'RECHAZADO', postId: widget.postId),
      ),
    );
    return PaginatedListView(
      state: forms,
      itemBuilder: (_, data) => PostulationCard(
        nombre: data.candidateFullName,
        date: data.sentAt,
      ),
      emptyListBuilder: (_) => Center(
        child: Text(
          'No tienes formularios rechazados',
          style: FontConstants.body2.copyWith(
            color: Palette.textMedium,
          ),
        ),
      ),
      notifier: ref.read(
        (adoptionFormsListProvider(
          PostulationSearchQuery(
            status: 'RECHAZADO',
            postId: widget.postId,
          ),
        ).notifier),
      ),
    );
  }
}
