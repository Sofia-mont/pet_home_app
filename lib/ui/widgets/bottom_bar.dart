import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_home/ui/icons/custom_icons.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    const position = 0;

    return BottomNavigationBar(
      currentIndex: position,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: const Color(0xFf70B765),
      unselectedItemColor: const Color(0xFf70B765),
      type: BottomNavigationBarType.fixed,
      onTap: (value) => _onTap(value),
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
    );
  }

  void _onTap(int index) {
    switch (index) {
      case 0:
        context.go('route');
        break;
      case 1:
        context.go('route');
        break;
      case 2:
        context.go('route');
        break;
      case 3:
        context.go('route');
        break;
      default:
    }
  }
}
