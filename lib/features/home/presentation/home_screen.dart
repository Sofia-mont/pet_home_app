import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/home/presentation/home_more_screen.dart';
import 'package:pet_home/features/home/presentation/widget/home_drawer.dart';
import 'package:pet_home/features/home/presentation/widget/home_speed_dial.dart';
import 'package:pet_home/features/posts/data/provider/publications_provider.dart';
import 'package:pet_home/features/posts/domain/posts/publications_search_query/publications_search_query.dart';
import 'package:pet_home/ui/widgets/cards/pet_card.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:riverpod_infinite_scroll_pagination/riverpod_infinite_scroll_pagination.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({this.showBottomBar = true, super.key});

  final bool showBottomBar;

  static const path = '/';

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const HomeDrawer(),
      floatingActionButton: const HomeSpeedDial(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Perros en adopción',
                    style: FontConstants.subtitle1
                        .copyWith(color: Palette.primary),
                  ),
                  InkWell(
                    onTap: () => ref.read(appRouterProvider).pushNamed(
                      HomeMore.path,
                      queryParameters: {'petType': 'Perro'},
                    ),
                    child: Text(
                      'Ver más',
                      style: FontConstants.caption2.copyWith(
                        color: Palette.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: Palette.primary,
                      ),
                    ),
                  ),
                ],
              ),
              PaginatedListView(
                state: ref.watch(
                  fetchFilteredPostsProvider(
                    PublicationsResponseQuery(petType: 'Perro'),
                  ),
                ),
                itemBuilder: (_, data) => PetCard(publicationInfo: data),
                loadingBuilder: (context, pagination) => const SizedBox(
                  height: 260,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                listViewBuilder: (context, data) {
                  return SizedBox(
                    height: 260,
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (_, index) {
                        final indexInPage = index % 10;
                        if (indexInPage >= data.length) {
                          return null;
                        }
                        final post = data[index];
                        return PetCard(
                          isHome: true,
                          publicationInfo: post,
                        );
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  );
                },
                notifier: ref.read(
                  fetchFilteredPostsProvider(
                    PublicationsResponseQuery(petType: 'Perro'),
                  ).notifier,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Gatos en adopción',
                    style: FontConstants.subtitle1
                        .copyWith(color: Palette.primary),
                  ),
                  InkWell(
                    onTap: () => ref.read(appRouterProvider).pushNamed(
                      HomeMore.path,
                      queryParameters: {'petType': 'Gato'},
                    ),
                    child: Text(
                      'Ver más',
                      style: FontConstants.caption2.copyWith(
                        color: Palette.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: Palette.primary,
                      ),
                    ),
                  ),
                ],
              ),
              PaginatedListView(
                state: ref.watch(
                  fetchFilteredPostsProvider(
                    PublicationsResponseQuery(petType: 'Gato'),
                  ),
                ),
                itemBuilder: (_, data) => PetCard(publicationInfo: data),
                loadingBuilder: (context, pagination) => const SizedBox(
                  height: 260,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                listViewBuilder: (context, data) {
                  return SizedBox(
                    height: 260,
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (_, index) {
                        final indexInPage = index % 10;
                        if (indexInPage >= data.length) {
                          return null;
                        }
                        final post = data[index];
                        return PetCard(isHome: true, publicationInfo: post);
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  );
                },
                notifier: ref.read(
                  fetchFilteredPostsProvider(
                    PublicationsResponseQuery(petType: 'Gato'),
                  ).notifier,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
