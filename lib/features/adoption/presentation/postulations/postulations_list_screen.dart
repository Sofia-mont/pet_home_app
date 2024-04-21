import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/features/adoption/presentation/postulations/widgets/tab_postulations_pending.dart';
import 'package:pet_home/features/adoption/presentation/postulations/widgets/tab_postulations_rejected_view.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';

class PostulationsListScreen extends ConsumerStatefulWidget {
  const PostulationsListScreen({super.key});

  static const path = '/postulations';

  @override
  ConsumerState<PostulationsListScreen> createState() =>
      _PostulationsListScreenState();
}

class _PostulationsListScreenState extends ConsumerState<PostulationsListScreen>
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
      body: Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            TabBar(
              indicator: const BoxDecoration(
                color: Palette.primaryLighter,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              labelStyle:
                  FontConstants.body1.copyWith(color: Palette.primaryDarker),
              unselectedLabelStyle:
                  FontConstants.body2.copyWith(color: Palette.textLight),
              controller: tabController,
              tabs: const [
                Tab(text: 'Pendientes'),
                Tab(text: 'Rechazados'),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: const [
                  TabPostulationsPending(),
                  TabPostulationsRejected(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
