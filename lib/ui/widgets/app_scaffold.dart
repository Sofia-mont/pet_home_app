import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_home/ui/icons/custom_icons.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({required this.child, super.key});

  final Widget child;
  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int index) => _onTap(index),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: const Color(0xFf70B765),
        unselectedItemColor: const Color(0xFf70B765),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              CustomIcons.home,
            ),
            activeIcon: Icon(
              CustomIcons.home_fill,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              CustomIcons.paw_fill,
            ),
            icon: Icon(
              CustomIcons.paw,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              CustomIcons.heart_fill,
            ),
            icon: Icon(
              CustomIcons.heart,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              CustomIcons.user_fill,
            ),
            icon: Icon(
              CustomIcons.user,
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/index')) {
      return 0;
    }
    if (location.startsWith('/profile')) {
      return 1;
    }
    if (location.startsWith('/my-publications')) {
      return 2;
    }
    if (location.startsWith('/favorites')) {
      return 3;
    }
    return 0;
  }

  void _onTap(int value) {
    switch (value) {
      case 0:
        return context.go('/index');
      case 1:
        return context.go('/profile');
      case 2:
        return context.go('/my-publications');
      case 3:
        return context.go('/favorites');
      default:
        return context.go('/index');
    }
  }
}
