import 'package:flutter/material.dart';
import 'package:pet_home/ui/icons/custom_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
          child: Image.asset('assets/img/images/pethome_logo.png'),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              CustomIcons.chat_blubble,
              color: Color(0xFf70B765),
            ),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              CustomIcons.home,
              color: Color(0xFf70B765),
            ),
            activeIcon: Icon(
              CustomIcons.home_fill,
              color: Color(0xFf70B765),
            ),
            label: '1',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.chat_bubble_sharp,
              color: Color(0xFf70B765),
            ),
            icon: Icon(
              Icons.chat_bubble_outline_outlined,
              color: Color(0xFf70B765),
            ),
            label: '2',
          ),
        ],
      ),
    );
  }
}
