import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//fix colors later

ThemeData darkModeTheme = ThemeData(
  textTheme: TextTheme(
    titleLarge: GoogleFonts.dynaPuff(),
    titleMedium: GoogleFonts.dynaPuff(),
    titleSmall: GoogleFonts.dynaPuff(),
    headlineLarge: GoogleFonts.dynaPuff(),
    headlineMedium: GoogleFonts.dynaPuff(),
    headlineSmall: GoogleFonts.dynaPuff(),
    bodyLarge: GoogleFonts.mynerve(),
    bodyMedium: GoogleFonts.mynerve(),
    bodySmall: GoogleFonts.mynerve(),
    labelLarge: GoogleFonts.dynaPuff(),
    labelMedium: GoogleFonts.dynaPuff(),
    labelSmall: GoogleFonts.dynaPuff(),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: GoogleFonts.dynaPuff(
      textStyle: const TextStyle(color: Color.fromARGB(255, 85, 193, 98)),
    ),
    unselectedLabelStyle: GoogleFonts.dynaPuff(
      textStyle: const TextStyle(color: Color.fromARGB(255, 179, 183, 175)),
    ),
    elevation: 0.0,
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 54, 106, 60),
    surface: const Color.fromARGB(255, 4, 36, 8), 
    primary: const Color.fromARGB(255, 193, 250, 199),
    secondary: const Color.fromARGB(255, 116, 162, 122),

  ),
);
