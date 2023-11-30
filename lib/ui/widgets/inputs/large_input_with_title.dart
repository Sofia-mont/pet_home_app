import 'package:flutter/material.dart';
import 'package:pet_home/ui/constants/font_constants.dart';

class LargeInputWithText extends StatefulWidget {
  const LargeInputWithText({
    this.isRequired = false,
    required this.title,
    required this.hintText,
    super.key,
  });

  final String title;
  final String hintText;
  final bool isRequired;

  @override
  State<LargeInputWithText> createState() => _LargeInputWithTextState();
}

class _LargeInputWithTextState extends State<LargeInputWithText> {
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
                style: FontConstants.caption2
                    .copyWith(color: const Color(0xFFDF3333)),
              ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          minLines: 3,
          maxLines: 10,
          keyboardType: TextInputType.multiline,
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
