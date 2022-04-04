import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpTheme {
  static const Color helpYellow = Color(0xFFF7C548);
  static const Color helpDarkGrey = Color(0xFF555555);
  static const Color helpWhiteIce = Color(0xFFF2F2F2);
  static const Color helpButton = Color(0xFF555555);

  static ThemeData theme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
        )),
    brightness: Brightness.dark,
    primaryColor: helpYellow,
    // outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle()
  );
}
