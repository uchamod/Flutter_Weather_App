import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whether_app/util/constant.dart';

class AppThemeData {
  final ThemeData lightmode = ThemeData(
    brightness: Brightness.light,
    fontFamily: GoogleFonts.poppins().fontFamily,
    scaffoldBackgroundColor: light,
    iconTheme: const IconThemeData(color: dark),
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: dark,
        fontSize: 32,
      ),
      labelSmall: TextStyle(
        color: dark,
        fontSize: 10,
      ),
      bodyMedium: TextStyle(
        color: dark,
        fontSize: 18,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: dark,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: dark,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: dark,
        ),
      ),
    ),
  );

  final ThemeData darkmode = ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
    scaffoldBackgroundColor: dark,
    iconTheme: const IconThemeData(color: light),
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: light, fontSize: 32),
      labelSmall: TextStyle(
        color: light,
        fontSize: 12,
      ),
      bodyMedium: TextStyle(
        color: light,
        fontSize: 18,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: light,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: light,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: light,
        ),
      ),
    ),
  );
}
