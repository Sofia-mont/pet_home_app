import 'package:flutter/material.dart';
import 'package:pet_home/ui/constants/font_constants.dart';

class InputWithText extends StatefulWidget {
  const InputWithText({
    this.isRequired = false,
    this.obscureText = false,
    required this.title,
    required this.hintText,
    super.key,
  });

  final String title;
  final String hintText;
  final bool isRequired;
  final bool obscureText;

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
            Text(
              widget.title,
              style: FontConstants.body2,
            ),
            if (widget.isRequired)
              Text(
                ' *',
                style: FontConstants.body1
                    .copyWith(color: const Color(0xFFDF3333)),
              ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          obscureText: widget.obscureText,
          style: FontConstants.body2,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Color(0xFFA7A7A7)),
          ),
        ),
      ],
    );
  }
}
