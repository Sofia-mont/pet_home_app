import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/features/posts/data/provider/publications_provider.dart';
import 'package:pet_home/features/posts/domain/posts_search_query.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/widgets/cards/pet_card.dart';
import 'package:riverpod_infinite_scroll_pagination/riverpod_infinite_scroll_pagination.dart';

class FilteredPostsScreen extends ConsumerStatefulWidget {
  const FilteredPostsScreen({required this.query, super.key});

  static const path = '/filtered-posts';

  final PostsResponseQuery? query;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FilteredPostsScreenState();
}

class _FilteredPostsScreenState extends ConsumerState<FilteredPostsScreen> {
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final chipData = [
      if (widget.query?.petType != '') widget.query?.petType!,
      if (widget.query?.petSex != '') widget.query?.petSex!,
      if (widget.query?.petSize != '') widget.query?.petSize!,
      if (widget.query?.department != '') widget.query?.department!,
      if (widget.query?.city != '') widget.query?.city!,
    ];
    final posts = ref.watch(fetchFilteredPostsProvider(widget.query));
    final notifier =
        ref.read(fetchFilteredPostsProvider(widget.query).notifier);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: CustomScrollView(
          controller: controller,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Wrap(
                    children: [
                      for (var data in chipData)
                        Chip(
                          label: Text(
                            data!,
                            style: FontConstants.body2
                                .copyWith(color: Palette.textMedium),
                          ),
                        ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Aquí podrás ver los resultados de las mascotas filtradas',
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
                scrollController: controller,
                useSliver: true,
                state: posts,
                itemBuilder: (context, data) => PetCard(publicationInfo: data),
                notifier: notifier,
                emptyListBuilder: (context) => SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      const Icon(Icons.hourglass_bottom_rounded),
                      Center(
                        child: Text(
                          'No se han encontrado publicaciones',
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
        ),
      ),
    );
  }
}
