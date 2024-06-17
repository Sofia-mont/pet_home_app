import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/features/adoption/data/provider/adoption_provider.dart';
import 'package:pet_home/features/adoption/domain/postulation_search_query.dart';
import 'package:pet_home/features/adoption/presentation/postulations/widgets/postulation_card.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:riverpod_infinite_scroll_pagination/riverpod_infinite_scroll_pagination.dart';

class TabPostulationsPending extends ConsumerStatefulWidget {
  const TabPostulationsPending({required this.postId, super.key});

  final String postId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PostulationTabPendingState();
}

class _PostulationTabPendingState
    extends ConsumerState<TabPostulationsPending> {
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final forms = ref.watch(
      adoptionFormsListProvider(
        PostulationSearchQuery(status: 'PENDIENTE', postId: widget.postId),
      ),
    );
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Aquí podrás ver los formularios de adopción que aún están en proceso de revisión',
                  style: FontConstants.body2.copyWith(
                    color: Palette.textLight,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          sliver: PaginatedListView(
            scrollController: scrollController,
            useSliver: true,
            state: forms,
            itemBuilder: (context, data) => PostulationCard(
              isPending: true,
              form: data,
            ),
            notifier: ref.read(
              (adoptionFormsListProvider(
                PostulationSearchQuery(
                  status: 'PENDIENTE',
                  postId: widget.postId,
                ),
              ).notifier),
            ),
            emptyListBuilder: (context) => SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const Icon(Icons.hourglass_bottom_rounded),
                  Center(
                    child: Text(
                      'No tienes formularios pendientes por revisar',
                      style: FontConstants.body2.copyWith(
                        color: Palette.textMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
