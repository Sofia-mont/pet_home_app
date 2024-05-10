import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/features/publications/presentation/post/widgets/tab_adopted_view.dart';
import 'package:pet_home/features/publications/presentation/post/widgets/tab_pendig_view.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';

class MyPostsScreen extends ConsumerStatefulWidget {
  const MyPostsScreen({this.showBottomBar = true, super.key});

  static const path = '/my-publications';
  final bool showBottomBar;

  @override
  ConsumerState<MyPostsScreen> createState() => _MyPostsScreenState();
}

class _MyPostsScreenState extends ConsumerState<MyPostsScreen>
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
        title: const Center(
          child: Text(
            'Mis publicaciones',
            style: TextStyle(color: Palette.primary),
          ),
        ),
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
            Tab(text: 'En adopción'),
            Tab(text: 'Adoptados'),
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
                children: const [
                  TabPendingView(),
                  TabAdoptedView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
