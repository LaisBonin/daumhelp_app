import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpTheme {
  static const Color helpYellow = Color(0xFFF7C548);
  static const Color helpDarkGrey = Color(0xFF555555);
  static const Color helpWhiteIce = Color(0xFFF2F2F2);
  static const Color helpButtonText = Color(0xFF000000);
  static const Color helpErrorText = Color(0xFFFE6666);

  static ButtonStyle yellowButtonLarge(){
    
   
    return ElevatedButton.styleFrom(
        primary: helpYellow,
        fixedSize: const Size(309, 60),
        elevation: 50,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ));
  }
  static ButtonStyle yellowButtonSmall(){
    
   
    return ElevatedButton.styleFrom(
        primary: helpYellow,
        fixedSize: const Size(337, 38),
        elevation: 50,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ));
  }

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
