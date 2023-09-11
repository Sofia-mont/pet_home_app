import 'package:flutter/material.dart';
import 'package:pet_home/features/favorites/ui/favorites_screen.dart';
import 'package:pet_home/features/home/ui/index_home.dart';
import 'package:pet_home/features/profile/ui/profile_screen.dart';
import 'package:pet_home/features/publications/ui/my_publications_screen.dart';
import 'package:pet_home/ui/icons/custom_icons.dart';
import 'package:pet_home/ui/widgets/bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();

  final screens = [
    const IndexHome(),
    const MyPublicationsScreen(),
    const FavoritesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.grey.withOpacity(0.2),
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
      body: Container(),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
