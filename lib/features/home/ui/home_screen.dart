import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_home/core/router/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({this.showBottomBar = true, super.key});

  final bool showBottomBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset('assets/img/pethome_logo.png'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            OutlinedButton(
              onPressed: () => context.push(RoutePath.adoptionAlert.path),
              child: const Text('OPRIMIR'),
            ),
            const TextField(),
          ],
        ),
      ),
    );
  }
}
