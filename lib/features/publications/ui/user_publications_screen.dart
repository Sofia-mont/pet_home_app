import 'package:flutter/material.dart';

class UserPublicationsScreen extends StatelessWidget {
  const UserPublicationsScreen({this.showBottomBar = true, super.key});

  static const path = '/user-publications';
  final bool showBottomBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
