import 'package:flutter/material.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';

class TextWithTitle extends StatelessWidget {
  const TextWithTitle({
    required this.title,
    required this.text,
    this.boldTitle = false,
    this.alignment = CrossAxisAlignment.start,
    super.key,
  });

  final String title;
  final String text;
  final bool boldTitle;
  final CrossAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          title,
          style: boldTitle ? FontConstants.body1 : FontConstants.body2,
        ),
        Text(
          text,
          style: FontConstants.body2.copyWith(color: Palette.textMedium),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
