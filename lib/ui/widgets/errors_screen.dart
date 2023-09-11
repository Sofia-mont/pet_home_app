import 'package:flutter/material.dart';

class ErrorsScreen extends StatefulWidget {
  const ErrorsScreen({required this.msg, super.key});

  final String msg;
  @override
  State<ErrorsScreen> createState() => _ErrorsScreenState();
}

class _ErrorsScreenState extends State<ErrorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
