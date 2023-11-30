import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: false,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      shadowColor: Palette.textMedium,
      scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      brightness: Brightness.light,
      primaryColor: Palette.primary00,
      focusColor: Palette.primary10L,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleTextStyle: FontConstants.subtitle1,
        elevation: 1,
        iconTheme: const IconThemeData(color: Palette.primary00),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        unselectedItemColor: Palette.primary00,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: FontConstants.body1,
          backgroundColor: Palette.primary00,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          elevation: 0.0,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: FontConstants.body1,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(FontConstants.body1),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          side: MaterialStateProperty.all(
            const BorderSide(color: Palette.primary00, width: 2),
          ),
        ),
      ),
      textTheme: FontConstants.textTheme.apply(
        bodyColor: Palette.textDark,
        displayColor: Palette.textDark,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Palette.primary00,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        textTheme: ButtonTextTheme.accent,
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.resolveWith((states) {
          return Colors.white;
        }),
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.white;
          } else if (states.contains(MaterialState.error)) {
            return Palette.errorDark;
          } else if (states.contains(MaterialState.error)) {
            return Palette.errorDark;
          } else {
            return Palette.primary00;
          }
        }),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Palette.primary00,
        focusColor: Palette.primary00,
        hoverColor: Palette.primary00,
        contentPadding: const EdgeInsets.all(10),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Palette.textMedium),
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
        labelStyle: FontConstants.body2.copyWith(color: Palette.textMedium),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Palette.primary00, width: 1.8),
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
      ),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal).copyWith(
        primary: Palette.primary00,
        secondary: Palette.primary00,
      ),
    );
  }
}
