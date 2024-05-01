import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/features/home/presentation/widget/home_drawer.dart';
import 'package:pet_home/features/home/presentation/widget/home_speed_dial.dart';
import 'package:pet_home/features/publications/data/provider/publications_provider.dart';
import 'package:pet_home/features/publications/domain/posts/publications_search_query.dart';
import 'package:pet_home/ui/widgets/cards/pet_card.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';

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
    final responseAsync = ref.watch(
      fetchPublicationsProvider(page: 0),
    );
    final totalResults = responseAsync.valueOrNull?.data.length;
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
                  Text(
                    'Ver más',
                    style: FontConstants.caption2.copyWith(
                      color: Palette.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: Palette.primary,
                    ),
                  ),
                ],
              ),
              Builder(
                builder: (context) {
                  final responseAsync = ref.watch(
                    fetchPublicationsProvider(
                      page: 1,
                      query: PublicationsResponseQuery(petType: 'Perro'),
                    ),
                  );
                  return responseAsync.when(
                    data: (data) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                        child: ListView.builder(
                          itemCount: totalResults,
                          itemBuilder: (_, index) {
                            final indexInPage = index % 10;
                            if (indexInPage >= data.data.length) {
                              return null;
                            }
                            final post = data.data[index];
                            return PetCard(petName: post.petName);
                          },
                          scrollDirection: Axis.horizontal,
                        ),
                      );
                    },
                    error: (error, stackTrace) {
                      return const SizedBox.shrink();
                    },
                    loading: () => const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 50),
                        child: CircularProgressIndicator(
                          color: Palette.secondary,
                        ),
                      ),
                    ),
                  );
                },
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
                  Text(
                    'Ver más',
                    style: FontConstants.caption2.copyWith(
                      color: Palette.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: Palette.primary,
                    ),
                  ),
                ],
              ),
              Builder(
                builder: (context) {
                  final responseAsync = ref.watch(
                    fetchPublicationsProvider(
                      page: 1,
                      query: PublicationsResponseQuery(petType: 'Gato'),
                    ),
                  );
                  return responseAsync.when(
                    data: (data) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                        child: ListView.builder(
                          itemCount: totalResults,
                          itemBuilder: (_, index) {
                            final indexInPage = index % 10;
                            if (indexInPage >= data.data.length) {
                              return null;
                            }
                            final post = data.data[index];
                            return PetCard(petName: post.petName);
                          },
                          scrollDirection: Axis.horizontal,
                        ),
                      );
                    },
                    error: (error, stackTrace) {
                      return const SizedBox.shrink();
                    },
                    loading: () => const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 50),
                        child: CircularProgressIndicator(
                          color: Palette.secondary,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
