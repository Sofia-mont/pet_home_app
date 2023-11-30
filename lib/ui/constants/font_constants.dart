import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontConstants {
  static final _baseFont = GoogleFonts.robotoTextTheme().bodyMedium!;

  static final textTheme = GoogleFonts.robotoTextTheme(
    TextTheme(
      displayLarge: heading1,
      displayMedium: heading2,
      displaySmall: heading3,
      titleMedium: subtitle1,
      titleSmall: subtitle2,
      bodyLarge: body1,
      bodyMedium: body2,
      bodySmall: caption1,
      labelLarge: body1,
      labelSmall: subCaption1,
    ),
  );

  static final TextStyle heading1 = _baseFont.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle heading2 = _baseFont.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle heading3 = _baseFont.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle subtitle1 = _baseFont.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle subtitle2 = _baseFont.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle body1 = _baseFont.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle body2 = _baseFont.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle caption1 = _baseFont.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle caption2 = _baseFont.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle subCaption1 = _baseFont.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle subCaption2 = _baseFont.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}
