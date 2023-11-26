import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_home/ui/constants/pethome_icons.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  /// Constructs an [ScaffoldWithNavBar].
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(Pethome.home_filled),
            icon: Icon(Pethome.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Pethome.paw_filled),
            icon: Icon(Pethome.paw_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Pethome.heart_filled),
            icon: Icon(Pethome.heart_outlined),
            label: '',
          ),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => _onTap(context, index),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
