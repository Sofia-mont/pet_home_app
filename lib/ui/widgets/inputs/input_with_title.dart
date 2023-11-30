import 'package:flutter/material.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';

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
            Flexible(
              child: Text(
                widget.title,
                style: FontConstants.body2,
              ),
            ),
            if (widget.isRequired)
              Text(
                ' *',
                style:
                    FontConstants.caption2.copyWith(color: Palette.errorDark),
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
            hintStyle: const TextStyle(color: Palette.textMedium),
          ),
        ),
      ],
    );
  }
}
