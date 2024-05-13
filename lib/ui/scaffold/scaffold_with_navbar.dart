import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_home/features/adoption/presentation/my_postulations/my_postulations_screen.dart';
import 'package:pet_home/features/home/presentation/home_screen.dart';
import 'package:pet_home/features/posts/presentation/post/my_posts_screen.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/constants/pethome_icons.dart';
import 'package:pet_home/ui/scaffold/scaffold_controller.dart';

class ScaffoldWithNavBar extends ConsumerStatefulWidget {
  const ScaffoldWithNavBar({
    required this.widget,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));
  final Widget widget;

  @override
  ConsumerState<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends ConsumerState<ScaffoldWithNavBar> {
  @override
  Widget build(BuildContext context) {
    final position = ref.watch(scaffoldControllerProvider);
    return Scaffold(
      body: widget.widget,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Palette.primary,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(Pethome.home_filled),
            icon: Icon(Pethome.home_outlined),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Pethome.paw_filled),
            icon: Icon(Pethome.paw_outlined),
            label: 'Mis publicaciones',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Pethome.heart_filled),
            icon: Icon(Pethome.heart_outlined),
            label: 'Mis postulaciones',
          ),
        ],
        currentIndex: position,
        onTap: (int index) => _onTap(index),
      ),
    );
  }

  void _onTap(int index) {
    ref.read(scaffoldControllerProvider.notifier).setPosition(index);
    switch (index) {
      case 0:
        context.go(HomeScreen.path);
        break;
      case 1:
        context.go(MyPostsScreen.path);
        break;
      case 2:
        context.go(MyPostulationsScreen.path); // TODO : Anadir pantalla
        break;
    }
  }
}
