import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/features/posts/data/provider/publications_provider.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/widgets/cards/pet_card.dart';
import 'package:riverpod_infinite_scroll_pagination/riverpod_infinite_scroll_pagination.dart';

class MyPostulationsScreen extends ConsumerStatefulWidget {
  const MyPostulationsScreen({super.key});

  static const path = '/my-postulations';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MyPostulationsScreenState();
}

class _MyPostulationsScreenState extends ConsumerState<MyPostulationsScreen> {
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final posts = ref.watch(myPostulationsProvider);
    final notifier = ref.read(myPostulationsProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mis postulaciones',
          style: TextStyle(color: Palette.primary),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          controller: controller,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Aquí puedes ver todas las mascotas a las cuales te postulaste para adoptar',
                  style: FontConstants.body2.copyWith(
                    color: Palette.textLight,
                  ),
                  textAlign: TextAlign.center,
                ),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      const Icon(
                        Icons.hourglass_bottom_rounded,
                        color: Palette.textMedium,
                      ),
                      Text(
                        'Aún no has enviado tu postulación de adopción a ninguna mascota',
                        style: FontConstants.body2.copyWith(
                          color: Palette.textMedium,
                        ),
                        textAlign: TextAlign.center,
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
