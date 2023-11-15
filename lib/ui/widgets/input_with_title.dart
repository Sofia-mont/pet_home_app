import 'package:flutter/material.dart';

class InputWithText extends StatefulWidget {
  const InputWithText({
    this.isRequired = false,
    required this.title,
    required this.hintText,
    super.key,
  });

  final String title;
  final String hintText;
  final bool isRequired;

  @override
  State<InputWithText> createState() => _InputWithTextState();
}

class _InputWithTextState extends State<InputWithText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(widget.title),
            if (widget.isRequired)
              const Text(
                '*',
                style: TextStyle(color: Color(0xFFDF3333), fontSize: 24),
              ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: widget.hintText,
            // ignore: prefer_const_constructors
            hintStyle: TextStyle(color: const Color(0xFFA7A7A7)),
          ),
        ),
      ],
    );
  }
}
