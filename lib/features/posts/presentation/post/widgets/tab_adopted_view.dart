import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/features/posts/data/provider/publications_provider.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/widgets/cards/pet_card.dart';
import 'package:riverpod_infinite_scroll_pagination/riverpod_infinite_scroll_pagination.dart';

class TabAdoptedView extends ConsumerStatefulWidget {
  const TabAdoptedView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TabAdoptedViewState();
}

class _TabAdoptedViewState extends ConsumerState<TabAdoptedView> {
  @override
  Widget build(BuildContext context) {
    final post = ref.watch(myPostListProvider('ADOPTADO'));
    return PaginatedListView(
      state: post,
      itemBuilder: (_, data) => PetCard(
        publicationInfo: data,
        isOwner: true,
      ),
      emptyListBuilder: (context) => Center(
        child: Text(
          'No has dado en adopción a ninguna mascota por el momento',
          style: FontConstants.body2.copyWith(color: Palette.textMedium),
          textAlign: TextAlign.center,
        ),
      ),
      notifier: ref.read(
        myPostListProvider('ADOPTADO').notifier,
      ),
    );
  }
}
