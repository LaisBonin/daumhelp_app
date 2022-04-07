import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpTheme {
  static const Color helpYellow = Color(0xFFF7C548);
  static const Color helpDarkGrey = Color(0xFF555555);
  static const Color helpDarkGreyShadow = Color.fromARGB(76, 85, 85, 85);
  static const Color helpWhiteIce = Color(0xFFF2F2F2);
  static const Color helpButtonText = Color(0xFF000000);
  static const Color helpErrorText = Color(0xFFFE6666);

  static ThemeData theme = ThemeData(
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: helpWhiteIce,
        fontFamily: GoogleFonts.poppins().fontFamily,
        letterSpacing: 1,
      ),
      titleMedium: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: helpWhiteIce,
        fontFamily: GoogleFonts.poppins().fontFamily,
        letterSpacing: 1,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: helpWhiteIce,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: helpWhiteIce,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
    ),
    brightness: Brightness.dark,
    primaryColor: helpYellow,
    errorColor: helpErrorText,
    backgroundColor: helpDarkGrey,
    shadowColor: helpButtonText,
    canvasColor: helpWhiteIce,
    hoverColor: helpDarkGreyShadow,
  );
}
