import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/posts/data/provider/publications_provider.dart';
import 'package:pet_home/features/tracking/presentation/tracking_screen.dart';
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
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFFD95A59),
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
          child: InkWell(
            onTap: () =>
                ref.read(appRouterProvider).pushNamed(TrackingScreen.path),
            child: Row(
              children: [
                Image.asset(
                  'assets/img/tracking-list.png',
                  width: 70,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Seguimiento post-adopción',
                        style: FontConstants.body1
                            .copyWith(color: Palette.textLighter),
                      ),
                      Text(
                        'Ingresa aquí para realizar un seguimiento de las mascotas que ya has dado en adopción',
                        style: FontConstants.caption2
                            .copyWith(color: Palette.textLighter),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: PaginatedListView(
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
          ),
        ),
      ],
    );
  }
}
