import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/publications/ui/widgets/pet_description.dart';
import 'package:pet_home/features/publications/ui/widgets/pet_history.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/constants/pethome_icons.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';

class PublicationScreen extends ConsumerStatefulWidget {
  const PublicationScreen({super.key});

  @override
  ConsumerState<PublicationScreen> createState() => _PublicationScreenState();
}

class _PublicationScreenState extends ConsumerState<PublicationScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: MediaQuery.of(context).size.height / 3.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://estaticos-cdn.prensaiberica.es/clip/823f515c-8143-4044-8f13-85ea1ef58f3a_16-9-discover-aspect-ratio_default_0.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Pethome.female,
                      color: Colors.pink,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Firulais',
                      style: FontConstants.body1.copyWith(
                        color: Palette.primary00,
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Pethome.heart_outlined,
                  color: Palette.primary00,
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10.0, bottom: 20),
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                      child: TabBar(
                        indicator: BoxDecoration(
                          color: Palette.primary30L,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        unselectedLabelColor: Palette.textMedium,
                        controller: tabController,
                        labelStyle: FontConstants.body2,
                        tabs: const [
                          Tab(
                            text: 'Descripción',
                          ),
                          Tab(
                            text: 'Mi historia',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: const [PetDescription(), PetHistory()],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: LargeButton(
          onPressed: () => {
            ref
                .read(appRouterProvider)
                .push(RoutePath.adoptionPersonalData.path),
          },
          text: 'Adoptame',
        ),
      ),
    );
  }
}
