import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/features/adoption/presentation/postulations/widgets/tab_postulations_pending.dart';
import 'package:pet_home/features/adoption/presentation/postulations/widgets/tab_postulations_rejected_view.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';

class PostulationsListScreen extends ConsumerStatefulWidget {
  const PostulationsListScreen({required this.postId, super.key});

  final String postId;
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
      appBar: AppBar(
        elevation: 0,
        bottom: TabBar(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: [
                  TabPostulationsPending(
                    postId: widget.postId,
                  ),
                  TabPostulationsRejected(
                    postId: widget.postId,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
