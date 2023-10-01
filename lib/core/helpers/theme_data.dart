import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: const Color(0xFFF57C00),
  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFF57C00),
    foregroundColor: Colors.white,
  ),
  fontFamily: GoogleFonts.rubik().fontFamily,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      color: Colors.black,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFFF57C00),
    textTheme: ButtonTextTheme.primary,
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Color(0xFFF57C00),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFF57C00),
    foregroundColor: Colors.white,
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Color(0xFFFFFFFF),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedLabelStyle: TextStyle(
      color: Color(0xFFF57C00),
    ),
    selectedItemColor: Color(0xFFF57C00),
    selectedIconTheme: IconThemeData(
      color: Color(0xFFF57C00),
    ),
  ),
);
