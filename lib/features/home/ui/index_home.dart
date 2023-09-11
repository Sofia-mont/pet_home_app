import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IndexHome extends StatelessWidget {
  const IndexHome({this.showBottomBar = true, super.key});

  final bool showBottomBar;

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: ElevatedButton(
        onPressed: () => {context.push('/login')},
        child: const Text('OPRIMIR'),
      ),
    );
  }
}
