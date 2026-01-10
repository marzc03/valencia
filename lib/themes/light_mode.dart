import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightModeTheme = ThemeData(
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
      textStyle: const TextStyle(color: Color.fromARGB(255, 54, 106, 60)),
    ),
    unselectedLabelStyle: GoogleFonts.dynaPuff(
      textStyle: const TextStyle(color: Color.fromARGB(255, 113, 116, 109)),
    ),
    elevation: 0.0,
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 0, 255, 102),
  ),
);
