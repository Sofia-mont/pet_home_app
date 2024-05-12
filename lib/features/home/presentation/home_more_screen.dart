import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/features/publications/data/provider/publications_provider.dart';
import 'package:pet_home/features/publications/domain/posts/publications_search_query/publications_search_query.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/widgets/cards/pet_card.dart';
import 'package:riverpod_infinite_scroll_pagination/riverpod_infinite_scroll_pagination.dart';

class HomeMore extends ConsumerStatefulWidget {
  const HomeMore({required this.petType, super.key});

  final String petType;

  static const path = '/more';

  @override
  ConsumerState<HomeMore> createState() => _HomeMoreState();
}

class _HomeMoreState extends ConsumerState<HomeMore> {
  @override
  Widget build(BuildContext context) {
    final post = ref.watch(
      fetchFilteredPostsProvider(
        PublicationsResponseQuery(petType: widget.petType),
      ),
    );
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: PaginatedListView(
          state: post,
          itemBuilder: (_, data) => PetCard(
            publicationInfo: data,
          ),
          emptyListBuilder: (context) => Center(
            child: Text(
              'No hay publicaciones',
              style: FontConstants.body2.copyWith(color: Palette.textMedium),
              textAlign: TextAlign.center,
            ),
          ),
          notifier: ref.read(
            fetchFilteredPostsProvider(
              PublicationsResponseQuery(petType: widget.petType),
            ).notifier,
          ),
        ),
      ),
    );
  }
}
