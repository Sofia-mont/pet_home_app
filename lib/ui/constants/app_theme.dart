import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_home/ui/constants/font_constants.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: false,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      shadowColor: const Color(0xFF9A9A9A),
      scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      brightness: Brightness.light,
      primaryColor: const Color(0xFf70B765),
      focusColor: const Color(0xFf70B765),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleTextStyle: FontConstants.subtitle1,
        elevation: 1,
        iconTheme: const IconThemeData(color: Color(0xFf70B765)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        unselectedItemColor: Color(0xFf70B765),
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: FontConstants.body1,
          backgroundColor: const Color(0xFf70B765),
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
            const BorderSide(color: Color(0xFf70B765), width: 2),
          ),
        ),
      ),
      textTheme: FontConstants.textTheme.apply(
        bodyColor: const Color(0xFF3C3C3C),
        displayColor: const Color(0xFF3C3C3C),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xFf70B765),
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
            return const Color(0xFFD1343C);
          } else if (states.contains(MaterialState.error)) {
            return const Color(0xFFD1343C);
          } else {
            return const Color(0xFf70B765);
          }
        }),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: const Color(0xFf70B765),
        focusColor: const Color(0xFf70B765),
        hoverColor: const Color(0xFf70B765),
        contentPadding: const EdgeInsets.all(10),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF9A9A9A)),
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
        labelStyle:
            FontConstants.body2.copyWith(color: const Color(0xFF9A9A9A)),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFf70B765), width: 1.8),
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
      ),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal).copyWith(
        primary: const Color(0xFf70B765),
        secondary: const Color(0xFf70B765),
      ),
    );
  }
}
