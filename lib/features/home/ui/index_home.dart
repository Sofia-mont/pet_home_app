import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_home/ui/icons/custom_icons.dart';

class IndexHome extends StatelessWidget {
  const IndexHome({this.showBottomBar = true, super.key});

  final bool showBottomBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset('assets/img/pethome_logo.png'),
        ),
        actions: [
          IconButton(
            icon: const Icon(CustomIcons.chat_blubble),
            onPressed: () {},
            color: const Color(0xFf70B765),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            OutlinedButton(
              onPressed: () => {context.push('/login')},
              child: const Text('OPRIMIR'),
            ),
            const TextField(),
          ],
        ),
      ),
    );
  }
}
